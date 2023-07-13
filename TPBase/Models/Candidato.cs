public class Candidato
{
    public int IdCandidato { get; set; }
    public int IdPartido { get; set; }
    public string Apellido { get; set; }
    public string Nombre { get; set; }
    public DateTime FechaNacimiento { get; set; }
    public string Foto { get; set; }
    public string Postulacion { get; set; }


    public Candidato()
    {

    }


    public Candidato (int idC, int idP, string ape, string nom, DateTime fNac, string fot, string postu)
    {
        IdCandidato=idC;
        IdPartido=idP;
        Apellido=ape;
        Nombre=nom;
        FechaNacimiento=fNac;
        Foto=fot;
        Postulacion=postu;
    }
}
