using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace AcademicWeb
{
    public partial class AcademicForm : System.Web.UI.Page
    {
        //Connection to Database
        SqlConnection con = new SqlConnection(
                WebConfigurationManager.ConnectionStrings["VedHPSqlServer"].ConnectionString);

        String currEmpl = "fangr";
        int academicTypeVal = 1;
        int startSemesterId = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectDB();
        }

        public void ConnectDB()
        {
            //Open Database
            con.Open();
            //If the database is open, a success message appears
            if (con.State == System.Data.ConnectionState.Open)
            {
                DisplayMessage(this, "Connection to the database successful");
            }
            //Closes Database
            //con.Close();


        }

        //How to display the message
        static public void DisplayMessage(Control page, string msg)
        {
            string myScript = String.Format("alert('{0}')", msg);
            ScriptManager.RegisterStartupScript(page, page.GetType(), "MyScript", myScript, true);
        }

        //What happens when a value is selected in Biostats Dropdown list
        protected void biostatList2_SelectedIndexChanged(Object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
            }
            else
            {
                String selectedValue = biostatList2.Value;

                switch (selectedValue)
                {
                    case "fangr":
                        currEmpl = "fangr";
                        break;
                    case "hjahn":
                        currEmpl = "hjahn";
                        break;
                    case "jamesdav":
                        currEmpl = "jamesdav";
                        break;
                    case "jjchen":
                        currEmpl = "jjchen";
                        break;
                    case "jllr":
                        currEmpl = "jllr";
                        break;
                    case "kgandhi":
                        currEmpl = "kgandhi";
                        break;
                    case "lime":
                        currEmpl = "lime";
                        break;
                    case "rdcastro":
                        currEmpl = "rdcastro";
                        break;
                    case "vedbar":
                        currEmpl = "vedbar";
                        break;
                    case "yrui":
                        currEmpl = "yrui";
                        break;
                    case "pwnhwang":
                        currEmpl = "pwnhwang";
                        break;
                    case "jdelosr":
                        currEmpl = "jdelosr";
                        break;
                    case "cksiri":
                        currEmpl = "cksiri";
                        break;
                    case "soyung":
                        currEmpl = "soyung";
                        break;
                    case "dengy":
                        currEmpl = "dengy";
                        break;
                    default:
                        currEmpl = "Rui";
                        break;
                }

                            
            }
        }

     

        protected void academicTypeList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
            }
            else
            {


                int selectedValue = Int32.Parse(academicTypeList2.Value);
      

                switch (selectedValue)
                {
                    case 1:
                        academicTypeVal = 1;
                        break;
                    case 2:
                        academicTypeVal = 2;
                        break;
                    case 3:
                        academicTypeVal = 3;
                        break;
                    case 4:
                        academicTypeVal = 4;
                        break;
                    case 5:
                        academicTypeVal = 5;
                        break;
                    case 6:
                        academicTypeVal = 6;
                        break;
                    case 7:
                        academicTypeVal = 7;
                        break;
                    case 8:
                        academicTypeVal = 8;
                        break;
                    case 9:
                        academicTypeVal = 9;
                        break;
                    case 10:
                        academicTypeVal = 10;
                        break;
                    case 11:
                        academicTypeVal = 11;
                        break;
                    default:
                        academicTypeVal = 0;
                        break;
                }

            
            }

        }


        protected void teaching_ss_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedValue = Int32.Parse(teaching_ss.Value);
            switch (selectedValue)
            {
                case 1:
                    startSemesterId = 1;
                    break;
                case 2:
                    startSemesterId = 2;
                    break;
                case 3:
                    startSemesterId = 3;
                    break;
                default:
                    startSemesterId = 1;
                    break;

            }
        }


        //What happens if the "submit" button is clicked
        protected void Submit_Click(object sender, EventArgs e)
        {
            //start code from here
            //con.Open();

            String staff = getStaff();

            SqlCommand cmd = new SqlCommand(("USE [BiostatProject_DA]; " +
                                             //"GO "+
                                             "DECLARE @Rui BIGINT, @Jun BIGINT, @Jim BIGINT, @John BIGINT, @Jewels BIGINT, @Krupa BIGINT, @Eunjung BIGINT, @Rosa BIGINT, " +
                                             "@Ved BIGINT, @Yang BIGINT, @Phoebe BIGINT, @Jason BIGINT, @Soyung BIGINT, @Chathura BIGINT, @Youping BIGINT " +
                                             "SET @Rui = POWER(2, 4) " +
                                             "SET @Jun = POWER(2, 8) " +
                                             "SET @Jim = POWER(2, 9) " +
                                             "SET @John = POWER(2, 10) " +
                                             "SET @Jewels = POWER(2, 11) " +
                                             "SET @Krupa = POWER(2, 12) " +
                                             "SET @Eunjung = POWER(2, 13) " +
                                             "SET @Rosa = POWER(2, 15) " +
                                             "SET @Ved = POWER(2, 16) " +
                                             "SET @Yang = POWER(2, 19) " +
                                             "SET @Phoebe = POWER(2, 22) " +
                                             "SET @Jason = POWER(2, 30) " +
                                             "SET @Soyung = POWER(cast(2 as bigint), 31) " +
                                             "SET @Chathura = POWER(cast(2 as bigint), 32) " +
                                             "SET @Youping = POWER(cast(2 as bigint), 33) " +
                                            //INSERT INTO AcademicMasterActivity(AcademicTypeId, Organization, EventTitle, StartDate, EndDate, NumOfAttendees, CourseNum, Comments, BiostatBitwiseSum, Creator, DateCreated)
                                            "INSERT INTO AcademicMasterActivity(AcademicTypeId, Organization, EventTitle, StartDate, EndDate, NumOfAttendees, CourseNum, Comments, BiostatBitwiseSum, Creator, DateCreated) VALUES " +
                                            "("+academicTypeVal+", '" + org.Text + "', '" + title.Text + "', '" + startdate.Text + "', '" + enddate.Text + "', " + noa.Text + ", '" + cn.Text + "', '" + comment.Text + "', " + staff + ", '" +currEmpl+ "', getDATE());"), con);

            //"(1, 'Organization', 'EventTitle',  '11/02/2016 15:00', '11/03/2016 17:00', 32, '2342304', 'Comments', (@Jim | @Jun), 'jdelosr', GETDATE());



            cmd.ExecuteNonQuery();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your event has been saved!')", true);

            con.Close();

            Response.Redirect("Default.aspx");

        }


        protected String getStaff()
        {

            System.Text.StringBuilder staff = new System.Text.StringBuilder();
            //if staff is clicked, and there is nothing initated, create string then append

            if (!(Rui.Checked|Jun.Checked|Jim.Checked|John.Checked|Jewels.Checked|Krupa.Checked|Eunjung.Checked|Eunjung.Checked|Rosa.Checked
                | Ved.Checked | Yang.Checked | Phoebe.Checked | Jason.Checked | Chathura.Checked | Soyung.Checked | Youping.Checked))
            {
                staff.Append("(@Jason)");
            } else
            {
                if (Rui.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Rui");
                    }
                    else
                    {
                        staff.Append(" | @Rui");
                    }

                }
                if (Jun.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Jun");
                    }
                    else
                    {
                        staff.Append(" | @Jun");
                    }
                }
                if (Jim.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Jim");
                    }
                    else
                    {
                        staff.Append(" | @Jim");
                    }
                }
                if (John.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@John");
                    }
                    else
                    {
                        staff.Append(" | @John");
                    }
                }
                if (Jewels.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Jewels");
                    }
                    else
                    {
                        staff.Append(" | @Jewels");
                    }
                }

                if (Krupa.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Krupa");
                    }
                    else
                    {
                        staff.Append(" | @Krupa");
                    }
                }
                if (Eunjung.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Eunjung");
                    }
                    else
                    {
                        staff.Append(" | @Eunjung");
                    }
                }
                if (Rosa.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Rosa");
                    }
                    else
                    {
                        staff.Append(" | @Rosa");
                    }
                }
                if (Ved.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Ved");
                    }
                    else
                    {
                        staff.Append(" | @Ved");
                    }
                }
                if (Yang.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Yang");
                    }
                    else
                    {
                        staff.Append(" | @Yang");
                    }
                }
                if (Phoebe.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Phoebe");
                    }
                    else
                    {
                        staff.Append(" | @Phoebe");
                    }
                }

                if (Jason.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Jason");
                    }
                    else
                    {
                        staff.Append(" | @Jason");
                    }
                }

                if (Chathura.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Chathura");
                    }
                    else
                    {
                        staff.Append(" | @Chathura");
                    }
                }
                if (Soyung.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Soyung");
                    }
                    else
                    {
                        staff.Append(" | @Soyung");
                    }
                }
                if (Youping.Checked)
                {
                    if (staff.Length == 0)
                    {
                        staff.Append("(@Youping");
                    }
                    else
                    {
                        staff.Append(" | @Youping");
                    }
                }

                staff.Append(")");
            }

            return staff.ToString();

        }



    }

    

}