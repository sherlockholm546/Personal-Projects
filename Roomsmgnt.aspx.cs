
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
    public partial class Rooms : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                BindGrid();
                BindRtype();
            }
        }

        private void BindGrid(string roomType = null, string status = null)
        {
            using (SqlConnection conn = new SqlConnection(strCon))
            {
                string query = "SELECT * FROM tblRoom WHERE 1=1";

                if (!string.IsNullOrEmpty(roomType) && roomType != "--Select Room Type--")
                {
                    query += " AND type_id = @roomType";
                }

                if (!string.IsNullOrEmpty(status) && status != "--Select Status--")
                {
                    query += " AND status = @status";
                }

                SqlCommand cmd = new SqlCommand(query, conn);

                if (!string.IsNullOrEmpty(roomType) && roomType != "--Select Room Type--")
                {
                    cmd.Parameters.AddWithValue("@roomType", roomType);
                }

                if (!string.IsNullOrEmpty(status) && status != "--Select Status--")
                {
                    cmd.Parameters.AddWithValue("@status", status);
                }

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                gvRoom.DataSource = dt;
                gvRoom.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string rNO = txtRoomNo.Text;
            string rType = ddlRoomType.SelectedValue;
            string status = txtStatus.Text;

            string query = "INSERT INTO tblRoom VALUES (@no, @type, @status)";

            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@no", rNO);
            cmd.Parameters.AddWithValue("@type", rType);
            cmd.Parameters.AddWithValue("@status", status);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();

            txtRoomNo.Text = string.Empty;
            ddlRoomType.Text = string.Empty;
            txtStatus.Text = string.Empty;

        }

        public void BindRtype()
        {
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            string query = "SELECT * FROM tblRoomType";
            SqlDataAdapter adpt = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();

            adpt.Fill(dt);
            ddlFilterRtype.DataSource = dt;
            ddlFilterRtype.DataBind();
            ddlFilterRtype.DataTextField = "roomType";
            ddlFilterRtype.DataValueField = "type_id";
            ddlFilterRtype.DataBind();

            ddlFilterRtype.Items.Insert(0, new ListItem("--Select Room Type--"));
            con.Close();
        }

        protected void ddlFilterRtype_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid(ddlFilterRtype.SelectedValue, ddlFilterStatus.SelectedValue);
        }

        protected void ddlFilterStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid(ddlFilterRtype.SelectedValue, ddlFilterStatus.SelectedValue);
        }


        protected void gvRoom_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvRoom.Rows[rowIndex];

                if (row.Cells[3].Text != "Booked")
                {
                    string roomNo = gvRoom.DataKeys[row.RowIndex]["room_no"].ToString();
                    string typeId = row.Cells[2].Text; 


                    Session["roomNo"] = roomNo;
                    Session["roomType"] = typeId;


                    Response.Redirect("AdminRoomBooking.aspx");
                }
                else
                {
                    txtLabel.Visible = true;
                    txtLabel.Text = " This Room is already Booked!";
                }
            }
        }
    }
}