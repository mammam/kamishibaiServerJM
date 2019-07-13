module.exports = (app, db) => {
    const baseUrl = '/api/v1';
    app.get(baseUrl + "/control", (req, res) =>
        db.controles.findAll().then((result) => res.json(result))
    );

    app.get(baseUrl + "/control/:id", (req, res) =>
        db.controles.findByPk(req.params.id).then((result) => res.json(result))
    );

    app.post(baseUrl + "/control", (req, res) =>
        db.controles.create({
            controlNombre: req.body.controlNombre,
            idLineaEnvasado: req.body.idLineaEnvasado
         }).then((result) => res.json(result))
    );
    
    
    app.put(baseUrl + "/control", (req, res) =>
        db.controles.update({
            controlNombre: req.body.controlNombre,
            idLineaEnvasado: req.body.idLineaEnvasado
        }, {
            where: {
                idcontrol: req.body.idcontrol
            }
        }).then((result) => res.json(result))
    );

    app.delete(baseUrl + "/control/:id", (req, res) =>
        db.controles.destroy({
            where: {
                idcontrol: req.params.id
            }
        }).then((result) => res.json(result))
    );
}