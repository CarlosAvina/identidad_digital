using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using DelfinAPI.DAL;

namespace DelfinAPI.Controllers
{
    [EnableCors("*", "*", "*")]
    [RoutePrefix("api/v1/sha")]
    public class shaController : ApiController
    {
        [HttpGet]
        [Route("{sha}")]
        public HttpResponseMessage ObtenerPorId([FromUri] string sha)
        {
            try
            {
                bool response = shaDAO.Consultar(sha);

                if (response != false)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, sha);
                }
                else
                {
                    return Request.CreateResponse(
                        HttpStatusCode.NotFound,
                        new
                        {
                            Mensaje = $"El sha no existe: {sha}"
                        });
                }
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(
                    HttpStatusCode.InternalServerError,
                    new
                    {
                        Mensaje = ex.Message
                    });
            }
        }

        [HttpPost]
        [Route("insertar")]
        public HttpResponseMessage Insertar([FromBody] string sha)
        {
            try
            {
                var response = shaDAO.Insertar(sha);
                return Request.CreateResponse(HttpStatusCode.OK, sha);
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(
                    HttpStatusCode.InternalServerError,
                    new
                    {
                        Mensaje = ex.Message
                    });
            }
        }
    }
}
