using Microsoft.AspNetCore.Mvc;

namespace tp6.Controllers;

public class HomeController : Controller{

public IActionResult Index()
    {
        ViewBag.Partidos = BD.listarPartidos();
        return View("Index");
    }

    public IActionResult VerDetallePartido(int idPartido)
    {
        Partido partido = BD.VerInfoPartido(idPartido);
        List<Candidato> candidatos = BD.listarCandidato(idPartido);

        ViewBag.Partido = partido;
        ViewBag.Candidatos = candidatos;

        return View("VerDetallePartido");
    }

    public IActionResult VerDetalleCandidato(int idCandidato)
    {
        Candidato candidato = BD.VerInfoCandidato(idCandidato);
        ViewBag.Candidato = candidato;

        return View("VerDetalleCandidato");
    }

    public IActionResult AgregarCandidato(int idPartido)
    {
        ViewBag.IdPartido = idPartido;

        return View("FormularioCandidato");
    }

    [HttpPost]
    public IActionResult GuardarCandidato(Candidato candidato)
    {
        BD.AgregarCandidato(candidato);

        return RedirectToAction("VerDetallePartido", new { idPartido = candidato.IdPartido });
    }
//ivan nunca va a ver esto. ya lo vi idiota chileno gordito.
    public IActionResult EliminarCandidato(int idCandidato, int idPartido)
    {
        BD.EliminarCandidato(idCandidato);

        return RedirectToAction("VerDetallePartido", new{idPartido=idPartido});
    }
        public IActionResult Elecciones()
        {
        
         return View("Elecciones");
        }


         public IActionResult Creditos()
        {
        
         return View("Creditos");
        }
}