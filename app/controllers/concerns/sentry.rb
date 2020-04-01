module Sentry
  extend ActiveSupport::Concern
  included do
    before_action :set_raven_context

    private

    def set_raven_context
      Raven.extra_context(params: params.to_hash, url: request.url)
    end
  end
end
