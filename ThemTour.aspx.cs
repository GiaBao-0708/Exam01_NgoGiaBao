using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace Exam01_NgoGiaBao
{
    public partial class ThemTour : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDiaDiem();
            }
        }

        void LoadDiaDiem()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM DiaDiem", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddlDiaDiem.DataSource = dt;
                ddlDiaDiem.DataTextField = "TenDiaDiem";
                ddlDiaDiem.DataValueField = "MDD";
                ddlDiaDiem.DataBind();
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string tenTour = txtTenTour.Text;
                    string chuongTrinh = txtChuongTrinh.Text;
                    int soNgay = int.Parse(txtSoNgay.Text);
                    int donGia = int.Parse(txtDonGia.Text);
                    int mdd = int.Parse(ddlDiaDiem.SelectedValue);

                    string tenFile = "";

                    // Upload hình
                    if (fuHinh.HasFile)
                    {
                        tenFile = Path.GetFileName(fuHinh.FileName);
                        string path = Server.MapPath("~/Images/") + tenFile;
                        fuHinh.SaveAs(path);
                    }

                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        conn.Open();
                        string sql = @"INSERT INTO Tour(TenTour, ChuongTrinh, Songay, Dongia, MDD, Hinh)
                                       VALUES(@ten, @ct, @sn, @dg, @mdd, @hinh)";

                        SqlCommand cmd = new SqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@ten", tenTour);
                        cmd.Parameters.AddWithValue("@ct", chuongTrinh);
                        cmd.Parameters.AddWithValue("@sn", soNgay);
                        cmd.Parameters.AddWithValue("@dg", donGia);
                        cmd.Parameters.AddWithValue("@mdd", mdd);
                        cmd.Parameters.AddWithValue("@hinh", tenFile);

                        cmd.ExecuteNonQuery();
                    }

                    lblThongBao.Text = "Thêm thành công!";
                }
                catch
                {
                    lblThongBao.ForeColor = System.Drawing.Color.Red;
                    lblThongBao.Text = "Thêm thất bại!";
                }
            }
        }
    }
}