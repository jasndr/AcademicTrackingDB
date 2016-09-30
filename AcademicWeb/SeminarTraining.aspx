<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeminarTraining.aspx.cs" Inherits="AcademicWeb.SeminarTraining" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Seminar/Workshop/Lecture/Training Given</title>
    <style type="text/css">
        #Text1 {
            margin-bottom: 4px;
        }
    </style>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <%-- <script src="~/Script/jquery.ui.timepicker.js"></script>--%>
  <link rel="stylesheet" type="text/css" href="./Scripts/jquery.datetimepicker.css" />
  <script src="./Scripts/jquery.js"></script>
  <script src="./Scripts/build/jquery.datetimepicker.full.min.js"></script>
</head>

<body>
    <form id="form1" runat="server">
    <div class="container">
    
        <h3>Seminar/Workshop/Lecture/Training Given</h3>
        
        <!--=======================================================[BQHS Employee Checkboxes]=======================================================================-->
        <label for="biostats">BQHS Employee:</label>
        <div id="biostats" class="container">
            <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Rui" runat="server" Text="Rui Fang" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Jun" runat="server" Text="Hyeong Jun Ahn" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Jim" runat="server" Text="James Davis" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="John" runat="server" Text="John Chen" />
            </div>
        </div>
        

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Jewels" runat="server" Text="Jewels Robinson" />
            </div>
        </div>
       
        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Krupa" runat="server" Text="Krupa Gandhi" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Eunjung" runat="server" Text="Eunjung Lim" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Rosa" runat="server" Text="Rosa Castro" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Ved" runat="server" Text="Vedbar Khadka" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Yang" runat="server" Text="Yang Rui" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Phoebe" runat="server" Text="Phoebe Hwang" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Jason" runat="server" Text="Jason Delos Reyes" Checked="true" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Chathura" runat="server" Text="Chathura Siriwardhana" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Soyung" runat="server" Text="So Yung Choi" />
            </div>
        </div>

        <div class="container">
            <div class="checkbox">
                <asp:CheckBox ID="Youping" runat="server" Text="Youping Deng" />
            </div>
        </div>

        </div>



        <br />

        <!--=======================================================[Organization]=======================================================================-->
        <div class="form-group">
            <label for="org">Organization:</label>
            <asp:TextBox ID="org" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfOrg" runat="server"
                ControlToValidate="org"
                ErrorMessage="The 'organization' field is required.  Please enter N/A if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>
        </div>

        <!--=======================================================[Title]=======================================================================-->
        <div class="form-group">
            <label for="title">Title:</label>
            <asp:TextBox ID="title" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfTitle" runat="server"
                ControlToValidate="title"
                ErrorMessage="The 'title' field is required.  Please enter N/A if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>
        </div>

        <!--=======================================================[Start/End Date/Time]=======================================================================-->
        <div class="row">
        <div class="col-sm-6">
            <!--=====[Start Date/Time]====-->
            <div class="form-group">
                <div class="input-group date" id="datetimepicker1">
                    <label for="startdate">Start Date/Time:</label>
                    <asp:TextBox ID="startdate" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <script type="text/javascript">
                jQuery.noConflict();
                $(document).ready(function () {
                    $('#startdate').datetimepicker({
                        formatTime: 'g:i A',
                        format: 'm/d/Y H:i'
                    });
                });
            </script>
        </div>
        
        <div class="col-sm-6">
            <!--=====[End Date/Time]====-->
            <div class="form-group">
                <div class="input-group date" id="datetimepicker2">
                    <label for="enddate">End Date/Time:</label>
                    <asp:TextBox ID="enddate" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <script type="text/javascript">
                jQuery.noConflict();
                $(document).ready(function () {
                    $('#enddate').datetimepicker({
                        formatTime: 'g:i A',
                        format: 'm/d/Y H:i'
                    });
                });
            </script>
            
        </div>
        </div>
        

        <!--=======================================================[Number of Attendees]=======================================================================-->
        <div class="form-group">
            <label for="noa">Number of Attendees</label>
            <asp:TextBox ID="noa" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="reNoa" runat="server"
                ControlToValidate="noa"
                ValidationExpression="\d+"
                Display="Static"
                EnableClientScript="true"
                ErrorMessage="Please enter an integer value only."
                ForeColor="DarkOrange"></asp:RegularExpressionValidator>
            
        </div>

        <!--=======================================================[Course Number]=======================================================================-->
        <div class="form-group">
            <label for="cn">Course Number:</label>
            <asp:TextBox ID="cn" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!--=======================================================[Comments]=======================================================================-->
        <div class="form-group">
            <label for="comment">Comments:</label>
            <asp:TextBox ID="comment" runat="server" CssClass="form-control" Rows="5" TextMode="MultiLine"></asp:TextBox>
        </div>

        <!--=======================================================[Submit]=======================================================================-->
        <div style="text-align: right">
            <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="Submit_Click" />
        </div>
        
        
      
        

    </div>
    </form>
</body>
    
</html>
