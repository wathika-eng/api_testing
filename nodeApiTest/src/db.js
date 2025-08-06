import Database from "better-sqlite3";

const db = new Database("src/books.db");
db.pragma("journal_mode = WAL");

const testDB = () => {
	try {
		const test = db.prepare("SELECT ? as value");
		const result = test.get(123);
		console.log(`Results: ${result.value}`);
		const create = db.prepare(
			`CREATE TABLE IF NOT EXISTS books (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            author TEXT NOT NULL
            )`,
		);
		create.run();
		console.log("Table 'books' created successfully.");
	} catch (error) {
		console.error("Test failed", error);
	}
};

testDB();

export default db;
