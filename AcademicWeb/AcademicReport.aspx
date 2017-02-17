
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
        <div class="text-center"><h1>Academic Tracking/Grant Report</h1></div>

        <div class="container form-group" style="border: 1px solid #CCC">

            <br />
            
            <div class="row">
                    <div class="col-md-1 form-group">
                        <div class="radio">
                            <label><input id="a_radio" class="optradio1" type="radio" name="optradio" runat="server" />Academic</label>
                        </div>
                    </div>
                    <div class="col-md-1 form-group">
                        <div class="radio">
                            <label><input id="g_radio" class="optradio1" type="radio" name="optradio" runat="server" />Grant</label>
                        </div>
                    </div>
            </div>
            <div class="row">
                <div class="col-md-6 form-group">
                   <label for="BiostatList">Biostats: </label> <asp:DropDownList ID="BiostatList" runat="server" CssClass="form-control" DataSourceID="BioStatsSource" DataTextField="Name" DataValueField="Name" ></asp:DropDownList>
                    
               
                    
                    <asp:SqlDataSource ID="BioStatsSource" runat="server" ConnectionString="<%$ ConnectionStrings:VedHPSqlServer %>" SelectCommand="/*WHERE        (EndDate  NULL)*/ SELECT NULL AS Name UNION SELECT Name FROM BioStats WHERE (EndDate &gt; GETDATE()) AND (Name &lt;&gt; 'Sample User') ORDER BY Name"></asp:SqlDataSource>
                    
                   
                    
                </div>
                <div class="col-md-6 form-group">
                    <br />
                    <asp:Button ID="GetReport" runat="server" Text="Get Report" CssClass="btn btn-primary" OnClick="GetReport_Click"  />
                </div>
            </div>

            <br />
            
            <div class="row">
                <div id="academicListgroup">
                    <div class="col-md-3 form-group">
                        <label for="AcademicTypeList">Type:</label><asp:DropDownList ID="AcademicTypeList" runat="server" CssClass="form-control" DataSourceID="AcademicTypeSource" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                        <asp:SqlDataSource ID="AcademicTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:VedHPSqlServer %>" SelectCommand="SELECT NULL AS Name UNION SELECT Name FROM AcademicField WHERE (Category = 'AcademicType')"></asp:SqlDataSource>
                    </div>
                </div>
                <div id="grantListgroup">
                    <div class="col-md-3 form-group">
                        <label for="PI_List">PI:</label><asp:DropDownList ID="PI_List" runat="server" CssClass="form-control" DataSourceID="PIdatasource" DataTextField="PI" DataValueField="PI"></asp:DropDownList>
                        <asp:SqlDataSource ID="PIdatasource" runat="server" ConnectionString="<%$ ConnectionStrings:VedHPSqlServer %>" SelectCommand="SELECT NULL AS PI UNION SELECT ' ' + FirstName + ' ' + LastName AS PI FROM Invests ORDER BY PI"></asp:SqlDataSource>
                    </div>
                    <div class="col-md-3 form-group">
                        <label for="FundStatus">Fund Status:</label><asp:DropDownList ID="FundStatus" runat="server" CssClass="form-control" DataSourceID="FundDataSource" DataTextField="FundStatus" DataValueField="FundStatus"></asp:DropDownList>
                        <asp:SqlDataSource ID="FundDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VedHPSqlServer %>" SelectCommand="SELECT DISTINCT FundStatus FROM ViewGrant"></asp:SqlDataSource>
                    </div>
                    <div class="col-md-3 form-group">
                        <label for="IsInternal">Internal/External:</label><asp:DropDownList ID="IsInternal" runat="server" CssClass="form-control" DataSourceID="IEdatasource" DataTextField="Internal/External" DataValueField="Internal/External"></asp:DropDownList>
                        <asp:SqlDataSource ID="IEdatasource" runat="server" ConnectionString="<%$ ConnectionStrings:VedHPSqlServer %>" SelectCommand="SELECT NULL AS [Internal/External] UNION SELECT DISTINCT CASE WHEN IsInternal = 1 THEN 'Internal' ELSE 'External' END AS [Internal/External] FROM ViewGrant"></asp:SqlDataSource>
                    </div>
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
                        changeMonth: true,
                        changeYear: true,
                        showButtonPanel: true
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
                        changeMonth: true,
                        changeYear: true,
                        showButtonPanel: true
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
                     <asp:ObjectDataSource ID="semDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetSeminarReport4TableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                   <asp:ObjectDataSource ID="TeachDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetTeachingTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="disDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetDissertationTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="panelDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetPanelTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="journalDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetJournalTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                     <asp:ObjectDataSource ID="grantDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetGrantTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="honorDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetHonorTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="profDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetProfessionalTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="mentorDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetMentorTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dataDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetDataTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                     <asp:ObjectDataSource ID="otherDS3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GEdatasetTableAdapters.GetOtherTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="AcademicTypeList" Name="AcademicType" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="grantreportDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AcademicWeb.App_Code.GEdatasetTableAdapters.GetGrantReportTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="BiostatList" Name="Biostat" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="PI_List" Name="PI" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="FundStatus" Name="FundStatus" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="IsInternal" Name="IE" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="StartDate" Name="FromDate" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="EndDate" Name="ToDate" PropertyName="Text" Type="DateTime" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </div>



            </div>
            

         
              

        </div>


    </div>
    </form>
</body>
</html>
