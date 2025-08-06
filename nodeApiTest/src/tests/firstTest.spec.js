import supertest from "supertest";
import app from "../crud";

// describe tests
describe("first test", () => {
	// single test case
	it("should return 200", async () => {
		await supertest(app).get("/test").expect(200);
	});
	it("create a new book", async () => {
		await supertest(app).post("/books").send("name=book1").expect(201);
	});
	it("get all books", async () => {
		await supertest(app).get("/books").expect(200);
	});
});
