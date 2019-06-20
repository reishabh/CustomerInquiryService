using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CustomerInquiry.Model
{
    public enum ValidationStatus
    {
        Success = 0,
        BadRequest = 1,
        NoInquiryCriteria = 2,
        InvalidCustomerId = 3,
        InvalidEmail = 4
    }
}
