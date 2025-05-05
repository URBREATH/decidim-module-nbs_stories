# frozen_string_literal: true

module Decidim
  module Nbs
    #
    # Decorator for posts
    #
    class PostPresenter < SimpleDelegator
      def author
        @author ||= if official?
                      Decidim::Nbs::OfficialAuthorPresenter.new
                    elsif user_group?
                      Decidim::UserGroupPresenter.new(super)
                    else
                      Decidim::UserPresenter.new(super)
                    end
      end
    end
  end
end
