# frozen_string_literal: true

require "rswag/specs/real_request_factory"
require "rswag/specs/request_factory"
require "rswag/specs/response_validator"
require "byebug"

module Rswag
  module Specs
    module ExampleHelpers
      def submit_request(metadata)
        request = RequestFactory.new.build_request(metadata, self)
        byebug
        # request = RealRequestFactory.new.build_request(metadata, self)

        if metadata[:path_item][:parameters][:api]
          request = RealRequestFactory.new.build_request(metadata, self)
        else
          request = RequestFactory.new.build_request(metadata, self)

          send(
            request[:verb],
            request[:path],
            request[:payload],
            request[:headers]
          )
        end

        # request = metadata[:path_item][:parameters][:api] ?
        #   RealRequestFactory.new.build_request(metadata, self) :
        #   RequestFactory.new.build_request(metadata, self)

        # send(
        #   request[:verb],
        #   request[:path],
        #   request[:payload],
        #   request[:headers]
        # )
      end

      def assert_response_matches_metadata(metadata)
        ResponseValidator.new.validate!(metadata, last_response)
      end
    end
  end
end
