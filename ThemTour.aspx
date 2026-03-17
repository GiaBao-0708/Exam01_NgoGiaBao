<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
     <h2>Trang thêm tour</h2>
     <!DOCTYPE html>
     <html>
     <head runat="server">
         <title>Thêm Tour</title>
         <style>
             body {
                 font-family: Arial;
                 background: #f5f5f5;
             }
             .form-box {
                 width: 500px;
                 margin: 50px auto;
                 background: white;
                 padding: 20px;
                 border-radius: 6px;
             }
             .form-box h2 {
                 background: black;
                 color: white;
                 padding: 10px;
             }
             .form-group {
                 margin-bottom: 10px;
             }
             input, textarea, select {
                 width: 100%;
                 padding: 6px;
             }
             .btn {
                 padding: 8px 15px;
                 background: blue;
                 color: white;
                 border: none;
             }
         </style>
     </head>
     
     <body>
     <form id="form1" runat="server">
     <div class="form-box">
         <h2>THÊM MỚI TOUR</h2>
     
         <!-- Địa điểm -->
         <div class="form-group">
             Địa điểm
             <asp:DropDownList ID="ddlDiaDiem" runat="server"></asp:DropDownList>
         </div>
     
         <!-- Tên tour -->
         <div class="form-group">
             Tên tour
             <asp:TextBox ID="txtTenTour" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator 
                 ControlToValidate="txtTenTour"
                 ErrorMessage="Không được rỗng"
                 ForeColor="Red"
                 runat="server" />
         </div>
     
         <!-- Chương trình -->
         <div class="form-group">
             Chương trình
             <asp:TextBox ID="txtChuongTrinh" TextMode="MultiLine" runat="server"></asp:TextBox>
         </div>
     
         <!-- Số ngày -->
         <div class="form-group">
             Số ngày
             <asp:TextBox ID="txtSoNgay" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ControlToValidate="txtSoNgay" ErrorMessage="Không rỗng" ForeColor="Red" runat="server" />
             <asp:RangeValidator ControlToValidate="txtSoNgay" MinimumValue="0" MaximumValue="100" Type="Integer"
                 ErrorMessage=">=0" ForeColor="Red" runat="server" />
         </div>
     
         <!-- Đơn giá -->
         <div class="form-group">
             Đơn giá
             <asp:TextBox ID="txtDonGia" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ControlToValidate="txtDonGia" ErrorMessage="Không rỗng" ForeColor="Red" runat="server" />
             <asp:RangeValidator ControlToValidate="txtDonGia" MinimumValue="0" MaximumValue="100000000"
                 Type="Integer" ErrorMessage=">=0" ForeColor="Red" runat="server" />
         </div>
     
         <!-- Upload hình -->
         <div class="form-group">
             Hình đại diện
             <asp:FileUpload ID="fuHinh" runat="server" />
         </div>
     
         <!-- Button -->
         <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn" OnClick="btnThem_Click" />
     
         <br /><br />
         <asp:Label ID="lblThongBao" runat="server" ForeColor="Green"></asp:Label>
     
     </div>
     </form>
     </body>
     </html>
     <hr />
      
     
  

</asp:Content>
