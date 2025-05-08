🗃️ Database Exercises Repository
📄 Description
Project Overview
This repository contains SQL exercises for querying and managing databases, including:

Tienda Database: Product and manufacturer queries

Universidad Database: Student, professor, and course queries

Exercises Cover:

Basic to advanced SQL queries (SELECT, JOIN, GROUP BY, subqueries)

Data filtering, aggregation, and sorting

Handling NULL values and complex conditions

💻 Technologies Used
Tools & Languages

🐬 MySQL (Primary database system)

📊 SQL (Structured Query Language)

🔄 Git (Version control)

📋 Requirements
Prerequisites

MySQL Server (v8.0+)

MySQL Workbench or equivalent (e.g., DBeaver, phpMyAdmin)

Basic SQL knowledge

🛠️ Installation
Setup Steps

Clone the repository:

bash
git clone [your-repo-url.git]
Import the database schemas:

schema_universidad.sql

(Optional) tienda.sql (if provided separately)

Use a SQL client to execute queries.

▶️ Execution
How to Run Queries

Open the SQL file for the exercise (e.g., 3.1-Bases-de-Dades.sql).

Execute queries in your MySQL client.

Verify results against the expected output.

🌐 Deployment
For Production

These are practice exercises; deployment is not applicable.

For real-world use, consider:

Database backups

Index optimization

🤝 Contributions
Guidelines
Contributions are welcome! Follow these steps:

Fork the repository.

Create a branch:

bash
git checkout -b feature/your-feature
Commit changes:

bash
git commit -m "Add: [Your improvement]"
Push and submit a Pull Request.

📌 Important Notes

🔍 Consistency: Queries follow standardized formatting.

✅ Quality: All solutions are tested in MySQL.

❓ Need Help? Open an issue for clarifications.

📂 Example Exercise: *3.1-Bases de Dades*
📄 Description
Task: Query a product inventory database (tienda) to:

List products by price, manufacturer, and filters.

Use JOINs, subqueries, and aggregation.

💡 Sample Solution:

sql
-- List products with manufacturers (using JOIN)
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo;
🎓 Universidad Database Exercises
Key Challenges:

Complex JOINs across alumno, profesor, and asignatura tables.

Handling NULL values (e.g., unassigned professors).

🔍 Example:

sql
-- Students born in 1999
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
🚀 Happy Querying!
Practice makes perfect—try optimizing queries for performance!

This README is:

Clear: Structured with icons and sections.

Actionable: Includes setup and contribution steps.

Detailed: Covers both databases and exercise types.
