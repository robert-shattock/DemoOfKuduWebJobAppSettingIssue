using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoOfKuduWebJobAppSettingIssue.WebJob.NotInPlace
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine($"settingOrigin = {ConfigurationManager.AppSettings["settingOrigin"]}");
        }
    }
}
