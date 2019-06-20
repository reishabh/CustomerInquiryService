using AutoMapper;
using CustomerInquiry.BAL.Interface;
using CustomerInquiry.DAL;
using CustomerInquiry.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Net.Http;
using System.Net.Mail;
using ValidationContext = System.ComponentModel.DataAnnotations.ValidationContext;

namespace CustomerInquiry.BAL.Service
{
    
    public class CustomerBAL : ICustomerBAL
    {
        public ValidationStatus ValidateRequest(CustomerRequestDTO inputParam)
        {
            if (inputParam != null)
            {
                if(inputParam.Email == null && inputParam.CustomerId == null)
                    return ValidationStatus.NoInquiryCriteria;
                if (inputParam.CustomerId != null && inputParam.CustomerId < 0)
                    return ValidationStatus.InvalidCustomerId;
                if (inputParam.Email != null)
                {
                    if(inputParam.Email.Length==0 || !IsValidEmail(inputParam.Email))
                    return ValidationStatus.InvalidEmail;
                }
                else
                {
                    if (inputParam.CustomerId == 0)
                        return ValidationStatus.InvalidCustomerId;
                }
                    
                return ValidationStatus.Success;
            }
            else
                return ValidationStatus.NoInquiryCriteria;
        }
        private bool IsValidEmail(string emailaddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);
                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }
        public CustomerDTO GetCustomer(CustomerRequestDTO inputParam)
        {
            CustomerDBEntities db = new CustomerDBEntities();
            CustomerDTO customer = null;
            #region AutoMapper intialization
            var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Customer, CustomerDTO>();
                cfg.CreateMap<Transaction, TransactionDTO>()
                .ForMember(vm => vm.Id, m => m.MapFrom(u => u.TransactionId))
                .ForMember(vm => vm.Date, m => m.MapFrom(u => u.TransactionDate.ToString("g", DateTimeFormatInfo.InvariantInfo)));
            });
            IMapper mapper = config.CreateMapper();
            #endregion

            #region Search Criteria
            if (inputParam.CustomerId > 0 && inputParam.Email != null && inputParam.Email.Length > 0)
            {
                var dbResult = db.Customers.Where(x => x.CustomerId == inputParam.CustomerId
                && x.Email == inputParam.Email).FirstOrDefault();
                if (dbResult != null)
                    customer = mapper.Map<Customer, CustomerDTO>(dbResult);
            }
            else if (inputParam.Email != null && inputParam.Email.Length > 0)
            {
                var dbResult = db.Customers.Where(x => x.Email == inputParam.Email).FirstOrDefault();
                if (dbResult != null)
                    customer = mapper.Map<Customer, CustomerDTO>(dbResult);
            }
            else if (inputParam.CustomerId > 0)
            {
                var dbResult = db.Customers.Where(x => x.CustomerId == inputParam.CustomerId).FirstOrDefault();
                if (dbResult != null)
                    customer = mapper.Map<Customer, CustomerDTO>(dbResult);
            } 
            #endregion

            return customer;
        }
    }
}
