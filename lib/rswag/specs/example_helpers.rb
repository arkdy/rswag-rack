# frozen_string_literal: true

require "rswag/specs/request_factory"
require "rswag/specs/response_validator"
require "faraday"

module Rswag
  module Specs
    module ExampleHelpers
      def submit_request(metadata)
        request = RequestFactory.new.build_request(metadata, self)

        if request[:external_api]
          send_external_request(request)
        else
          send(
            request[:verb],
            request[:path],
            request[:payload],
            request[:headers]
          )
        end
      end

      def assert_response_matches_metadata(metadata)
        ResponseValidator.new.validate!(metadata, last_response)
      end

      private

      def send_external_request(request)
        connection = Faraday.new(
          url: request[:path],
          params: request[:payload],
          headers: request[:headers]
        )
        
        choise_faraday_method(request[:verb], connection)
      end

      def choise_faraday_method(method, connection)
        case method
        when :get
          connection.get
        when :post
          connection.post
        when :put
          connection.put
        when :patch
          connection.patch
        when :delete
          connection.delete
        end
      end
    end
  end
end
