CREATE TABLE completed_activities (
    reader_uuid uuid,
    activity_uuid uuid,
    CONSTRAINT pkey_comp_acts PRIMARY KEY (reader_uuid, activity_uuid)
);

/**/    /**/

CREATE TABLE item (
    item_id uuid DEFAULT gen_random_uuid() CONSTRAINT pkey_item PRIMARY KEY,
    item_name text CONSTRAINT UNIQUE NOT NULL,
    item_category text,
    unit text,
    base_quantity numeric
);

CREATE TABLE category (
    category_name text CONSTRAINT pkey_category PRIMARY KEY,
    category_description text
);

CREATE TABLE recipe(
    recipe_id uuid DEFAULT gen_random_uuid() CONSTRAINT pkey_recipe PRIMARY KEY,
    recipe_name text CONSTRAINT UNIQUE NOT NULL,
    recipe_text text
);

CREATE TABLE ingredient (
    ingredient_id uuid DEFAULT gen_random_uuid() CONSTRAINT pkey_ingredient PRIMARY KEY,
    recipe_id uuid,
    item_id uuid,
    quantity numeric
);

CREATE TABLE store (
    store_id uuid DEFAULT gen_random_uuid() CONSTRAINT pkey_store PRIMARY KEY,
    store_name text CONSTRAINT NOT NULL,
    store_number text CONSTRAINT NOT NULL,
    store_address text,
    store_phone text,
    CONSTRAINT UNIQUE (store_name, store_number)
);

CREATE TABLE aisle_category (
    aislecategory_id uuid DEFAULT gen_random_uuid() CONSTRAINT pkey_aislecategory PRIMARY KEY,
    store_id uuid CONSTRAINT NOT NULL,
    aisle_designation text CONSTRAINT NOT NULL,
    category_name text CONSTRAINT NOT NULL
);

CREATE TABLE aisle_map (
    aislemap_id uuid DEFAULT gen_random_uuid() CONSTRAINT pkey_aislemap PRIMARY KEY,
    aislecategory_id uuid CONSTRAINT NOT NULL,
    store_id uuid CONSTRAINT NOT NULL,
    position_in_store numeric
);

/**/    /**/

ALTER TABLE item
    ADD CONSTRAINT fkey_itemcategory_categoryname FOREIGN KEY (item_category) REFERENCES category(category_name)
;

ALTER TABLE aisle_category
    ADD CONSTRAINT fkey_aislecategory_categoryname FOREIGN KEY (category_name) REFERENCES category(category_name)
    ADD CONSTRAINT fkey_aislecategory_storeid FOREIGN KEY (store_id) REFERENCES store(store_id)
;

ALTER TABLE aisle_map
    ADD CONSTRAINT fkey_aislemap_aislecategoryid FOREIGN KEY (aislecategory_id) REFERENCES aislecategory(aislecategory_id)
    ADD CONSTRAINT fkey_aislemap_storeid FOREIGN KEY (store_id) REFERENCES store(store_id)
;
