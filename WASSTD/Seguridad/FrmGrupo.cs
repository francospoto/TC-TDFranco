﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WASSTD
{
    public partial class FrmGrupo : Form
    {
        // Declaron las variables que voy a utilizar en el formulario
        string modo;
        Controladora.cFormulario cFormulario;
        Controladora.Seguridad.cCU_GestionarUsuarios cCU_GestionarUsuarios;
        Controladora.Seguridad.cCU_GestionarPerfiles cCU_GestionarPerfiles;
        Controladora.Seguridad.cCU_GestionarGrupos cCU_GestionarGrupos;
        Controladora.cPermiso cPermiso;
        Modelo_Entidades.Grupo oGrupo;
        Modelo_Entidades.Formulario oFormulario;
        bool checkearA = false;

        // Hago públio el formulario para poder llamarlo desde otros
        public FrmGrupo(string fModo, Modelo_Entidades.Grupo miGrupo)
        {
            InitializeComponent();
            
       
            cFormulario = Controladora.cFormulario.ObtenerInstancia();
            cCU_GestionarUsuarios = Controladora.Seguridad.cCU_GestionarUsuarios.ObtenerInstancia();
            cCU_GestionarPerfiles = Controladora.Seguridad.cCU_GestionarPerfiles.ObtenerInstancia();
            cCU_GestionarGrupos = Controladora.Seguridad.cCU_GestionarGrupos.ObtenerInstancia();
            cPermiso = Controladora.cPermiso.ObtenerInstancia();

            modo = fModo;
            oGrupo = miGrupo;

            if (modo != "Alta")
            {
                if (modo == "Consulta")
                {
                    txt_descripcion.Enabled = false;
                    chklstbox_usuarios.Enabled = false;
                    btn_guardar.Enabled = false;
                    btn_cancelar.Text = "Cerrar";
                }

                txt_descripcion.Text = oGrupo.descripcion;
                chklstbox_permisos.Enabled = false; 
            }

            else
            {
                this.tabs_grupos.TabPages.Remove(tab_permiso);
            }
        }

        // Al cargar el formulario
        private void FrmGrupo_Load(object sender, EventArgs e)
        {
            Arma_Formulario();
        }

        private void Arma_Formulario()
        {
            cmb_formularios.DataSource = cFormulario.ObtenerFormularios();
            cmb_formularios.DisplayMember = "nombredemuestra";


            oFormulario = (Modelo_Entidades.Formulario)cmb_formularios.SelectedItem;

            chklstbox_usuarios.DataSource = cCU_GestionarUsuarios.ObtenerUsuarios();
            chklstbox_usuarios.DisplayMember = "nombre_apellido";

            checkearA = false;
            for (int i = 0; i < chklstbox_usuarios.Items.Count; i++)
            {
                Modelo_Entidades.Usuario oUsuario = (Modelo_Entidades.Usuario)chklstbox_usuarios.Items[i];
                foreach (Modelo_Entidades.Usuario miUsuario in oGrupo.Usuarios)
                {
                    if (oUsuario.id == miUsuario.id)
                    {
                        chklstbox_usuarios.SetItemChecked(i, true);
                    }
                }
            }

            checkearA = true;

            if (modo == "Alta")
            {
                return;
            }

            else
            {
                chklstbox_permisos.DataSource = cCU_GestionarPerfiles.ObtenerPermisos(oGrupo.id, oFormulario.descripcion);
                chklstbox_permisos.DisplayMember = "descripcion";
            }

            for (int i = 0; i < chklstbox_permisos.Items.Count; i++)
            {
                Modelo_Entidades.Permiso oPermiso = (Modelo_Entidades.Permiso)chklstbox_permisos.Items[i];
                foreach (Modelo_Entidades.Permiso miPermiso in cCU_GestionarPerfiles.ObtenerPermisos(oGrupo.id, oFormulario.descripcion))
                {
                    chklstbox_permisos.SetItemChecked(i, true);
                }
            }
        }

        // Al hacer click en cancelar
        private void btn_cancelar_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
        }

        // Al hacer click en guardar
        private void btn_guardar_Click(object sender, EventArgs e)
        {
            AltaGrupo();
        }

        private void AltaGrupo()
        {
            if (ValidarObligatorios() == true)
            {
                try
                {
                    oGrupo.descripcion = txt_descripcion.Text;

                    if (modo == "Alta")
                    {
                        cCU_GestionarGrupos.AltaGrupo(oGrupo);
                    }

                    else
                    {
                        cCU_GestionarGrupos.ModificarGrupo(oGrupo);
                    }

                    this.DialogResult = DialogResult.OK;
                }

                catch (Exception Exc)
                {
                    MessageBox.Show(Exc.Message.ToString(),"Gestionar Grupos",MessageBoxButtons.OK,MessageBoxIcon.Error);
                }
            }

            else
            {
                this.Show();
            }
        }

        // Cuando cambia el formulario
        private void cmb_formularios_ItemCheck(object sender, EventArgs e)
        {
            oFormulario = (Modelo_Entidades.Formulario)cmb_formularios.SelectedItem;
            chklstbox_permisos.DataSource = cCU_GestionarPerfiles.ObtenerPermisos(oGrupo.id, oFormulario.descripcion);
            chklstbox_permisos.DisplayMember = "descripcion";

            for (int i = 0; i < chklstbox_permisos.Items.Count; i++)
            {
                Modelo_Entidades.Permiso oPermiso = (Modelo_Entidades.Permiso)chklstbox_permisos.Items[i];
                foreach (Modelo_Entidades.Permiso miPermiso in cCU_GestionarPerfiles.ObtenerPermisos(oGrupo.id, oFormulario.descripcion))
                {
                    chklstbox_permisos.SetItemChecked(i, true);
                }
            }
        }

        // Agrega o desagrega usuarios a un grupo
        private void chklstbox_usuarios_ItemCheck(object sender, ItemCheckEventArgs e)
        {
            if (checkearA == false) return;

            Modelo_Entidades.Usuario oUsuario = (Modelo_Entidades.Usuario)chklstbox_usuarios.SelectedItem;
            if (e.NewValue == CheckState.Checked)
            {
                oGrupo.Usuarios.Add(oUsuario);
            }
            else
            {
                oGrupo.Usuarios.Remove(oUsuario);
            }
        }

        // Valido los datos del grupo
        private bool ValidarObligatorios()
        {
            if (string.IsNullOrEmpty(txt_descripcion.Text))
            {
                MessageBox.Show("Debe ingresar una descipción para el grupo","Alta grupo",MessageBoxButtons.OK,MessageBoxIcon.Error);
                return false;
            }

            return true;
        }

        // Cargo los datos en los controles correspondientes
        private void CargaDatos()
        {
            cmb_formularios.DataSource = cFormulario.ObtenerFormularios();
            chklstbox_usuarios.DataSource = cCU_GestionarUsuarios.ObtenerUsuarios();
        }
    }
}
