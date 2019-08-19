class CreateAdminProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_products do |t|
      t.string :description
      t.string :barcode

      t.timestamps
    end
  end
end
