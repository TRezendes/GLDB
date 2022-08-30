CREATE TABLE completed_activities (
    reader_uuid uuid,
    activity_uuid uuid,
    CONSTRAINT pkey_comp_acts PRIMARY KEY (reader_uuid, activity_uuid)
);

CREATE TABLE item (
	itemID uuid DEFAULT gen_random_uuid() CONSTRAINT pkey_itemID PRIMARY KEY,
	itemName TEXT CONSTRAINT UNIQUE NOT NULL,
	itemCategory TEXT /*CONSTRAINT fkey_itemCategory_categoryName FOREIGN KEY(itemCategory) REFERENCES category(categoryName)*/
);