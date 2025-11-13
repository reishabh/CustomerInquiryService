# Customer Inquiry Service

A lightweight Customer Inquiry micro-service implemented in C# (ASP.NET / Web API) with Swagger UI support.

## 📄 Overview

The Customer Inquiry Service is designed to handle customer inquiry requests in a modular, layered architecture. It uses a clean separation of concerns across Model, Data Access Layer (DAL), Business Access Layer (BAL) and Service layers. The project also exposes a REST API documented with Swagger UI.

Key features include:

- Layered architecture: `CustomerInquiry.Model`, `CustomerInquiry.DAL`, `CustomerInquiry.BAL`, `CustomerInquiry.Service`.  
- ASP.NET Web API backend (C#).  
- Swagger UI integration for easy API exploration.  
- Clean separation of responsibilities (models, data access, business logic, service endpoints).  
- Ready for extension (e.g., addition of more endpoints, persistence backend modifications).

## 🧱 Architecture & Modules

| Module | Responsibility |
|--------|----------------|
| `CustomerInquiry.Model` | Domain models and DTOs — defines the entities for the service. |
| `CustomerInquiry.DAL` | Data Access Layer — repository/DAO implementations, mapping between model and persistent storage. |
| `CustomerInquiry.BAL` | Business Access Layer — business logic, validation, transaction management. |
| `CustomerInquiry.Service` | Service / API layer — ASP.NET Web API controllers, endpoints, request/response handling, Swagger UI. |
| `CustomerInquiry.Service.sln` | Solution file that brings together all modules/projects. |

## 🚀 Getting Started

### Prerequisites

- [.NET Framework / .NET Core] version consistent with the project (check the `.sln`).  
- Visual Studio (or Visual Studio Code with C# extensions).  
- (Optional) SQL Server or other database server if you change the DAL to persist to DB.  
- Internet connection (for restoring NuGet packages, Swagger UI assets, etc).

### Build & Run

1. Clone the repo:  
   ```bash
   git clone https://github.com/reishabh/CustomerInquiryService.git
   cd CustomerInquiryService
