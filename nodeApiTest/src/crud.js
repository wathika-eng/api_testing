import express from "express";
import morgan from "morgan";
import db from "./db.js";

const app = express();
let id = 0;

app.use(express.json());
app.use(morgan("combined"));

app.get("/test", (req, resp) => {
	return resp.status(200).json({ message: "Okay" });
});

app.post("/books", (req, resp) => {
	const { name, author } = req.body;
	if (!name || !author) {
		return resp
			.status(400)
			.json({ message: "error, name and author are required" });
	}
	try {
		id++;
		const stmt = db.prepare(
			"INSERT INTO books (id, name, author) VALUES (?, ?, ?)",
		);
		const result = stmt.run(id, name, author);
		return resp.status(201).json({
			message: "New book created",
			id: result.lastInsertRowid,
		});
	} catch (error) {
		console.error("Insert failed:", error);
		return resp.status(500).json({
			message: "error inserting in DB",
			error: error.message || String(error),
		});
	}
	//return resp.status(201).json({ message: "New book created", id });
});

app.get("/books", (req, resp) => {
	try {
		const stmt = db.prepare("SELECT * FROM books");
		const rest = stmt.get();
		return resp.status(200).json({ message: rest });
	} catch (error) {
		console.error("Insert failed:", error);
		return resp.status(500).json({
			message: "error inserting in DB",
			error: error.message || String(error),
		});
	}
});

app.get("/book", (req, resp) => {
	const { id } = req.query.id;
	console.log(id);
	if (id === 1) {
		return resp.status(200).json("come");
	}
	return resp.status(200).json("Hoo");
});

export default app;
