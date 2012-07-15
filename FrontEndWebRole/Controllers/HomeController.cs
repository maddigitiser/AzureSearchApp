using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Microsoft.ServiceBus;
using Microsoft.ServiceBus.Messaging;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.StorageClient;

using FrontEndWebRole.Models;
using SearchService;

namespace FrontEndWebRole.Controllers
{
    public class HomeController : Controller
    {
        QueryAndIndexService _searchService;
        QueueClient _client;

        public HomeController()
        {
            var sqlConnString = CloudConfigurationManager.GetSetting("SqlAzureServer");
            _searchService = new QueryAndIndexService(sqlConnString);

            var busConnString = CloudConfigurationManager.GetSetting("Microsoft.ServiceBus.ConnectionString");
            _client = QueueClient.CreateFromConnectionString(busConnString, "ProcessingQueue");
        }

        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

        //
        // POST: /Home/

        public ActionResult Results(SearchQueryViewModel model)
        {
            
            var results = _searchService.Query(model.Tokens);
            ViewBag.Query = model.Tokens;
            ViewBag.Results = results.OrderBy(r => r.Relevance);

            return View();
        }

        public ActionResult Submit()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Submit(SubmitFileViewModel model)
        {
            BrokeredMessage msg = new BrokeredMessage(String.Concat("Index request for ", model.FileName));
            msg.Properties["filename"] = model.FileName;
            msg.Properties["contents"] = model.FileContents;
            _client.Send(msg);
            ViewBag.Message = "File submitted for indexing!";
            return View();
        }
    }
}
