# frozen_string_literal: true

module Decidim
  module Nbs
    #
    # A dummy presenter to abstract out the author of an official post.
    #
    class OfficialAuthorPresenter < Decidim::OfficialAuthorPresenter
      def name
        I18n.t("decidim.nbs.models.post.fields.official_blog_post")
      end
    end
  end
end
