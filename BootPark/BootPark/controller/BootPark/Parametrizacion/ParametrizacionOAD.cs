using System;
using System.Data;
using BootPark.conecction;
using System.Collections.Generic;

namespace BootPark.controller.BootPark.Parametrizacion
{
    public class ParametrizacionOAD
    {
        private Connect _CONN = new Connect();

        public DataTable FindBrand() {
            string sql = @"SELECT * FROM marca";
            return _CONN.GetData(sql).Tables[0];
        }

        public DataTable FindVehicle() {
            string sql = @"SELECT V.VEHI_ID,
                               V.VEHI_PLACA,
                               V.VEHI_MODELO,
                               M.MARC_MARCA,
                               E.ETIQ_CODIGO,
                               E.ETIQ_TIPO,
                               E.ETIQ_DESCRIPCION
                        FROM vehiculo V
                        INNER JOIN marca M ON (V.MARC_ID=M.MARC_ID)
                        INNER JOIN etiqueta E ON (V.ETIQ_ID=E.ETIQ_ID)
                        WHERE v.VEHI_ID NOT IN
                            (SELECT A.VEHI_ID
                             FROM autorizacion A
                             WHERE A.AUTO_TIPO = 'PROPIETARIO')";
            return _CONN.GetData(sql).Tables[0];
        }

        public bool CreateVehicleWithTag(string observacion, string marca, string modelo, string placa, string tag) {
            List<string> sql = new List<string>();
            sql.Add(string.Format(@"INSERT INTO `etiqueta`(`EITQ_CODIGO`, `ETIQ_TIPO`, `ETIQ_DESCRIPCION`, `ETIQ_REGISTRADOPOR`, `ETIQ_FECHACAMBIO`) VALUES ('{0}', 'TAG', '{1}', 'SYSTEM', CURRENT_DATE)", tag, observacion));
            sql.Add(string.Format(@"INSERT INTO `vehiculo`(`MARC_ID`, `ETIQ_ID`, `VEHI_PLACA`, `VEHI_MODELO`, `VEHI_REGISTRADOPOR`, `VEHI_FECHACAMBIO`) VALUES ('{0}', {1}, '{2}', '{3}', 'SYSTEM', CURRENT_TIMESTAMP)", marca, "LAST_INSERT_ID()", placa, modelo));
            return _CONN.SendDataTransaction(sql) ;
        }

        public DataTable FindUser() {
            string sql = @"SELECT U.PEGE,
                               U.ROL_ID,
                               R.ROL_ROL,
                               U.IDENTIFICACION,
                               U.NOMBRE,
                               U.APELLIDO
                        FROM usuario U
                        INNER JOIN rol R ON(U.ROL_ID = R.ROL_ID)";
            return _CONN.GetData(sql).Tables[0];
        }

        public DataTable FindAutorization(string user) {
            string sql = string.Format(@"
                SELECT DISTINCT V.VEHI_ID,
                                V.VEHI_PLACA,
                                V.VEHI_MODELO,
                                M.MARC_MARCA,
                                E.ETIQ_CODIGO,
                                E.ETIQ_TIPO,
                                E.ETIQ_DESCRIPCION
                FROM autorizacion A
                INNER JOIN vehiculo V ON (A.VEHI_ID=V.VEHI_ID)
                INNER JOIN marca M ON (V.MARC_ID=M.MARC_ID)
                INNER JOIN etiqueta E ON (V.ETIQ_ID=E.ETIQ_ID)
                WHERE A.AUTO_TIPO='PROPIETARIO'
                  AND A.USUA_ID = '{0}'
            ", user);
            return _CONN.GetData(sql).Tables[0];
        }
    }
}