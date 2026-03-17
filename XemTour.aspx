
<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>Trang xem tour</h2>
    <hr />
  
   
    <div class="row" style="margin-top: 10px">       
                <div class="col-md-4 text-center">
                    <img src="/Hinh_tour/BMT_01.jpg" style="width: 250px" />
                    <br />
                    <asp:Label ID="lbTen" runat="server" Text='Tên tour 1'></asp:Label>  <br />
                    Giá tour 
                    <asp:Label ID="lbGia" runat="server" ForeColor="#ff6600" Text='0.00đ'></asp:Label>  <br />
                    Số ngày  <asp:Label ID="lbSoNgay" runat="server" ForeColor="#ff6600" Text='2'></asp:Label>
                    Số đêm   <asp:Label ID="lbSoDem" runat="server" ForeColor="#ff6600" Text='1'></asp:Label>
                    <br />
                    <a href="#" class="btn btn-primary">Đặt tour</a>
                    <a href="#" class="btn btn-success">Xem chi tiết</a>
                </div> 
                 <div class="col-md-4 text-center">
                    <img src="/Hinh_tour/BMT_01.jpg" style="width: 250px" />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text='Tên tour 2'></asp:Label>  <br />
                    Giá tour 
                    <asp:Label ID="Label2" runat="server" ForeColor="#ff6600" Text='0.00đ'></asp:Label>  <br />
                    Số ngày  <asp:Label ID="Label3" runat="server" ForeColor="#ff6600" Text='2'></asp:Label>
                    Số đêm   <asp:Label ID="Label4" runat="server" ForeColor="#ff6600" Text='1'></asp:Label>
                    <br />
                    <a href="#" class="btn btn-primary">Đặt tour</a>
                    <a href="#" class="btn btn-success">Xem chi tiết</a>
                </div> 
    </div>

     

</asp:Content>
