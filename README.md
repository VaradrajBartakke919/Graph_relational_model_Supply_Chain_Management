# Inventory Management Analysis: Data Integration with PostgreSQL & Neo4j

## 📌 Project Overview
This project integrates **PostgreSQL (RDBMS) and Neo4j (GDBMS)** to analyze **inventory management and trade relationships**. The workflow involves **data preprocessing, database design, data import, query execution, and visualization using NeoDash**.

## 🚀 Prerequisites
Before proceeding, ensure that the following software is installed:
- **PostgreSQL** – for structured database storage.
- **Neo4j** – for graph-based relationship analysis.
- **NeoDash** – for dashboard visualization.

---

## 🛠 Step-by-Step Implementation
### **1️⃣ Dataset Collection**
We sourced the data from [FAOSTAT](https://www.fao.org/faostat/en/#data). We have considered only American continent dataset for our model.
### To save some effort we have already provided the final csv files (food_balances,csv, trades.csv & prices.csv) in the CSV folder.
### You can directly use the final structured csv files to load data into Neo4j skipping the RDBMS part.

However, if required these are the steps explaining our process from Data Collection, Data Pre-processing to CSV creation.

(Optional) 
Download the required datasets:
   - Production --> Crops & livestock product --> Download [Americas](https://bulks-faostat.fao.org/production/Production_Crops_Livestock_E_Americas.zip) dataset
   - Food Balances --> Supply Utilization Accounts (2010-) --> Download [Americas](https://bulks-faostat.fao.org/production/SUA_Crops_Livestock_E_Americas.zip) dataset
   - Trade --> Detailed Trade Matrix --> Download [Americas](https://bulks-faostat.fao.org/production/Trade_DetailedTradeMatrix_E_Americas.zip) dataset
   - Prices --> Producer Prices --> Download [Americas](https://bulks-faostat.fao.org/production/Prices_E_Americas.zip) dataset

### **2️⃣ Database Setup**
1. Navigate to the `/DDL_scripts` folder in this repository.
2. Execute the DDL scripts in PostgreSQL to create necessary tables:
   - `production_cle_area_code`
   - `production_cle_item_code`
   - `production_cle_elements`
   - `food_balances_cle`
   - `prices_cle`
   - `trade_cle_trade_matrix`
   - `area_codes`
   - `item_codes`
   - `element_codes`
   - `food_balances`
   - `trades`
   - `prices`
     
3. Example table creation (available in `/DDL` folder):
   ```sql
   CREATE TABLE prices (
       area_code    INTEGER NOT NULL REFERENCES area_codes(area_code),
       area         TEXT,
       item_code    INTEGER NOT NULL REFERENCES item_codes(item_code),
       item         TEXT,
       element      TEXT,
       element_code INTEGER NOT NULL REFERENCES element_codes(element_code),
       unit         TEXT,
       year_2020    DOUBLE PRECISION,
       year_2021    DOUBLE PRECISION,
       year_2022    DOUBLE PRECISION,
       year_2023    DOUBLE PRECISION,
       PRIMARY KEY (area_code, item_code, element_code)
   );
   ```
4. Import data from csv files of our dataset

Import into our base tables corresponding to the csv files of downloaded FAOSTAT dataset:
- `production_cle_area_code`: From Production_America --> Production_Crops_Livestock_E_Americas --> ......Area_Codes.csv
- `production_cle_item_code`: From Production_America --> Production_Crops_Livestock_E_Americas --> ......item_codes.csv
- `production_cle_elements`: From all (Production, Food_Balances, Trade, Price)--> ....elements.csv files 
- `food_balances_cle`: From Food_Balaces_America --> SUA_Crops_Livestock_E_Americas --> SUA_Crops_Livestock_E_Americas.csv
- `price_cle`: From Prices_America --> Prices_E_Americas --> Prices_E_Americas.csv
- `trade_cle_trade_matrix`: From Trade_America --> Trade_DetailedTradeMatrix_E_Americas --> Trade_DetailedTradeMatrix_E_Americas.csv

   
### **3️⃣ Data Preprocessing**
1. Navigate to `/SCRIPTS` folder for preprocessing SQL scripts.
2. Run the script in order of the queries present in it in PostgreSQL to clean and normalize the dataset.
3. This step involves:
   - Handling missing values.
   - Standardizing units.
   - Transforming time-series data into structured format.

### **4️⃣ Feature Selection & Inserting data**
The dataset is refined by selecting key features:
- **Items:** `Apples, Oats, Spinach, Chickens, Wheat`
- **Elements:** `Import quantity, Import value, Export quantity, Export value, Production, Food supply quantity (tonnes), Producer Price (USD/tonne)`
- **Countries:** `United States of America, Ecuador, Uruguay, Canada, Brazil`
  
1. Navigate to `/INSERT_SCRIPTS` folder for preprocessing SQL scripts.
2. Execute the scripts in order in PostgreSQL

### **5️⃣ Exporting Processed Data**
1. Export the final structured dataset as CSVs and save them in `/CSVs`.
2. Example export command:
   ```sql
   COPY (SELECT * FROM food_balances) TO '/path/to/CSVs/foodbalances.csv' CSV HEADER;
   COPY (SELECT * FROM trades) TO '/path/to/CSVs/trade.csv' CSV HEADER;
   COPY (SELECT * FROM prices) TO '/path/to/CSVs/price_cle.csv' CSV HEADER;
   ```
###### We have provideed these three csv files in CSV folder.

### **6️⃣ Data Import into Neo4j**
1. Navigate to `/Cypher Queries` folder for import queries.
2. Execute the cypher queries from `Graph_model_creation_cypher_queries.txt` file.
3. Example command:
   ```cypher
   LOAD CSV WITH HEADERS FROM 'file:///CSVs/trade.csv' AS row
   MERGE (c:Country {name: row.reporter_area});
   MERGE (p:FoodProduct {name: row.item});
   ```

### **7️⃣ Executing Queries**
1. Navigate to `/Cypher Queries/Neo4j` folder for analytical queries.
2. Execute graph queries in Neo4j to analyze trade patterns and visualize the graph.

#### **Example Queries:**

#### **7.1 Find Trade Relationships**
```cypher
MATCH (c1:Country)-[r:TRADES]->(c2:Country)
RETURN c1.name, c2.name, r.volume
LIMIT 10;
```

#### **7.2 Analyze Production Trends**
```cypher
MATCH (c:Country)-[:HAS_TRADE_LINK]->(tl:TradeLink)-[:FOR_PRODUCT]->(p:FoodProduct)
MATCH (tl)-[:HAS_OBSERVATION]->(o:Observation {type:"production"})
RETURN c.name, p.name, o.value
ORDER BY o.value DESC;
```

### **8️⃣ Building NeoDash Dashboard**
1. Navigate to `/Cypher Queries/Dashboard(Neodash)` folder for configuration files.
2. Install NeoDash using:
   ```bash
   npm install -g neodash
   ```
3. Launch NeoDash:
   ```bash
   neodash
   ```
4. Connect to Neo4j and use:
   - **Graph Visualizations** for trade relationships.
   - **Bar/Pie Charts** for country-wise production.
   - **Filters** for interactive exploration.
   - 
###### Use the .json file to import our dashboard entirely into NeoDash
---


## 🎯 Conclusion
This project demonstrates how **relational and graph databases** can be used together for **supply chain and trade analytics**. PostgreSQL provides **structured storage**, while Neo4j visualizes **trade relationships**. The **NeoDash dashboard** enhances **data interpretation** with interactive visualizations.

---

## 👥 Contributors
- **Bhaavya Naharas**
- **Shreyasi Nath**
- **Varadraj Bartakke**

For any questions or contributions, feel free to **raise an issue** or **submit a pull request**.

