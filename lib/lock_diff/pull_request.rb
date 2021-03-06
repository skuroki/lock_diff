module LockDiff
  class PullRequest
    attr_reader :repository, :number

    class NotFoundPullRequest < StandardError; end

    def initialize(repository:, number:)
      @repository = repository
      @number = number
      @pr = LockDiff.client.pull_request(repository, number)
    rescue => e
      message = "Not found pull request by (repository: #{repository}, number: #{number}, client: #{LockDiff.client.class}). Becase of #{e.inspect}"
      LockDiff.logger.warn(message)
      raise NotFoundPullRequest.new(message)
    end

    def base_sha
      @pr.base_sha
    end

    def head_sha
      @pr.head_sha
    end

    def find_content_path(file_name)
      LockDiff.client.pull_request_content_path(@repository, @number, file_name)
    end

  end
end
