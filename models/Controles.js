/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Controles', {
    idControl: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    controlNombre: {
      type: DataTypes.STRING(45),
      allowNull: true
    },
    idLineaEnvasado: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'lineasEnvasado',
        key: 'idLineaEnvasado'
      }
    }
  }, {
    tableName: 'Controles'
  });
};
