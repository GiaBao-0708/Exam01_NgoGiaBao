<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>Quản lý Tour</h2>

Tên Tour:
<asp:TextBox ID="txtSearch" runat="server" />
<asp:Button ID="btnSearch" runat="server" Text="Tra cứu" OnClick="btnSearch_Click"/>

<br /><br />

<asp:Button ID="btnAdd" runat="server" Text="Thêm Tour Mới"
    PostBackUrl="~/ThemTour.aspx"/>

<br /><br />

<asp:GridView ID="gvTour" runat="server"
    AutoGenerateColumns="False"
    DataKeyNames="MaTour"
    AllowPaging="true" PageSize="5"

    OnPageIndexChanging="gvTour_PageIndexChanging"
    OnRowEditing="gvTour_RowEditing"
    OnRowCancelingEdit="gvTour_RowCancelingEdit"
    OnRowUpdating="gvTour_RowUpdating"
    OnRowDeleting="gvTour_RowDeleting"
    OnRowDataBound="gvTour_RowDataBound">

    <Columns>

        <asp:BoundField DataField="TenTour" HeaderText="Tên tour" ReadOnly="true"/>

        <asp:ImageField DataImageUrlField="Hinh"
            DataImageUrlFormatString="~/Images/{0}"
            HeaderText="Hình" ControlStyle-Width="120" />

        <asp:TemplateField HeaderText="Đơn giá">
            <ItemTemplate><%# Eval("Dongia") %></ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtGia" runat="server"
                    Text='<%# Bind("Dongia") %>' Width="80"/>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Số ngày">
            <ItemTemplate><%# Eval("Songay") %></ItemTemplate
            <EditItemTemplate>
                <asp:TextBox ID="txtNgay" runat="server"
                    Text='<%# Bind("Songay") %>' Width="50"/>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true"
            EditText="Sửa" UpdateText="Update"
            CancelText="Cancel" DeleteText="Xóa" />

    </Columns>
</asp:GridView>

<br />
<asp:Label ID="lblMsg" runat="server" ForeColor="Red" />

</asp:Content>