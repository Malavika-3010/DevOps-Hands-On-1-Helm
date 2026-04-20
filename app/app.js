const express = require("express");
const app = express();

const ENV = process.env.ENV || "unknown";

app.get("/", (req, res) => {
  res.send(`Hello from ${ENV} environment!`);
});

app.listen(3000, () => {
  console.log("App running on port 3000");
});