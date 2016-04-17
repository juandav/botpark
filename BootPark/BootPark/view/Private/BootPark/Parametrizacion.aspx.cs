using System;
using Ext.Net;
using BootPark.controller.BootPark.Parametrizacion;

namespace BootPark.view.Private.BootPark
{
    public partial class Parametrizacion : System.Web.UI.Page
    {
        private TolBarad.TolBarad _TB = new TolBarad.TolBarad();
        private ParametrizacionCOD _PARAM = new ParametrizacionCOD();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                FindBind();
                FindVehicle();
                FindUser();
            }
        }

        public void FindVehicle() {
            SVEHICLE.DataSource = _PARAM.FindVehicle();
            SVEHICLE.DataBind();
            X.Msg.Notify("Notify", "Cargando nuevos vehiculos").Show();
        }

        [DirectMethod]
        public void FindBind() {
            SMARCA.DataSource = _PARAM.FindBrand();
            SMARCA.DataBind();
        }

        [DirectMethod]
        public void DetectTag() {

            string data = _TB.RunRFID();

            string[] etiqueta = data.Split(',');

            string tag = etiqueta[0];
            string antena = etiqueta[1];

            TAG.Text = tag;
        }

        [DirectMethod]
        public void CreateVehicle(string observacion, string marca, string modelo, string placa, string tag) {
           bool response = _PARAM.CreateVehicleWithTag(observacion, marca, modelo, placa, tag);
            if (!response)
            {
                X.Msg.Alert("Advertencia", "Ya existe un registro para la etiqueta RFID o placa del Vehiculo.").Show();
            }
            else {
                FindVehicle();
            }
        }

        [DirectMethod]
        public void FindUser() {
            SUSER.DataSource = _PARAM.FindUser();
            SUSER.DataBind();
        }

        [DirectMethod]
        public void FindAutorization() {
            SAUTORIZACION.DataSource = _PARAM.FindAutorization("");
            SAUTORIZACION.DataBind();
        }
    }
}