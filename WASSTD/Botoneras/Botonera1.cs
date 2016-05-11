﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using Modelo_Entidades;

namespace WASSTD
{
    public delegate void Eventos_Botonera(object sender, EventArgs e);

    public partial class Botonera1 : UserControl
    {
        public event Eventos_Botonera Click_Alta;
        public event Eventos_Botonera Click_Baja;
        public event Eventos_Botonera Click_Modificacion;
        public event Eventos_Botonera Click_Consulta;
        public event Eventos_Botonera Click_Cerrar;
    

        public Botonera1()
        {
            InitializeComponent();
        }

        private void btn_agregar_Click(object sender, EventArgs e)
        {
            Click_Alta(sender, e);
        }

        private void btn_eliminar_Click(object sender, EventArgs e)
        {
            Click_Baja(sender, e);
        }

        private void btn_modificar_Click(object sender, EventArgs e)
        {
            Click_Modificacion(sender, e);
        }

        private void btn_verdetalle_Click(object sender, EventArgs e)
        {
            Click_Consulta(sender, e);
        }

        private void btn_cerrar_Click(object sender, EventArgs e)
        {
            Click_Cerrar(sender, e);
        }

        public void ArmaPerfil(Modelo_Entidades.Usuario oUsuario, string form)
        {
            

            btn_agregar.Enabled = false;
            btn_eliminar.Enabled = false;
            btn_modificar.Enabled = false;
            btn_verdetalle.Enabled = false;

            try
            {
                foreach (Modelo_Entidades.Grupo oGrupo in oUsuario.Grupos)
                {
                    foreach (Modelo_Entidades.Perfil oPerfil in oGrupo.Perfiles)
                    {
                        if (oPerfil.Formulario.descripcion == form)
                        {
                            switch (oPerfil.Permiso.descripcion)
                            {
                                case "Alta":
                                    if (form == "FrmAuditorias")
                                    {
                                        btn_agregar.Text = "Formatear";
                                    }
                                    btn_agregar.Enabled = true;
                                    break;

                                case "Baja":
                                    if (form == "FrmTramites")
                                    {
                                        //btn_eliminar.Visible = false;
                                    }
                                    btn_eliminar.Enabled = true;
                                    break;

                                case "Modifica":
                                    if (form == "FrmAuditorias")
                                    {
                                        btn_modificar.Visible = false;
                                    }
                                    btn_modificar.Enabled = true;
                                    break;

                                case "Consulta":
                                    btn_verdetalle.Enabled = true;
                                    break;
                            }
                        }
                    }
                }
            }

            catch (Exception Exc)
            {
                throw new Exception(Exc.Message);
            }
        }


        public void ArmaBotonera(List<Modelo_Entidades.Perfil> listaAccionesPermitidas)
        {
            btn_agregar.Enabled = false;
            btn_eliminar.Enabled = false;
            btn_modificar.Enabled = false;
            btn_verdetalle.Enabled = false;

            foreach (Modelo_Entidades.Perfil oPerfil in listaAccionesPermitidas)
            {

                switch (oPerfil.Permiso.descripcion)
                {
                    case "Alta":
                        if (oPerfil.Formulario.descripcion == "FrmAuditorias")
                        {
                            btn_agregar.Text = "Formatear";
                        }
                        btn_agregar.Enabled = true;
                        break;

                    case "Baja":
                        if (oPerfil.Formulario.descripcion == "FrmTramites")
                        {
                            //btn_eliminar.Visible = false;
                        }
                        btn_eliminar.Enabled = true;
                        break;

                    case "Modifica":
                        if (oPerfil.Formulario.descripcion == "FrmAuditorias")
                        {
                            btn_modificar.Visible = false;
                        }
                        btn_modificar.Enabled = true;
                        break;

                    case "Consulta":
                        btn_verdetalle.Enabled = true;
                        break;
                }

            }
        }

    }
}
