using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Mgnt_System
{
    public partial class RegistrationPage : System.Web.UI.Page
    {

        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fname = txtFirstName.Text;
            string lname = txtLastName.Text;
            string gemail = txtEmail.Text;
            string pass = txtPassword.Text;
            string phone = txtPhoneNumber.Text;
            string aadhar = txtAadhar.Text;
            string dob = txtDOB.Text;

            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            string query = "Insert into tblGuest values (@fname,@lname,@email,@pass,@phone,@aadhar,@dob)";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("fname", fname);
            cmd.Parameters.AddWithValue("lname", lname);
            cmd.Parameters.AddWithValue("email", gemail);
            cmd.Parameters.AddWithValue("pass", pass);
            cmd.Parameters.AddWithValue("phone", phone);
            cmd.Parameters.AddWithValue("aadhar", aadhar);
            cmd.Parameters.AddWithValue("dob", dob);

            cmd.ExecuteNonQuery();

            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
            txtAadhar.Text = string.Empty;
            txtDOB.Text = string.Empty;

            Response.Write("<script>alert('Guest registered successfully!');</script>");
            Response.Redirect("GuestLoginPage.aspx");
        }

      
    }
}