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
  <script src="./Scripts/jquery.datetimepicker.js"></script>
  <script src="./Scripts/jquery.js"></script>
  <script src="./Scripts/build/jquery.datetimepicker.full.min.js"></script>
  <script src="./Scripts/Javascript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <%--https://www.youtube.com/watch?v=8oJdFF4-IHk--%>
        <div class="text-center"><h1>Academic Tracking Report</h1></div>

        <div class="container form-group" style="border: 1px solid #CCC">

            <br />
            
            <div class="row">
                <div class="col-md-6 form-group">
                   <label for="BiostatList">Biostats: </label> <asp:DropDownList ID="BiostatList" runat="server" CssClass="form-control" DataSourceID="BioStatNames" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                    <asp:ObjectDataSource ID="BioStatNames" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AcademicWeb.App_Code.DataSet1TableAdapters.BioStatsTableAdapter"></asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AcademicWeb.App_Code.DataSet1TableAdapters.BioStatsTableAdapter"></asp:ObjectDataSource>
                </div>
                <div class="col-md-6 form-group">
                    <br />
                    <asp:Button ID="GetReport" runat="server" Text="Get Report" CssClass="btn btn-primary" />
                </div>
            </div>

            <br />
            
            <div class="row">
                <div class="col-md-6 form-group">
                    <label for="AcademicTypeList">Type:</label><asp:DropDownList ID="AcademicTypeList" runat="server" CssClass="form-control" DataSourceID="AcademicType" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                    <asp:ObjectDataSource ID="AcademicType" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AcademicWeb.App_Code.DataSet1TableAdapters.AcademicFieldTableAdapter"></asp:ObjectDataSource>
                </div>
            </div>
            
            <br />

            <div class="row">
                <div class="col-md-3 form-group">
                    <%--<label for="StartDate">From:</label> <asp:TextBox ID="StartDate" runat="server" CssClass="form-control"></asp:TextBox>--%>

                    <div class="form-group">
                <div class="input-group date" id="datetimepicker1">
                    <label for="startdate">From:</label>
                    <asp:TextBox ID="startdate" runat="server" CssClass="form-control"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="rfSd" runat="server"
                        ControlToValidate="startdate"
                        ErrorMessage="The 'start date/time' field is required.  Please enter the current date/time if not available."
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>--%>
                </div>

            </div>
            <script type="text/javascript">
                jQuery.noConflict();
                $(document).ready(function () {
                    $('#startdate').datetimepicker({
                        //formatTime: 'g:i A',
                        formatDate: 'm/d/Y'
                    });
                });
            </script>

                </div>

                <div class="col-md-3 form-group">
                    <label for="EndDate">To:</label> <asp:TextBox ID="EndDate" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="container-fluid">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="600px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%">
                    <LocalReport ReportPath="Report1.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="DataSet2" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource4" runat="server"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AcademicWeb.App_Code.DataSet1TableAdapters.SeminarTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_Id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="Organization" Type="String" />
                        <asp:Parameter Name="StartDate" Type="DateTime" />
                        <asp:Parameter Name="EndDate" Type="DateTime" />
                        <asp:Parameter Name="NumOfAttendees" Type="Int32" />
                        <asp:Parameter Name="CourseNum" Type="String" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="Original_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="AcademicWeb.DataSet1TableAdapters.SeminarTableAdapter"></asp:ObjectDataSource>
            </div>
            
            

           

              
        </div>


    </div>
    </form>
</body>
</html>
