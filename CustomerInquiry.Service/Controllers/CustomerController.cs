using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using Newtonsoft.Json.Linq;
using System.Web.Http;
using CustomerInquiry.BAL.Service;
using CustomerInquiry.Model;
using CustomerInquiry.BAL.Interface;

namespace CustomerInquiry.Service.Controllers
{
    public class CustomerController : ApiController
    {
        [HttpPost]
        [Route("GetCustomer")]
        public HttpResponseMessage GetCustomer([FromBody] CustomerRequestDTO inputParam)
        {
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, "Not found");
            try
            {
                ICustomerBAL customerBAL = new CustomerBAL();
                switch (customerBAL.ValidateRequest(inputParam))
                {
                    case ValidationStatus.Success:
                        var output = customerBAL.GetCustomer(inputParam);
                        if (output != null)
                            response = Request.CreateResponse(HttpStatusCode.OK, output);
                        break;
                    case ValidationStatus.BadRequest:
                        response = Request.CreateResponse(HttpStatusCode.BadRequest, "");
                        break;
                    case ValidationStatus.InvalidCustomerId:
                        response = Request.CreateResponse(HttpStatusCode.BadRequest, "Invalid Customer Id");
                        break;
                    case ValidationStatus.InvalidEmail:
                        response = Request.CreateResponse(HttpStatusCode.BadRequest, "Invalid Email");
                        break;
                    case ValidationStatus.NoInquiryCriteria:
                        response = Request.CreateResponse(HttpStatusCode.BadRequest, "No inquiry criteria");
                        break;
                }
               
            }
            catch (Exception)
            {
                response = Request.CreateResponse(HttpStatusCode.BadRequest, "");
            }
            return response;
        }
    }
}
