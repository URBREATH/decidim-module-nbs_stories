# frozen_string_literal: true

module Decidim
  module Nbs
    # Custom helpers, scoped to the nbs engine.
    #
    module ApplicationHelper
      include PaginateHelper
      include SanitizeHelper
      include Decidim::Nbs::PostsHelper
      include ::Decidim::EndorsableHelper
      include ::Decidim::FollowableHelper
      include Decidim::Comments::CommentsHelper

      def component_name
        (defined?(current_component) && translated_attribute(current_component&.name).presence) || t("decidim.components.nbs.name")
      end
    end
  end
end
