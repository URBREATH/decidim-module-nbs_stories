# frozen_string_literal: true

class AddAuthorToDecidimNbsIframes < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_nbs_iframes, :decidim_author_id, :integer, index: true
  end
end
