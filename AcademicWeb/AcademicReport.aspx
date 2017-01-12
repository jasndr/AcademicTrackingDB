
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcademicReport.aspx.cs" Inherits="AcademicWeb.AcademicReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Report - Academic Tracking</title>
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="./Scripts/jquery.datetimepicker.css" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  <script src="./Scripts/jquery.js"></script>
  <script src="./Scripts/Javascript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <%--https://www.youtube.com/watch?v=WGKzFKgeoo8--%>
        <div class="text-center"><h1>Academic Tracking Report</h1></div>

        <div class="container form-group" style="border: 1px solid #CCC">

            <br />
            
            <div class="row">
                <div class="col-md-6 form-group">
                   <label for="BiostatList">Biostats: </label> <asp:DropDownList ID="BiostatList" runat="server" CssClass="form-control" DataSourceID="BioStatsSource" DataTextField="Name" DataValueField="Name" ></asp:DropDownList>
                    
                   
                    
                    <asp:SqlDataSource ID="BioStatsSource" runat="server" ConnectionString="<%$ ConnectionStrings:VedHPSqlServer %>" SelectCommand="/*WHERE        (EndDate  NULL)*/ SELECT NULL AS Name UNION SELECT Name FROM BioStats WHERE (EndDate &gt; GETDATE()) AND (Name &lt;&gt; 'Sample User') ORDER BY Name"></asp:SqlDataSource>
                    
                   
                    
                </div>
                <div class="col-md-6 form-group">
                    <br />
                    <asp:Button ID="GetReport" runat="server" Text="Get Report" CssClass="btn btn-primary" OnClientClick="getReportBtn" OnClick="GetReport_Click" />
                </div>
            </div>

            <br />
            
            <div class="row">
                <div class="col-md-6 form-group">
                    <label for="AcademicTypeList">Type:</label><asp:DropDownList ID="AcademicTypeList" runat="server" CssClass="form-control" DataSourceID="AcademicTypeSource" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                    <asp:SqlDataSource ID="AcademicTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:VedHPSqlServer %>" SelectCommand="SELECT NULL AS Name UNION SELECT Name FROM AcademicField WHERE (Category = 'AcademicType')"></asp:SqlDataSource>
                </div>
            </div>
            
            <br />

            <div class="row">
                <div class="col-md-3 form-group">

                <div class="form-group">
                <div class="input-group date" id="datetimepicker1">
                    <label for="StartDate">From:</label> <asp:TextBox ID="StartDate" runat="server" CssClass="form-control" Text="01/01/2001"></asp:TextBox>
                </div>

            </div>
            <script type="text/javascript">
                jQuery.noConflict();
                $(document).ready(function () {
                    $('#StartDate').datepicker({
                    });
                });
            </script>

                </div>

                <div class="col-md-3 form-group">
                    <label for="EndDate">To:</label> <asp:TextBox ID="EndDate" runat="server" CssClass="form-control" Text="01/01/2099"></asp:TextBox>
                </div>
                <script type="text/javascript">
                jQuery.noConflict();
                $(document).ready(function () {
                    $('#EndDate').datepicker({
                    });
                });
            </script>

            </div>

         
            <div class="container-fluid">

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div class="container reportForm" id="everythingRep" runat="server">

                    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report1.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="GEdatasource2" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
               

                    <asp:ObjectDataSource ID="GEdatasource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetEverythingTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="GEdatasource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetEverythingTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetEverythingTableAdapter"></asp:ObjectDataSource>
               
                </div>

                <div class="container reportForm" id="seminarRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer2" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report1-Seminar.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="semDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="semDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetSeminarReport4TableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetSeminarReport4TableAdapter"></asp:ObjectDataSource>
                </div>


                <div class="container reportForm" id="teachingRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager3" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer3" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report2-Teach.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="TeachDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="TeachDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetTeachingTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetTeachingTableAdapter"></asp:ObjectDataSource>
                </div>


                <div class="container reportForm" id="dissertationRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager4" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer4" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report3-Dissertation.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="disDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="disDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetDissertationTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="disDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetDissertationTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetDissertationTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetDissertationTableAdapter"></asp:ObjectDataSource>
                </div>


                <div class="container reportForm" id="panelRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager5" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer5" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report4-Panel.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="panelDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="panelDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetPanelTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="panelDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetPanelTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetPanelTableAdapter"></asp:ObjectDataSource>
                </div>


                <div class="container reportForm" id ="journalRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager6" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer6" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report5-Journal.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="journalDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="journalDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetJournalTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="journalDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetJournalTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetJournalTableAdapter"></asp:ObjectDataSource>
                </div>


                <div class="container reportForm" id="grantRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager7" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer7" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report6-Grant.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="grantDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="grantDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetGrantTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="grantDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetGrantTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetGrantTableAdapter"></asp:ObjectDataSource>
                </div>


                <div class="container reportForm" id="honorRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager8" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer8" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report7-Honor.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="honorDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="honorDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetHonorTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="honorDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetHonorTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetHonorTableAdapter"></asp:ObjectDataSource>
                </div>


                <div class="container reportForm" id="professionalRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager9" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer9" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report8-Professional.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="profDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="profDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetProfessionalTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="profDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetProfessionalTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource10" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetProfessionalTableAdapter"></asp:ObjectDataSource>
                </div>


                <div class="container reportForm" id="mentorRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager10" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer10" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report9-Mentor.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="mentorDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="mentorDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetMentorTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="mentorDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetMentorTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource11" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetMentorTableAdapter"></asp:ObjectDataSource>
                </div>


                <div class="container reportForm" id="dataRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager11" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer11" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report10-Data.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="dataDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="dataDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetDataTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dataDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetDataTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource12" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetDataTableAdapter"></asp:ObjectDataSource>
                </div>


                <div class="container reportForm" id="otherRep" runat="server">
                    <%--<asp:ScriptManager ID="ScriptManager12" runat="server"></asp:ScriptManager>--%>
                    <rsweb:ReportViewer ID="ReportViewer12" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="95%">
                        <LocalReport ReportPath="Report11-Other.rdlc">
                            <DataSources>
                                <rsweb:ReportDataSource DataSourceId="otherDS3" Name="DataSet1" />
                            </DataSources>
                        </LocalReport>
                    </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="otherDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetOtherTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="otherDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetOtherTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource13" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.GEdatasetTableAdapters.GetOtherTableAdapter"></asp:ObjectDataSource>
                </div>



            </div>
            

         
              

        </div>


    </div>
    </form>
</body>
</html>
