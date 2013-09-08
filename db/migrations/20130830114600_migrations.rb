Sequel.migration do
  change do
    create_table(:countries) do
      primary_key :id
      String :gadm_id, :null=>false
      String :name, :null=>false
    end

    create_table(:primary_admin_areas) do
      primary_key :id
      String :gadm_id, :null=>false
      String :name, :null=>false
      foreign_key(:country_id, :countries)
    end

    create_table(:secondary_admin_areas) do
      primary_key :id
      String :gadm_id, :null=>false
      String :name, :null=>false
      foreign_key(:primary_admin_area_id, :primary_admin_areas)
    end

    create_table(:recipients) do
      primary_key :id
      String :global_recipient_id, :null=>false
      String :name
      String :zipcode
      foreign_key(:secondary_admin_area_id, :secondary_admin_areas)
    end

    create_table(:years) do
      primary_key :id
      Integer :year
    end

    create_table(:payments) do
      primary_key :id
      BigDecimal :amount_euro, :null=>false
      foreign_key(:recipient_id, :recipients)
      foreign_key(:year_id, :years)
    end

    create_table(:payments_total) do
      primary_key :id
      BigDecimal :amount_euro_2000
      BigDecimal :amount_euro_2001
      BigDecimal :amount_euro_2002
      BigDecimal :amount_euro_2003
      BigDecimal :amount_euro_2004
      BigDecimal :amount_euro_2005
      BigDecimal :amount_euro_2006
      BigDecimal :amount_euro_2007
      BigDecimal :amount_euro_2008
      BigDecimal :amount_euro_2009
      BigDecimal :amount_euro_2010
      BigDecimal :amount_euro_2011
      BigDecimal :amount_euro_2012
      BigDecimal :amount_euro_2013
      foreign_key(:recipient_id, :recipients)
    end
  end

end