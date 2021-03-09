# frozen_string_literal: true

require "rswag/specs/request_factory"
require "rswag/specs/response_validator"

module Rswag
  module Specs
    module ExampleHelpers
      def submit_request(metadata)
        request = RequestFactory.new.build_request(metadata, self)

        send(
          request[:verb],
          request[:path],
          request[:payload],
          request[:headers]
        )
      end

      def assert_response_matches_metadata(metadata)
        ResponseValidator.new.validate!(metadata, last_response)
      end
    end
  end
end
