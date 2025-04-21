
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Microsoft.SqlServer.Server;
using System.Drawing;

namespace Hotel_Mgnt_System
{
    public partial class AdminRoomBooking : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                FnBindRoomInfo();
                calculateTotalPrice();
            }
        }

        public void FnBindRoomInfo()
        {
            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();

                string query = "SELECT type_id, roomType, price FROM tblRoomType WHERE type_id = @typeid";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@typeid", Session["roomType"]);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                ddlRoomType.DataSource = dt;
                ddlRoomType.DataTextField = "roomType";
                ddlRoomType.DataValueField = "type_id";
                //txtPricePerNight.Text = "price";
                ddlRoomType.DataBind();


                txtPricePerNight.Text = dt.Rows[0]["price"].ToString();

                txtRoomNo.Text = (string)Session["roomNo"];

            }
        }

        public void calculateTotalPrice()
        {
            if (DateTime.TryParse(txtCheckInDate.Text, out DateTime checkIn) &&
               DateTime.TryParse(txtCheckOutDate.Text, out DateTime checkOut) &&
               int.TryParse(txtPricePerNight.Text, out int price))
            {
                if (checkOut > checkIn)
                {
                    int totalDays = (checkOut - checkIn).Days;
                    txtTotalPrice.Text = (totalDays * price).ToString();
                }
                else
                {
                    lblMessage.Text = "Invalid Dates";
                    lblMessage.Visible = true;
                }
            }
        }



        protected void txtCheckInDate_TextChanged(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            calculateTotalPrice();
        }

        protected void txtCheckOutDate_TextChanged(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            calculateTotalPrice();
        }

        protected void ddlRoomType_SelectedIndexChanged(object sender, EventArgs e)
        {

            calculateTotalPrice();
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string roomNo = txtRoomNo.Text;
            string checkInDate = txtCheckInDate.Text;
            string checkOutDate = txtCheckOutDate.Text;
            int noOfRooms = int.Parse(txtNoOfRooms.Text);
            decimal totalPrice = decimal.Parse(txtTotalPrice.Text);
            string paymentMethod = ddlPayment.SelectedValue;

            SqlConnection con = new SqlConnection(strCon);
            con.Open();

            SqlCommand cmdPayment = new SqlCommand("INSERT INTO tblPayment (PayMethod, amountPaid) OUTPUT INSERTED.p_id VALUES (@PaymentMethod, @TotalPrice)", con);
            cmdPayment.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
            cmdPayment.Parameters.AddWithValue("@TotalPrice", totalPrice);

            int paymentId = (int)cmdPayment.ExecuteScalar();

            SqlCommand cmdBooking = new SqlCommand("INSERT INTO tblBooking (g_email, room_no, CheckInDate, CheckOutDate, nofRoom, total" +
                "amount, p_id) VALUES (@Email, @RoomNo, @CheckInDate, @CheckOutDate, @NoOfRooms, @TotalPrice, @PaymentID)", con);
            cmdBooking.Parameters.AddWithValue("@Email", email);
            cmdBooking.Parameters.AddWithValue("@RoomNo", roomNo);
            cmdBooking.Parameters.AddWithValue("@CheckInDate", checkInDate);
            cmdBooking.Parameters.AddWithValue("@CheckOutDate", checkOutDate);
            cmdBooking.Parameters.AddWithValue("@NoOfRooms", noOfRooms);
            cmdBooking.Parameters.AddWithValue("@TotalPrice", totalPrice);
            cmdBooking.Parameters.AddWithValue("@PaymentID", paymentId);

            cmdBooking.ExecuteNonQuery();

            lblbookingMassage.Text = "Booking successfuly";

            string updateRoomQuery = "UPDATE tblRoom SET status = 'Booked' WHERE room_no = @roomNo";
            SqlCommand cmdUpdateRoom = new SqlCommand(updateRoomQuery, con);
            cmdUpdateRoom.Parameters.AddWithValue("@roomNo", roomNo);
            cmdUpdateRoom.ExecuteNonQuery();
            con.Close();

            Response.Redirect("BookingMgnt.aspx");
        }


    }
}