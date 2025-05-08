🗃️ Database Exercises Repository

📄 Description
Project overview
This repository contains SQL exercises for querying and managing databases, including:

Tienda database: product and manufacturer queries

Universidad database: student, professor, and course queries

🧠 Exercises Cover
The exercises include:

Basic to advanced SQL queries (SELECT, JOIN, GROUP BY, subqueries)

Data filtering, aggregation, and sorting

Handling NULL values and complex conditions

💻 Technologies Used
Tools & languages

🐬 MySQL (primary database system)

📊 SQL (Structured Query Language)

🔄 Git (version control)

📋 Requirements
Prerequisites

MySQL Server (v8.0+)

MySQL Workbench or equivalent (e.g., DBeaver, phpMyAdmin)

Basic SQL knowledge

🛠️ Installation
Setup steps

Clone the repository:

bash
Copiar
Editar
git clone [your-repo-url.git]
Import the database schemas:

schema_universidad.sql

(Optional) tienda.sql (if provided separately)

Use a SQL client to execute queries.

▶️ Execution
How to run queries

Open the SQL file for the exercise (e.g., 3.1-Bases-de-Dades.sql)

Execute queries in your MySQL client

Verify results against the expected output

🌐 Deployment
For production

These are practice exercises; deployment is not applicable.
For real-world use, consider:

Database backups

Index optimization

Access control and user roles

🤝 Contributions
Guidelines

Contributions are welcome! Follow these steps:

Fork the repository

Create a branch:

bash
Copiar
Editar
git checkout -b feature/your-feature
Commit changes:

bash
Copiar
Editar
git commit -m "Add: [Your improvement]"
Push and submit a pull request

📌 Important Notes
🔍 Consistency: queries follow standardized formatting

✅ Quality: all solutions are tested in MySQL

❓ Need help? open an issue for clarifications

📂 Example Exercise: 3.1 - Bases de Dades
Description

Query a product inventory database (tienda) to:

List products by price, manufacturer, and filters

Use JOINs, subqueries, and aggregation

💡 Sample solution:

sql
Copiar
Editar
-- List products with manufacturers (using JOIN)
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo;
🎓 Universidad Database Exercises
Key challenges

Complex JOINs across alumno, profesor, and asignatura tables

Handling NULL values (e.g., unassigned professors)

🔍 Example:

sql
Copiar
Editar
-- Students born in 1999
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
🚀 Happy Querying!
Practice makes perfect—try optimizing queries for performance! 🎯

