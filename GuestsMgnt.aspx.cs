using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Mgnt_System
{
    public partial class Guests : System.Web.UI.Page
    {

        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }

        private void BindGrid()
        {
            using (SqlConnection conn = new SqlConnection(strCon))
            {
                string query = "SELECT * FROM tblGuest";
                SqlDataAdapter sda = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                gvGuest.DataSource = dt;
                gvGuest.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string fname = txtFirstname.Text;
            string lname = txtLastname.Text;
            string email = txtEmail.Text;
            string pass = txtPass.Text;
            string phone = txtPhone.Text;
            string aadhar = txtAadhar.Text;
            string dob = txtDOB.Text;

            string query = "INSERT INTO tblGuest (f_Name, l_Name, g_email, password, phoneNo, aadhar, DOB) VALUES (@fname, @lname, @email, @pass, @phone, @aadhar, @dob)";

            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@fname", fname);
            cmd.Parameters.AddWithValue("@lname", lname);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@pass", pass);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@aadhar", aadhar);
            cmd.Parameters.AddWithValue("@dob", dob);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();

            txtFirstname.Text = string.Empty;
            txtLastname.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPass.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtAadhar.Text = string.Empty;
            txtDOB.Text = string.Empty;

        }

        protected void gvGuest_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gvGuest.SelectedRow;

            txtFirstname.Text = row.Cells[1].Text;
            txtLastname.Text = row.Cells[2].Text;
            txtEmail.Text = row.Cells[3].Text;
            txtPass.Text = row.Cells[4].Text;
            txtPhone.Text = row.Cells[5].Text;
            txtAadhar.Text = row.Cells[6].Text;
            //txtDOB.Text = row.Cells[7].Text;
            DateTime date;
            txtDOB.Text = DateTime.TryParse(row.Cells[7].Text, out date) ? date.ToString("yyyy-MM-dd") : "";

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            GridViewRow row = gvGuest.SelectedRow;
            string semail = row.Cells[3].Text;
            string fname = txtFirstname.Text;
            string lname = txtLastname.Text;
            string email = txtEmail.Text;
            string pass = txtPass.Text;
            string phone = txtPhone.Text;
            string aadhar = txtAadhar.Text;
            string dob = txtDOB.Text;

            string query = "UPDATE tblGuest SET f_Name = @fname, l_Name = @lname, g_email = @email, password=@pass, phoneNo = @phone, aadhar = @aadhar, DOB = @dob WHERE g_email = @semail";

            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@fname", fname);
            cmd.Parameters.AddWithValue("@lname", lname);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@pass", pass);
            cmd.Parameters.AddWithValue("@phone", phone);
            cmd.Parameters.AddWithValue("@aadhar", aadhar);
            cmd.Parameters.AddWithValue("@dob", dob);
            cmd.Parameters.AddWithValue("@semail", semail);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();

            txtFirstname.Text = string.Empty;
            txtLastname.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPass.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtAadhar.Text = string.Empty;
            txtDOB.Text = string.Empty;

        }

        protected void gvGuest_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvGuest.Rows[e.RowIndex];

            string email = row.Cells[3].Text;
            string query = "Delete from tblGuest where g_email=@email";

            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("email", email);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();
        }

    }
}