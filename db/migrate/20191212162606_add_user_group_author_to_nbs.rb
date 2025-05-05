# frozen_string_literal: true

class AddUserGroupAuthorToNbs < ActiveRecord::Migration[5.2]
  def change
    add_column :decidim_nbs_iframes, :decidim_user_group_id, :integer
  end
end
