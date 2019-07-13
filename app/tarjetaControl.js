module.exports = (app, db) => {
    const baseUrl = '/api/v1';
    app.get(baseUrl + "/tarjetaControl", (req, res) =>
        db.tarjetasControles.findAll().then((result) => res.json(result))
    );

    app.get(baseUrl + "/tarjetaControl/:id", (req, res) =>
        db.tarjetasControles.findByPk(req.params.id).then((result) => res.json(result))
    );

    app.post(baseUrl + "/tarjetaControl", (req, res) =>
        db.tarjetasControles.create({
            hora: req.body.hora,
            resultado: req.body.resultado,
            observaciones: req.body.observaciones,
            idControlDiario: req.body.idControlDiario,
            enHora: req.body.enHora
        }).then((result) => res.json(result))
    );

    app.put(baseUrl + "/tarjetaControl", (req, res) =>
        db.tarjetasControles.update({
            hora: req.body.hora,
            resultado: req.body.resultado,
            observaciones: req.body.observaciones,
            idControlDiario: req.body.idControlDiario,
            enHora: req.body.enHora
        }, {
            where: {
                idTarjetaControl: req.body.idTarjetaControl
            }
        }).then((result) => res.json(result))
    );

    app.delete(baseUrl + "/tarjetaControl/:id", (req, res) =>
        db.tarjetasControles.destroy({
            where: {
                idTarjetaControl: req.params.id
            }
        }).then((result) => res.json(result))
    );
}