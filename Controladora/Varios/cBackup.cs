﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Controladora
{
    public class cBackup
    {
        // Declaro las variables a utilizar en la clase
        private static cBackup instancia;
        private Modelo_Entidades.WASSTDEntidades oModelo_Entidades;
        SqlConnection oConnection;
        string ConString;

        // Aplico el patrón de diseño Singleton a la clase
        public static cBackup ObtenerInstancia()
        {
            if (instancia == null)
                instancia = new cBackup();

            return instancia;
        }

        // Coloco al constructor como privado.
        private cBackup()
        {
            oModelo_Entidades = Modelo_Entidades.WASSTDEntidades.ObtenerInstancia();
        }

        public void RealizarBackupSemanal()
        {
            ConString = "Data Source=CUARTO-PC\\SQLEXPRESS;" + "Initial Catalog=WASSTD;" + "Integrated Security = true;" + "MultipleActiveResultSets=True";
            oConnection = new SqlConnection();
            oConnection.ConnectionString = ConString;
            
            oConnection.Open();

            SqlCommand cmdSELECT = new SqlCommand();
            cmdSELECT.Connection = oConnection;
            cmdSELECT.CommandType = System.Data.CommandType.Text;
            cmdSELECT.CommandText = "BACKUP DATABASE [WASSTD] TO  DISK = N'c:\\Program Files\\Microsoft SQL Server\\MSSQL10.SQLEXPRESS\\MSSQL\\Backup\\WASSTD-Completo.bak' WITH NOFORMAT, NOINIT,  NAME = N'WASSTD-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10";
            cmdSELECT.ExecuteNonQuery();
            oConnection.Close();
        }

        public void RealizarBackupDiario()
        {
            ConString = "Data Source=CUARTO-PC\\SQLEXPRESS;" + "Initial Catalog=WASSTD;" + "Integrated Security = true;" + "MultipleActiveResultSets=True";
            oConnection = new SqlConnection();
            oConnection.ConnectionString = ConString;
            oConnection.Open();

            SqlCommand cmdSELECT = new SqlCommand();
            cmdSELECT.Connection = oConnection;
            cmdSELECT.CommandType = System.Data.CommandType.Text;
            cmdSELECT.CommandText = "BACKUP DATABASE [WASSTD] TO  DISK = N'C:\\Program Files\\Microsoft SQL Server\\MSSQL10.SQLEXPRESS\\MSSQL\\Backup\\WASSTD.bak' WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'WASSTD-Differential Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10";
            cmdSELECT.ExecuteNonQuery();
            oConnection.Close();
        }

        //public void RealizarRestauracion()
        //{
        //    ConString = "Data Source=CUARTO-PC\\SQLEXPRESS;" + "Initial Catalog=WASSTD;" + "Integrated Security = true;" + "MultipleActiveResultSets=True";
        //    oConnection = new SqlConnection();
        //    oConnection.ConnectionString = ConString;
        //    oConnection.Open();

        //    SqlCommand cmdSELECT = new SqlCommand();
        //    cmdSELECT.Connection = oConnection;
        //    cmdSELECT.CommandType = System.Data.CommandType.Text;
        //    cmdSELECT.CommandText = "RESTORE DATABASE [WASSTD] FROM  DISK = N'C:\\Program Files\\Microsoft SQL Server\\MSSQL10.SQLEXPRESS\\MSSQL\\Backup\\WASSTD-Completo.bak' WITH  FILE = 1,  NOUNLOAD,  STATS = 10";            
        //    cmdSELECT.ExecuteNonQuery();
        //    oConnection.Dispose();
            
        //}
    }
}
