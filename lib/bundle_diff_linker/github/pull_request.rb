module BundleDiffLinker
  module Github
    class PullRequest
      def initialize(pull_request)
        @pr = pull_request
      end

      def base_sha
        @pr.base.sha
      end

      def head_sha
        @pr.head.sha
      end
    end
  end
end
