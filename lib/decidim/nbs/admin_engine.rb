# frozen_string_literal: true

module Decidim
  module Nbs
    # This is the admin interface for `decidim-nbs`. It lets you edit and
    # configure the blog associated to a participatory process.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::Nbs::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        resources :posts do
          resources :attachment_collections, except: [:show]
          resources :attachments, except: [:show]
        end
        root to: "posts#index"
      end

      def load_seed
        nil
      end
    end
  end
end
