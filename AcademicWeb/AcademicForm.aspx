<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcademicForm.aspx.cs" Inherits="AcademicWeb.AcademicForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Academic Tracking</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="./Scripts/jquery.datetimepicker.css" />
  <script src="./Scripts/jquery.js"></script>
  <script src="./Scripts/build/jquery.datetimepicker.full.min.js"></script>
  <script src="./Scripts/Javascript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" id="entirePage">

        <h3>Academic Tracking</h3>
        <br /><br />

        <!--[Begin Row BiostatList-AcademicType]-->
        <div class="container row">
         <!--===================[BQHS Employee Dropdown]========================================-->
        <%--<div class="container col-sm-6">
            <label for="biostatList">BQHS Employee:</label>

            <asp:DropDownList ID="biostatList" runat="server" AutoPostBack="false" CssClass="form-control" style="width:200px" OnSelectedIndexChanged="biostatList_SelectedIndexChanged">
                <asp:ListItem Value="fangr" Text="Rui Fang" />
                <asp:ListItem Value="hjahn" Text="Hyeong Jun Ahn" />
                <asp:ListItem Value="jamesdav" Text="James Davis" />
                <asp:ListItem Value="jjchen" Text="John Chen" />
                <asp:ListItem Value="jllr" Text="Jewels Robinson" />
                <asp:ListItem Value="kgandhi" Text="Krupa Gandhi" />
                <asp:ListItem Value="lime" Text="Eunjung Lim" />
                <asp:ListItem Value="rdcastro" Text="Rosa Castro" />
                <asp:ListItem Value="vedbar" Text="Vedbar Khadka" />
                <asp:ListItem Value="yrui" Text="Yang Rui" />
                <asp:ListItem Value="pwnhwang" Text="Phoebe Hwang" />
                <asp:ListItem Value="jdelosr" Text="Jason Delos Reyes" />
                <asp:ListItem Value="cksiri" Text="Chathura Siriwardhana" />
                <asp:ListItem Value="soyung" Text="So Yung Choi" />
                <asp:ListItem Value="dengy" Text="Youping Deng" />
            </asp:DropDownList>
        </div>--%>

        <div class="container col-sm-6 dropdown">
            <label>BQHS Employee <em>(you)</em>:</label>
            <select id="biostatList2" name="biostatList2" class="form-control" style="width: 200px" runat="server">
                <option value="fangr">Rui Fang</option>
                <option value="hjahn">Hyeong Jun Ahn</option>
                <option value="jamesdav">James Davis</option>
                <option value="jjchen">John Chen</option>
                <option value="jllr">Jewels Robinson</option>
                <option value="kgandhi">Krupa Gandhi</option>
                <option value="lime">Eunjung Lim</option>
                <option value="rdcastro">Rosa Castro</option>
                <option value="vedbar">Vedbar Khadka</option>
                <option value="yrui">Yang Rui</option>
                <option value="pwnhwang">Phoebe Hwang</option>
                <option value="jdelosr">Jason Delos Reyes</option>
                <option value="cksiri">Chathura Siriwardhana</option>
                <option value="soyung">So Yung Choi</option>
                <option value="dengy">Youping Deng</option>
            </select>
        </div>

         <!--===============[Academic Type Dropdown]============================================-->
        <%--<div class="container col-sm-6">
            <label for="academicTypeList">Academic Type:</label>
            <asp:DropDownList ID="academicTypeList" runat="server" AutoPostBack="false" CssClass="form-control" style="width:280px" OnSelectedIndexChanged="academicTypeList_SelectedIndexChanged">
                <asp:ListItem Value="1" Text="Seminar/Workshop/Lecture/Training" />
                <asp:ListItem Value="2" Text="Teaching" />
                <asp:ListItem Value="3" Text="Dissertation/Thesis Committee" />
                <asp:ListItem Value="4" Text="Panel/Committee" />
                <asp:ListItem Value="5" Text="Journal Review" />
                <asp:ListItem Value="6" Text="Grant Review" />
                <asp:ListItem Value="7" Text="Honor/Award" />
                <asp:ListItem Value="8" Text="Professional Training" />
                <asp:ListItem Value="9" Text="Mentoring K awards and other grants" />
                <asp:ListItem Value="10" Text="Data Safety Monitoring Committee" />
                <asp:ListItem Value="11" Text="Other" />
            </asp:DropDownList>
        </div>--%>

        <div class="container col-sm-6 dropdown">
            <label>Academic Type:</label>
            <select id="academicTypeList2" name="academicTypeList2" class="form-control" style="width: 280px" runat="server">
                <option value="1">Seminar/Workshop/Lecture/Training</option>
                <option value="2">Teaching</option>
                <option value="3">Disseration/Thesis Committee</option>
                <option value="4">Panel/Committee</option>
                <option value="5">Journal Review</option>
                <option value="6">Grant Review</option>
                <option value="7">Honor/Award</option>
                <option value="8">Professional Training</option>
                <option value="9">Mentoring K awards and other grants</option>
                <option value="10">Data Safety Monitoring Committee</option>
                <option value="11">Other</option>
            </select>
        </div>
        
        </div> <!-- (End Row BiostatList-AcademicType) -->

        <br />

        
            

        <br />
        
        <!--=======================================================[BQHS Employee Checkboxes]=======================================================================-->
        <label for="biostats">BQHS Employee <em>(including yourself)</em>:</label>
        <div id="biostats" class="container">
            <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Rui" runat="server" Text="Rui Fang" Checked="true" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Jun" runat="server" Text="Hyeong Jun Ahn" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Jim" runat="server" Text="James Davis" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="John" runat="server" Text="John Chen" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>
        

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Jewels" runat="server" Text="Jewels Robinson" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>
       
        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Krupa" runat="server" Text="Krupa Gandhi" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Eunjung" runat="server" Text="Eunjung Lim" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Rosa" runat="server" Text="Rosa Castro" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Ved" runat="server" Text="Vedbar Khadka" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Yang" runat="server" Text="Yang Rui" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Phoebe" runat="server" Text="Phoebe Hwang" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Jason" runat="server" Text="Jason Delos Reyes" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Chathura" runat="server" Text="Chathura Siriwardhana" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Soyung" runat="server" Text="So Yung Choi" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        <div class="container col-xs-3">
            <div class="checkbox">
                <asp:CheckBox ID="Youping" runat="server" Text="Youping Deng" CssClass="empChk" ClientIdMode="Static" />
            </div>
        </div>

        </div>



        <br />


        
        <!-- ................................................Begin Seminar Training..............................................................-->
        <div class="container mainForm" id="seminarMod" runat="server">
    
        <h3>Seminar/Workshop/Lecture/Training Given</h3>

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
                    <asp:RequiredFieldValidator ID="rfSd" runat="server"
                        ControlToValidate="startdate"
                        ErrorMessage="The 'start date/time' field is required.  Please enter the current date/time if not available."
                        ForeColor="Red">
           </asp:RequiredFieldValidator>
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
                    <asp:RequiredFieldValidator ID="rfEd" runat="server"
                        ControlToValidate="enddate"
                        ErrorMessage="The 'end date/time' field is required.  Please enter the start date/time if not available."
                        ForeColor="Red">
           </asp:RequiredFieldValidator>
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
            <asp:RequiredFieldValidator ID="rfNoa" runat="server"
                ControlToValidate="noa"
                ErrorMessage="The 'number of attendees' field is required.  Please enter 0 if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>
            
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
            <asp:RequiredFieldValidator ID="rfComment" runat="server"
                ControlToValidate="comment"
                ErrorMessage="The 'comment' field is required.  Please enter N/A if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>
        </div>

    </div><!-- End Seminar Training Module -->





    <!-- .................................................Start Teaching................................................................................. -->
    <div class="container mainForm" id="teachingMod" runat="server">

        <h3>Teaching Courses</h3>

        <!--=======================================================[Semester (Dropdown)]=======================================================================-->
        <div class="row">
        <div class="form-group col-sm-6 dropdown">
            <label for="teaching_ss">Semester:</label>
            <select id="teaching_ss" name="teaching_ss" class="form-control" runat="server">
                <option value="1">Fall</option>
                <option value="2">Spring</option>
                <option value="3">Summer</option>
            </select>
            <%--<asp:TextBox ID="teaching_ss" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <%--<asp:RequiredFieldValidator ID="rftSS" runat="server"
                ControlToValidate="startingSem"
                ErrorMessage="The 'semester' field is required.  Please enter N/A if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>--%>
        </div>

            


        <!--=======================================================[Year (Enter Integer)]=======================================================================-->
        <div class="form-group col-sm-6">
            <label for="teaching_y">Year:</label>
            <asp:TextBox ID="teaching_y" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="retY" runat="server"
                ControlToValidate="teaching_y"
                ValidationExpression="\d+"
                Display="Static"
                EnableClientScript="true"
                ErrorMessage="Please enter a valid integer only."
                ForeColor="DarkOrange"></asp:RegularExpressionValidator>
            <br />
            <asp:RangeValidator ID="rvtY" runat="server"
                ControlToValidate="teaching_y"
                MinimumValue="1900"
                MaximumValue="2100"
                ErrorMessage="Please enter a year value from 1900 to 2100 only."
                ForeColor="DarkOrange"></asp:RangeValidator>
            <%--<asp:RequiredFieldValidator ID="rftY" runat="server"
                ControlToValidate="teaching_y"
                ErrorMessage="The 'Year' field is required.  Please enter 1900 if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>--%>
            
        </div>
        </div>
        <!--=======================================================[Course Title]=======================================================================-->
        <div class="form-group">
            <label for="teaching_ct">Course Title:</label>
            <asp:TextBox ID="teaching_Ct" runat="server" CssClass="form-control"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="rftCt" runat="server"
                ControlToValidate="teaching_Ct"
                ErrorMessage="The 'course title' field is required.  Please enter N/A if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>--%>
        </div>
        <!--=======================================================[Course Number]=======================================================================-->
        <div class="form-group">
            <label for="teaching_cn">Course Number:</label>
            <asp:TextBox ID="teaching_cn" runat="server" CssClass="form-control"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="rftCn" runat="server"
                ControlToValidate="teaching_cn"
                ErrorMessage="The 'course number' field is required.  Please enter 0 if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>--%>
        </div>
        <!--=======================================================[Number of Credits Taught]=======================================================================-->
        <div class="form-group">
            <label for="teaching_noc">Number of Credits Taught:</label>
            <asp:TextBox ID="teaching_noc" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="retNoc" runat="server"
                ControlToValidate="teaching_noc"
                ValidationExpression="\d+"
                Display="Static"
                EnableClientScript="true"
                ErrorMessage="Please enter a integer value only."
                ForeColor="DarkOrange"></asp:RegularExpressionValidator>
            <%--<asp:RequiredFieldValidator ID="rftNoc" runat="server"
                ControlToValidate="teaching_noc"
                ErrorMessage="The 'number of credits taught' field is required.  Please enter 0 if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>--%>
        </div>
        <!--=======================================================[Number of Students]=======================================================================-->
        <div class="form-group">
            <label for="teaching_nos">Number of Students:</label>
            <asp:TextBox ID="teaching_nos" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RegularExpressionValidator ID="retNos" runat="server"
                ControlToValidate="teaching_nos"
                ValidationExpression="\d+"
                Display="Static"
                EnableClientScript="true"
                ErrorMessage="Please enter a integer value only."
                ForeColor="DarkOrange"></asp:RegularExpressionValidator>
            <%--<asp:RequiredFieldValidator ID="rftNos" runat="server"
                ControlToValidate="teaching_nos"
                ErrorMessage="The 'number of students' field is required.  Please enter 0 if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>--%>
        </div>
        <!--=======================================================[Comments]=======================================================================-->
        <div class="form-group">
            <label for="teaching_comment">Comments:</label>
            <asp:TextBox ID="teaching_comment" runat="server" CssClass="form-control" Rows="5" TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rftComment" runat="server"
                ControlToValidate="teaching_comment"
                ErrorMessage="The 'comment' field is required.  Please enter N/A if not applicable/available."
                ForeColor="Red">
           </asp:RequiredFieldValidator>
        </div>



    </div><!-- End Teaching Module -->
      
    <!-- ................................................Begin Dissertation/Thesis..............................................................-->
        <div class="container mainForm" id="dissertationMod" runat="server">
            <h3>Dissertation/Thesis</h3>
        </div><!--End Disseration Module -->

    <!-- ................................................Begin Panel/Committee..............................................................-->
        <div class="container mainForm" id="panelMod" runat="server">
            <h3>Panel/Committee</h3>
        </div><!--End Panel Module -->

    <!-- ................................................Begin Journal Review..............................................................-->
        <div class="container mainForm" id="journalMod" runat="server">
            <h3>Journal Review</h3>
        </div><!--End Journal Module -->

    <!-- ................................................Begin Grant Review..............................................................-->
        <div class="container mainForm" id="grantMod" runat="server">
            <h3>Grant Review</h3>
        </div><!--End Grant Module -->

    <!-- ................................................Begin Honor/Award..............................................................-->
        <div class="container mainForm" id="honorMod" runat="server">
            <h3>Honor/Award</h3>
        </div><!--End Honor Module -->

    <!-- ................................................Begin Professional Training..............................................................-->
        <div class="container mainForm" id="professionalMod" runat="server">
            <h3>Professional Training</h3>
        </div><!--End Professional Module -->

    <!-- ................................................Begin Mentoring K awards and other grants..............................................................-->
        <div class="container mainForm" id="mentorMod" runat="server">
            <h3>Mentoring K awards and other grants</h3>
        </div><!--End Mentor Module -->

    <!-- ................................................Begin Data Safety Monitorning Committee..............................................................-->
        <div class="container mainForm" id="dataMod" runat="server">
            <h3>Data Safety Monitorning Committee</h3>
        </div><!--End Data Module -->

    <!-- ................................................Begin Other..............................................................-->
        <div class="container mainForm" id="otherMod" runat="server">
            <h3>Other</h3>
        </div><!--End Other Module -->
               


        <!--=======================================================[Submit (Everyone's button!!!)]=======================================================================-->
        <div style="text-align: right">
            <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="Submit_Click" />
        </div>
        
      



    
    </div> <!-- END ENTIRE PAGE -->
    </form>
</body>
</html>