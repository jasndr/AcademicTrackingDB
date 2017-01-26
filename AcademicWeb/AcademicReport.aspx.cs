using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace AcademicWeb
{
    public partial class AcademicReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        protected void GetReport_Click(object sender, EventArgs e)
        {
            
            Microsoft.Reporting.WebForms.ReportDataSource reportDataSource = new Microsoft.Reporting.WebForms.ReportDataSource();

            String academicSelect = AcademicTypeList.SelectedItem.ToString();

            switch (academicSelect)
            {
                case "Seminar/Workshop/Lecture/Training":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = semDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report1-Seminar.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                case "Teaching":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = TeachDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report2-Teach.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                case "Dissertation/Thesis Committee":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = disDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report3-Dissertation.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                case "Panel/Committee":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = panelDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report4-Panel.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                case "Journal Review":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = journalDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report5-Journal.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                case "Grant Review":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = grantDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report6-Grant.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                case "Honor/Award":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = honorDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report7-Honor.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                case "Professional Traning":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = profDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report8-Professional.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                case "Mentor for K awards and other grants":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = mentorDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report9-Mentor.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                case "Data Safety Monitoring Committee":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = dataDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report10-Data.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                case "Other":
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = otherDS3;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report11-Other.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
                default:
                    ReportViewer1.LocalReport.DataSources.Clear();
                    reportDataSource.Value = GEdatasource2;
                    reportDataSource.Name = "DataSet1";
                    ReportViewer1.LocalReport.DataSources.Add(reportDataSource);
                    ReportViewer1.LocalReport.ReportPath = "Report1.rdlc";
                    ReportViewer1.LocalReport.Refresh();
                    break;
            }
            ReportViewer1.LocalReport.Refresh();

        }
    }



    

   // }
}