class AddIssueNumberToComics < ActiveRecord::Migration[5.1]
  def change
    add_column :comics, :issue_number, :integer
  end
end
