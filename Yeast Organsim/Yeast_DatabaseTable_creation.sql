-- Nick Winters
-- Yeast Database Population

-- Created and populated a table containing gene names and ids
CREATE TABLE genes(
	gene_id int,
	name varchar(25),
	CONSTRAINT gene_key PRIMARY KEY (gene_id)
);

COPY genes 
FROM '/Users/Shared/Genes.csv'
WITH(FORMAT CSV, HEADER);

-- Created and populated a table containig cellullar locations and ids
CREATE TABLE location(
	local_id int,
	location varchar(25),
	CONSTRAINT local_key PRIMARY KEY (local_id)
);

COPY location 
FROM '/Users/Shared/Location.csv'
WITH(FORMAT CSV, HEADER);

-- Created and populated a table containig cellullar functions and ids
CREATE TABLE function(
	function_id int,
	location varchar(50),
	CONSTRAINT function_key PRIMARY KEY (function_id)
);

COPY function 
FROM '/Users/Shared/Function.csv'
WITH(FORMAT CSV, HEADER);

-- Created and populated a table containig biological processes and ids
CREATE TABLE bioprocess(
	process_id int,
	process varchar(100),
	CONSTRAINT process_key PRIMARY KEY (process_id)
);

COPY bioprocess 
FROM '/Users/Shared/Bioprocess.csv'
WITH(FORMAT CSV, HEADER);

-- Created and populated a table containig experimental treatment data and ids
CREATE TABLE treatment(
	treatment_id int,
	treatment varchar(25),
	CONSTRAINT treatment_key PRIMARY KEY (treatment_id)
);

COPY treatment 
FROM '/Users/Shared/Treatment.csv'
WITH(FORMAT CSV, HEADER);

-- Created and populated a table containig yeast growth conditions and ids
CREATE TABLE description(
	description_id int,
	description varchar(100),
	CONSTRAINT description_key PRIMARY KEY (description_id)
);

COPY description 
FROM '/Users/Shared/Description.csv'
WITH(FORMAT CSV, HEADER);

-- Created and populated a table relating the genes to their cellular location, function, and implicated biological process
CREATE TABLE member(
	gene_id int REFERENCES genes(gene_id),
	local_id int REFERENCES location(local_id),
	function_id int REFERENCES function(function_id),
	process_id int REFERENCES bioprocess(process_id)
);

COPY member 
FROM '/Users/Shared/Member.csv'
WITH(FORMAT CSV, HEADER);

-- Created and populated a table relating the treatment with its description
CREATE TABLE relation(
	treatment_id int REFERENCES treatment(treatment_id),
	description_id int REFERENCES description(description_id)
);

COPY relation
FROM '/Users/Shared/Relation.csv'
WITH(FORMAT CSV, HEADER);

-- Created and populated a master table containing all relevent ids and transription data
CREATE TABLE expression(
	gene_id int REFERENCES genes(gene_id),
	transcripts numeric(20,11),
	treatment_id int REFERENCES treatment(treatment_id),
	local_id int REFERENCES location(local_id),
	description_id int REFERENCES description(description_id),
	function_id int REFERENCES function(function_id),
	process_id int REFERENCES bioprocess(process_id),
	row_id int
);

COPY expression 
FROM '/Users/Shared/Expression.csv'
WITH(FORMAT CSV, HEADER);




