module.exports = function(sequelize, DataTypes) {
    const ControlDiario = sequelize.define('controlesDiarios', {
        idControlDiario: {
            type: DataTypes.INTEGER(11),
            allowNull: false,
            primaryKey: true,
            autoIncrement: true
        },
        idControl: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
            references: {
                model: 'Controles',
                key: 'idControl'
            }
        },
        turno: {
            type: DataTypes.INTEGER(11),
            allowNull: true
        },
        fecha: {
            type: DataTypes.DATEONLY,
            allowNull: true
        },
        idEmpleado: {
            type: DataTypes.INTEGER(11),
            allowNull: true,
            references: {
                model: 'Empleados',
                key: 'idEmpleado'
            }
        }
    }, {
        tableName: 'controlesDiarios'
    });

    return ControlDiario;
};