using System;
using System.Data;

namespace BootPark.controller.BootPark.Parametrizacion
{
    public class ParametrizacionCOD
    {
        private ParametrizacionOAD _PARAM = new ParametrizacionOAD();

        public DataTable FindBrand()
        {
            return _PARAM.FindBrand();
        }

        public bool CreateVehicleWithTag(string observacion, string marca, string modelo, string placa, string tag)
        {
            return _PARAM.CreateVehicleWithTag(observacion, marca, modelo, placa, tag);
        }

        public DataTable FindVehicle()
        {
            return _PARAM.FindVehicle();
        }

        public DataTable FindUser()
        {
            return _PARAM.FindUser();
        }

        public DataTable FindAutorization(string user) {
            return _PARAM.FindAutorization(user);
        }
    }
}