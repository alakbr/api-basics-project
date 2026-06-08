const express = require("express");

const app = express();

app.use(express.json());

app.use(express.static("public"));

const users = [];

app.post("/users", (req, res) => {

    users.push(req.body);

    res.status(201).json({
        message: "User created",
        users
    });

});

app.get("/users", (req, res) => {

    res.json(users);

});

app.listen(3000, () => {

    console.log("Server running on port 3000");

});