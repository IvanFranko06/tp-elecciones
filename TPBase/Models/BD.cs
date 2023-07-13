using System.Data.SqlClient;
using Dapper;

public static class BD{

private static List<Candidato> ListadoCandidato=new List<Candidato>();


    private static List<Partido> ListadoPartido=new List<Partido>();
   private static string ConnectionString { get; set; } = @"Server=localhost;DataBase=TP6;Trusted_Connection=True;";
    public static void AgregarCandidato(Candidato can)
    {
        
            string SQL = "INSERT INTO Candidato(Idpartido, apellido, nombre, FechaNacimiento, Foto, Postulacion, Idcandidato) VALUES(@pIdpartido, @papellido, @pnombre, @pFechaNacimiento, @pFoto, @pPostulacion, @pIdcandidato) ";
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {

                 db.Execute(SQL, new{pIdpartido = can.IdPartido, papellido = can.Apellido, pnombre = can.Nombre, pfechaNacimiento = can.FechaNacimiento, pfoto = can.Foto, pPostulacion = can.Postulacion, pIdcandidato = can.IdCandidato});
            }
            
        
       
    }

public static int EliminarCandidato(int idCandidato)
    {
        int RegistrosEliminados = 0;
            string SQL = "DELETE FROM Candidato WHERE idCandidato = @pidCandidato";
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
             RegistrosEliminados = db.Execute(SQL, new{pidCandidato = idCandidato}); 
            }
            return RegistrosEliminados;
            
        
       
    }
 public static Partido VerInfoPartido(int idPartido)
 {
    Partido partidoEncontrado= null;
    using (SqlConnection db = new SqlConnection(ConnectionString))
    {
        string SQL= "SELECT * FROM Partido WHERE idPartido=@pidPartido";
     partidoEncontrado = db.QueryFirstOrDefault<Partido>(SQL, new{pidPartido=idPartido});
    }
    return partidoEncontrado;
 }

 public static Candidato VerInfoCandidato(int idCandidato)
 {
    Candidato candidatoEncontrado= null;
    using (SqlConnection db = new SqlConnection(ConnectionString))
    {
        string SQL= "SELECT * FROM Candidato WHERE idCandidato=@pidCandidato";
     candidatoEncontrado = db.QueryFirstOrDefault<Candidato>(SQL, new{pidCandidato=idCandidato});
    }
    return candidatoEncontrado;
 }
  
 public static List<Partido> listarPartidos()
 {
   using (SqlConnection db = new SqlConnection(ConnectionString))
   {
     string SQL="SELECT * FROM PARTIDO";
      ListadoPartido=db.Query<Partido>(SQL).ToList();
       
   }
    return ListadoPartido;


 }
 public static List<Candidato> listarCandidato(int idPartido)
 {
   using (SqlConnection db = new SqlConnection(ConnectionString))
   {
     string SQL="SELECT * FROM CANDIDATO WHERE idPartido =@pidPartido";
      ListadoCandidato=db.Query<Candidato>(SQL, new{pidPartido= idPartido}).ToList();
       
   }
    return ListadoCandidato;
 }

  








}
