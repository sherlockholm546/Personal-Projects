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
    public partial class Booking : System.Web.UI.Page
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
                string query = "SELECT booking_id, g_email, room_no, p_id, checkInDate, checkOutDate, totalAmount FROM tblBooking";
                SqlDataAdapter sda = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                gvBooking.DataSource = dt;
                gvBooking.DataBind();
            }
        }

        protected void gvBooking_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvBooking.Rows[e.RowIndex];

            int bId = Convert.ToInt32(row.Cells[1].Text);
            int roomNo = Convert.ToInt32(row.Cells[3].Text);

            string updateQuery = "UPDATE tblRoom SET status = 'Available' WHERE room_no = @roomNo";
            SqlConnection roomcon = new SqlConnection(strCon);
            roomcon.Open();
            SqlCommand roomcmd = new SqlCommand(updateQuery, roomcon);
            roomcmd.Parameters.AddWithValue("roomNo", roomNo);
            roomcmd.ExecuteNonQuery();

            string query = "DELETE FROM tblBooking WHERE booking_id = @bid";

            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("bid", bId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();
        }

    }
}