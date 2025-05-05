# frozen_string_literal: true

class AddPublishedAtToDecidimNbsIframes < ActiveRecord::Migration[6.1]
  class Post < ApplicationRecord
    self.table_name = :decidim_nbs_iframes
  end

  def change
    add_column :decidim_nbs_iframes, :published_at, :datetime

    reversible do |direction|
      direction.up do
        Post.update_all("published_at = created_at") # rubocop:disable Rails/SkipsModelValidations
      end
    end
  end
end
