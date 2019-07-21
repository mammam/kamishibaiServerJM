module.exports = (app, db) => {
    const baseUrl = '/api/v1';

    app.get(baseUrl + "/empleado-login", (req, res) =>
        db.empleados.findOne({
            where: {
                userName: req.body.userName,
                password: req.body.password
            }

        }).then((result) => res.json(result))
    );


}