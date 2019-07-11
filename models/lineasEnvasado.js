/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('lineasEnvasado', {
    idLineaEnvasado: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true
    },
    descripcion: {
      type: DataTypes.STRING(45),
      allowNull: true
    }
  }, {
    tableName: 'lineasEnvasado'
  });
};
