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
        connection = Faraday.new

        connection.run_request(
          request[:verb],
          request[:path],
          request[:payload],
          request[:headers]
        )
      end
    end
  end
end
