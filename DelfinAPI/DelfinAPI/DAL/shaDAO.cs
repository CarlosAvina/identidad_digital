using System;
using System.Data;
using Dapper;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace DelfinAPI.DAL
{
    public class shaDAO
    {
        static readonly string CadenaConexion = ConfigurationManager.ConnectionStrings["bd_delfin"].ToString();

        public static bool Consultar(string sha)
        {
            using (var conexion = new MySqlConnection(CadenaConexion))
            {
                try
                {
                    var parametros = new DynamicParameters();

                    parametros.Add("response",
                               dbType: DbType.Boolean,
                               direction: ParameterDirection.Output);

                    parametros.Add("p_hash", sha);

                    conexion.Query<bool>(
                        "stp_select_hash",
                        parametros,
                        commandType: CommandType.StoredProcedure);

                    var response = parametros.Get<Boolean>("response");

                    return response;

                } catch(Exception e)
                {
                    Console.WriteLine(e.Message);
                    return false;
                }
            }
        }

        public static bool Insertar(string sha)
        {
            using (var conexion = new MySqlConnection(CadenaConexion))
            {
                var parametros = new DynamicParameters();

                parametros.Add("p_hash", sha);

                conexion.Execute(
                    "stp_insert_hash",
                    parametros,
                    commandType: CommandType.StoredProcedure);

                //var idPersona = parametros.Get<int>("p_id");

                return Consultar(sha);
            }
        }
    }
}
