class AddAgeGenderAndHoursToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :age_range, :string
    add_column :providers, :gender, :string
    add_column :providers, :hours_of_operation, :string
  end
end
