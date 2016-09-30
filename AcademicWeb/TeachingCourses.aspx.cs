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
    public partial class TeachingCourses : System.Web.UI.Page
    {

        //Connection to Database
        SqlConnection con = new SqlConnection(
                WebConfigurationManager.ConnectionStrings["VedHPSqlServer"].ConnectionString);


        //double jun = Math.Pow(2, 8);
        //double jim = Math.Pow(2, 9);
        //double john = Math.Pow(2, 10);
        //double jewels = Math.Pow(2, 11);
        //double krupa = Math.Pow(2, 12);
        //double eunjung = Math.Pow(2, 12);
        //double rosa = Math.Pow(2, 15);
        //double ved = Math.Pow(2, 16);
        //double yang = Math.Pow(2, 19);
        //double phoebe = Math.Pow(2, 22);
        //double jason = Math.Pow(2, 30);
        //double soyung = Math.Pow(2, 31);
        //double chathura = Math.Pow(2, 32);
        //double youping = Math.Pow(2, 33);



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

        //What happens if the "submit" button is clicked
        protected void Submit_Click(object sender, EventArgs e)
        {
            //start code from here
            //con.Open();

            String staff = getStaff();

            SqlCommand cmd = new SqlCommand(("USE [BiostatProject_DA]; " +
                                             //"GO "+
                                             "DECLARE @Jun BIGINT, @Jim BIGINT, @John BIGINT, @Jewels BIGINT, @Krupa BIGINT, @Eunjung BIGINT, @Rosa BIGINT, " +
                                             "@Ved BIGINT, @Yang BIGINT, @Phoebe BIGINT, @Jason BIGINT, @Soyung BIGINT, @Chathura BIGINT, @Youping BIGINT " +
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
                                            //INSERT INTO AcademicMasterActivity(AcademicTypeId, Organization, StartSemesterId, StartDate, EventTitle, CourseNum, NumOfCredits, NumOfAttendees, Comments, BiostatBitwiseSum, Creator, DateCreated) VALUES "
                                            "INSERT INTO AcademicMasterActivity(AcademicTypeId, Organization, StartSemesterId, StartDate, EventTitle, CourseNum, NumOfCredits, NumOfAttendees, Comments, BiostatBitwiseSum, Creator, DateCreated) VALUES " +
                                            "(2, 'Biostatistics & Quantitative Health Sciences', 20, " + sem.Text + "', '" + year.Text + "', '" + ct.Text + "', '" + cn.Text + "', '" + noc.Text + "', " + nos.Text + "', '" + comment.Text + "', " + staff + ", 'jdelosr', getDATE());"), con);




            cmd.ExecuteNonQuery();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your event has been saved!')", true);

            con.Close();

            Response.Redirect("Default.aspx");

        }


        protected String getStaff()
        {

            System.Text.StringBuilder staff = new System.Text.StringBuilder();
            //if staff is clicked, and there is nothing initated, create string then append
            if (Rui.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Rui ");
                }
                else
                {
                    staff.Append("| @Rui");
                }

            }
            if (Jun.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Jun ");
                }
                else
                {
                    staff.Append("| @Jun");
                }
            }
            if (Jim.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Jim ");
                }
                else
                {
                    staff.Append("| @Jim");
                }
            }
            if (John.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@John ");
                }
                else
                {
                    staff.Append("| @John");
                }
            }
            if (Jewels.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Jewels ");
                }
                else
                {
                    staff.Append("| @Jewels");
                }
            }

            if (Krupa.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Krupa ");
                }
                else
                {
                    staff.Append("| @Krupa");
                }
            }
            if (Eunjung.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Eunjung ");
                }
                else
                {
                    staff.Append("| @Eunjung");
                }
            }
            if (Rosa.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Rosa ");
                }
                else
                {
                    staff.Append("| @Rosa");
                }
            }
            if (Ved.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Ved ");
                }
                else
                {
                    staff.Append("| @Ved");
                }
            }
            if (Yang.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Yang ");
                }
                else
                {
                    staff.Append("| @Yang");
                }
            }
            if (Phoebe.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Phoebe ");
                }
                else
                {
                    staff.Append("| @Phoebe");
                }
            }

            if (Jason.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Jason ");
                }
                else
                {
                    staff.Append("| @Jason");
                }
            }

            if (Chathura.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Chathura ");
                }
                else
                {
                    staff.Append("| @Chathura");
                }
            }
            if (Soyung.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Soyung ");
                }
                else
                {
                    staff.Append("| @Soyung");
                }
            }
            if (Youping.Checked)
            {
                if (staff.Length == 0)
                {
                    staff.Append("(@Youping ");
                }
                else
                {
                    staff.Append("| @Youping");
                }
            }

            staff.Append(")");

            return staff.ToString();

        }

    }
}