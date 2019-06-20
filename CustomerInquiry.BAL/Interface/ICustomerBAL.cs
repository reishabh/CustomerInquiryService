
using CustomerInquiry.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CustomerInquiry.BAL.Interface
{
    public interface ICustomerBAL
    {
        ValidationStatus ValidateRequest(CustomerRequestDTO inputParam);
        CustomerDTO GetCustomer(CustomerRequestDTO inputParam);
    }
}
