# frozen_string_literal: true

class AddCommentableCounterCacheToIframes < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_nbs_iframes, :comments_count, :integer, null: false, default: 0, index: true
    Decidim::Nbs::Post.reset_column_information
    Decidim::Nbs::Post.find_each(&:update_comments_count)
  end
end
