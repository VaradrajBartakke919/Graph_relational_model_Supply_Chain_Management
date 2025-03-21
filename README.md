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
1. Download the datasets from [FAOSTAT](https://www.fao.org/faostat/en/#data).
2. Save the downloaded CSV files inside the `/CSVs` folder.

### **2️⃣ Database Setup**
1. Navigate to the `/DDL` folder in this repository.
2. Execute the DDL scripts in PostgreSQL to create necessary tables:
   - `prices`
   - `trades`
   - `food_balances`
   - Lookup tables: `area_codes`, `item_codes`, `element_codes`
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
4. Execute all SQL scripts from the `/DDL` folder.

### **3️⃣ Data Preprocessing**
1. Navigate to `/INSERT SCRIPTS` folder for preprocessing SQL scripts.
2. Run the scripts in PostgreSQL to clean and normalize the dataset.
3. This step involves:
   - Handling missing values.
   - Standardizing units.
   - Transforming time-series data into structured format.

### **4️⃣ Feature Selection**
The dataset is refined by selecting key features:
- **Items:** `Apples, Oats, Spinach, Chickens, Wheat`
- **Elements:** `Import quantity, Import value, Export quantity, Export value, Production, Food supply quantity (tonnes), Producer Price (USD/tonne)`
- **Countries:** `United States of America, Ecuador, Uruguay, Canada, Brazil`

### **5️⃣ Exporting Processed Data**
1. Export the final structured dataset as CSVs and save them in `/CSVs`.
2. Example export command:
   ```sql
   COPY (SELECT * FROM food_balances) TO '/path/to/CSVs/foodbalances.csv' CSV HEADER;
   COPY (SELECT * FROM trades) TO '/path/to/CSVs/trade.csv' CSV HEADER;
   COPY (SELECT * FROM prices) TO '/path/to/CSVs/price_cle.csv' CSV HEADER;
   ```

### **6️⃣ Data Import into Neo4j**
1. Navigate to `/Neo4j` folder for import queries.
2. Open the Neo4j browser and execute the import scripts.
3. Example command:
   ```cypher
   LOAD CSV WITH HEADERS FROM 'file:///CSVs/trade.csv' AS row
   MERGE (c:Country {name: row.reporter_area});
   MERGE (p:FoodProduct {name: row.item});
   ```
4. Repeat for all files.

### **7️⃣ Executing Queries**
1. Navigate to `/Cypher Queries` folder for analytical queries.
2. Execute graph queries in Neo4j to analyze trade patterns.

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
1. Navigate to `/Dashboard(Neodash)` folder for configuration files.
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

---


## 🎯 Conclusion
This project demonstrates how **relational and graph databases** can be used together for **supply chain and trade analytics**. PostgreSQL provides **structured storage**, while Neo4j visualizes **trade relationships**. The **NeoDash dashboard** enhances **data interpretation** with interactive visualizations.

---

## 👥 Contributors
- **Bhaavya Naharas**
- **Shreyasi Nath**
- **Varadraj Bartakke**

For any questions or contributions, feel free to **raise an issue** or **submit a pull request**.

