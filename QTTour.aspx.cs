using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Exam01_NgoGiaBao

public partial class QTTour : System.Web.UI.Page
{
    string connStr = @"Data Source=.;Initial Catalog=QlTourDB;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadData();
    }

    // ================= LOAD DATA =================
    void LoadData(string keyword = "")
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string sql = "SELECT * FROM Tour WHERE TenTour LIKE @kw";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@kw", "%" + keyword + "%");

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvTour.DataSource = dt;
            gvTour.DataBind();

            // Thông báo
            lblMsg.Text = dt.Rows.Count == 0 ? "Không có tour thỏa điều kiện" : "";
        }
    }

    // ================= SEARCH =================
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadData(txtSearch.Text);
    }

    // ================= PAGING =================
    protected void gvTour_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvTour.PageIndex = e.NewPageIndex;
        LoadData(txtSearch.Text);
    }

    // ================= EDIT =================
    protected void gvTour_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvTour.EditIndex = e.NewEditIndex;
        LoadData(txtSearch.Text);
    }

    protected void gvTour_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvTour.EditIndex = -1;
        LoadData(txtSearch.Text);
    }

    // ================= UPDATE =================
    protected void gvTour_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvTour.DataKeys[e.RowIndex].Value);

        TextBox txtGia = (TextBox)gvTour.Rows[e.RowIndex].FindControl("txtGia");
        TextBox txtNgay = (TextBox)gvTour.Rows[e.RowIndex].FindControl("txtNgay");

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string sql = "UPDATE Tour SET Dongia=@gia, Songay=@ngay WHERE MaTour=@id";
            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@gia", txtGia.Text);
            cmd.Parameters.AddWithValue("@ngay", txtNgay.Text);
            cmd.Parameters.AddWithValue("@id", id);

            conn.Open();
            cmd.ExecuteNonQuery();
        }

        gvTour.EditIndex = -1;
        LoadData(txtSearch.Text);
    }

    // ================= DELETE =================
    protected void gvTour_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvTour.DataKeys[e.RowIndex].Value);

        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string sql = "DELETE FROM Tour WHERE MaTour=@id";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);

            conn.Open();
            cmd.ExecuteNonQuery();
        }

        LoadData(txtSearch.Text);
    }

    // ================= CONFIRM DELETE =================
    protected void gvTour_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                Button btnDelete = (Button)e.Row.Cells[e.Row.Cells.Count - 1].Controls[2];
                btnDelete.OnClientClick = "return confirm('Bạn có chắc muốn xóa không?')";
            }
            catch { }
        }
    }
}