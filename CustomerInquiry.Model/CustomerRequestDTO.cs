using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CustomerInquiry.Model
{

    public class CustomerRequestDTO
    {
        public int? CustomerId { get; set; }
        public string Email { get; set; }
    }
}
