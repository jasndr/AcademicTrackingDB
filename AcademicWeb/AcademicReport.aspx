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
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  <script src="./Scripts/jquery.js"></script>
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
                   <label for="BiostatList">Biostats: </label> <asp:DropDownList ID="BiostatList" runat="server" CssClass="form-control" DataSourceID="BioStatsSource" DataTextField="Name" DataValueField="Name" ></asp:DropDownList>
                    
                   
                    
                    <asp:SqlDataSource ID="BioStatsSource" runat="server" ConnectionString="<%$ ConnectionStrings:BioStatProject_DAConnectionString %>" SelectCommand="/*WHERE        (EndDate  NULL)*/ SELECT Name FROM BioStats WHERE (EndDate &gt; GETDATE()) ORDER BY Name"></asp:SqlDataSource>
                    
                   
                    
                </div>
                <div class="col-md-6 form-group">
                    <br />
                    <asp:Button ID="GetReport" runat="server" Text="Get Report" CssClass="btn btn-primary" />
                </div>
            </div>

            <br />
            
            <div class="row">
                <div class="col-md-6 form-group">
                    <label for="AcademicTypeList">Type:</label><asp:DropDownList ID="AcademicTypeList" runat="server" CssClass="form-control" DataSourceID="AcademicTypeSource" DataTextField="Name" DataValueField="Name"></asp:DropDownList>
                    <asp:SqlDataSource ID="AcademicTypeSource" runat="server" ConnectionString="<%$ ConnectionStrings:BioStatProject_DAConnectionString %>" SelectCommand="SELECT Name FROM AcademicField WHERE (Category = 'AcademicType')"></asp:SqlDataSource>
                </div>
            </div>
            
            <br />

            <div class="row">
                <div class="col-md-3 form-group">

                <div class="form-group">
                <div class="input-group date" id="datetimepicker1">
                    <label for="StartDate">From:</label> <asp:TextBox ID="StartDate" runat="server" CssClass="form-control"></asp:TextBox>
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
                    <label for="EndDate">To:</label> <asp:TextBox ID="EndDate" runat="server" CssClass="form-control"></asp:TextBox>
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
               

                
            </div>
            
            

           

              
        </div>


    </div>
    </form>
</body>
</html>
