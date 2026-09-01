# frozen_string_literal: true

class RenameNbsPostsEndorsementsCountToLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :decidim_nbs_iframes, :endorsements_count, :likes_count
  end
end
