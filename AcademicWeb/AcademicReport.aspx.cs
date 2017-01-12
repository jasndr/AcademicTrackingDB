using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcademicWeb
{
    public partial class AcademicReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetReport_Click(object sender, EventArgs e)
        {
            //ReportViewer1.LocalReport.Refresh();
            

            //String academicSelect = AcademicTypeList.SelectedValue;

            //switch (academicSelect)
            //{
            //    case "Seminar/Workshop/Lecture/Training":
            //        ReportViewer2.LocalReport.Refresh();
            //        //Response.Write("Seminar is selected");
            //        break;
            //    case "Teaching":
            //        ReportViewer3.LocalReport.Refresh();
            //        //Response.Write("Teach is selected");
            //        break;
            //    case "Dissertation/Thesis Committee":
            //        ReportViewer4.LocalReport.Refresh();
            //        break;
            //    case "Panel/Committee":
            //        ReportViewer5.LocalReport.Refresh();
            //        break;
            //    case "Journal Review":
            //        ReportViewer6.LocalReport.Refresh();
            //        break;
            //    case "Grant Review":
            //        ReportViewer7.LocalReport.Refresh();
            //        break;
            //    case "Honor/Award":
            //        ReportViewer8.LocalReport.Refresh();
            //        break;
            //    case "Professional Traning":
            //        ReportViewer9.LocalReport.Refresh();
            //        break;
            //    case "Mentor for K awards and other grants":
            //        ReportViewer10.LocalReport.Refresh();
            //        break;
            //    case "Data Safety Monitoring Committee":
            //        ReportViewer11.LocalReport.Refresh();
            //        break;
            //    case "Other":
            //        ReportViewer12.LocalReport.Refresh();
            //        break;
            //    default:
            //        ReportViewer1.LocalReport.Refresh();
            //       // Response.Write("Default is selected");
            //        break;
            //}

        }

        //private void GetReport(object sender, EventArgs e)
        //{
        //    using(SqlDataSource db = new SqlDataSource())
        //    {

        //    }
        //}





     //   AcademicReport 

    }
}