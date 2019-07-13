module.exports = (app, db) => {
    const baseUrl = '/api/v1';
    app.get(baseUrl + "/controlDiario", (req, res) =>
        db.controlesDiarios.findAll().then((result) => res.json(result))
    );

    app.get(baseUrl + "/controlDiario/:id", (req, res) =>
        db.controlDiarios.findByPk(req.params.id).then((result) => res.json(result))
    );

    app.post(baseUrl + "/controlDiario", (req, res) =>
        db.controlesDiarios.create({
            idControl: req.body.idControl,
            turno: req.body.turno,
            fecha: req.body.fecha,
            idEmpleado: req.body.idEmpleado
        }).then((result) => res.json(result))
    );

    app.put(baseUrl + "/controlDiario", (req, res) =>
        db.controlesDiarios.update({
            idControl: req.body.idControl,
            turno: req.body.turno,
            fecha: req.body.fecha,
            idEmpleado: req.body.idEmpleado
        }, {
            where: {
                idcontrolDiario: req.body.idcontrolDiario
            }
        }).then((result) => res.json(result))
    );

    app.delete(baseUrl + "/controlDiario/:id", (req, res) =>
        db.controlesDiarios.destroy({
            where: {
                idcontrolDiario: req.params.id
            }
        }).then((result) => res.json(result))
    );
}