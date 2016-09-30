<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeachingCourses.aspx.cs" Inherits="AcademicWeb.TeachingCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teaching / Courses</title>
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
    
        <h3>Teaching/Courses</h3>
        
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

        
        <!--=======================================================[Semester]=======================================================================-->
        <div class="row">
            <div class="col-sm-6">
            
                <div class="form-group">
                    <label for="sem">Semester: </label>
                    <asp:TextBox ID="sem" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server"
                        Type="Integer"
                        MinimumValue="20"
                        MaximumValue="22"
                        ControlToValidate="year"
                        ErrorMessage="Please enter a semesterID. (20 = Fall, 21 = Spring, 22 = Summer) -- Testing purposes only; please report to Webmaster if this can be seen."
                        ForeColor="DarkOrange"></asp:RangeValidator>
                 </div>

            </div>
        <!--=======================================================[Year]=======================================================================-->
            <div class="col-sm-6">

        <div class="form-group">

            <label for="year">Year:</label>
            <asp:TextBox ID="year" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RangeValidator ID="rvYear" runat="server"
                Type="Integer"
                MinimumValue="1900"
                MaximumValue="2100"
                ControlToValidate="year"
                ErrorMessage="Please enter a valid year."
                ForeColor="DarkOrange"></asp:RangeValidator>
        </div>

            </div>
        </div>

        <!--=======================================================[Course Title]=======================================================================-->
        
        <div class="form-group">
            <label for="ct">Course Title:</label>
            <asp:TextBox ID="ct" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfCt" runat="server"
                ControlToValidate="ct"
                ErrorMessage="The 'Course Title' field is required.  Please enter N/A if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>
        </div>
        
        <!--=======================================================[Course Number]=======================================================================-->
        
        <div class="form-group">
            <label for="cn">Course Number:</label>
            <asp:TextBox ID="cn" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <!--=======================================================[Number of Credits Taught]=======================================================================-->
        <div class="row">
            <div class="col-sm-6">

        <div class="form-group">
            <label for="noc">Number of Credits Taught</label>
            <asp:TextBox ID="noc" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="reNoc" runat="server"
                ControlToValidate="noc"
                ValidationExpression="\d+"
                Display="Static"
                EnableClientScript="true"
                ErrorMessage="Please enter an integer value only."
                ForeColor="DarkOrange"></asp:RegularExpressionValidator>
        </div>

            </div>
        <!--=======================================================[Number of Students]=======================================================================-->
            <div class="col-sm-6">

        <div class="form-group">
            <label for="noa">Number of Students</label>
            <asp:TextBox ID="nos" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="reNos" runat="server"
                ControlToValidate="nos"
                ValidationExpression="\d+"
                Display="Static"
                EnableClientScript="true"
                ErrorMessage="Please enter an integer value only."
                ForeColor="DarkOrange"></asp:RegularExpressionValidator>
            
        </div>

                </div>
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
