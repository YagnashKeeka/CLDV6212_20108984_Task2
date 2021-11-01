<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ABCSupermarket.aspx.cs" Inherits="CLDV6212_20108984_Task2.ABCSupermarket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        body {background-color:#00E3C7}
        .auto-style2 {
            background-color: #00FF93;
        }
        .auto-style4 {
            background-color: #00E3FF;
        }
        .auto-style5 {
            text-decoration: underline;
        }
        .auto-style7 {
            background-color: #FF8040;
        }
        .auto-style8 {
            font-size: large;
            font-weight: 700;
        }
        .auto-style9 {
            font-size: large;
            font-weight: 700;
        }
        .auto-style10 {
            font-size: x-large;
            font-weight: 700;
        }
        .auto-style11 {
            background-color: #FF6262;
        }
        .auto-style12 {
            font-size: x-large;
        }
    </style>
</head>
    <h1 align="center">ABC Supermarket</h1>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <table>
        <tr>
            <td>Item ID:</td>
            <td><asp:TextBox ID ="txtItemID" runat="server"></asp:TextBox></td>
            <td><asp:Button ID="btnDelete" runat="server" Text="Delete"   Height="28px" Width="69px" CssClass="auto-style11" OnClick="btnDelete_Click" /></td>
        </tr>
        <tr>
            <td>Item Name:</td>
            <td><asp:TextBox ID ="txtItemName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Item Description:</td>
            <td><asp:TextBox ID ="txtDescription" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Item Price:</td>
            <td><asp:TextBox ID ="txtItemPrice" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Item Image:</td>
            
            <td><asp:FileUpload ID="importImage" runat="server"></asp:FileUpload></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnInsert" runat="server" Text="Insert"  CssClass="auto-style2" Height="31px" Width="62px" OnClick="btnInsert_Click" /></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="auto-style7" OnClick="btnUpdate_Click"   /></td>
            
        </tr>
    </table>
        </div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" ReadOnly="True" SortExpression="ItemID" />
                <asp:BoundField DataField="ItemImage" HeaderText="ItemImage" SortExpression="ItemImage" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="ItemDescription" HeaderText="ItemDescription" SortExpression="ItemDescription" />
                <asp:BoundField DataField="ItemPrice" HeaderText="ItemPrice" SortExpression="ItemPrice" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ABCSupermarket20108984ConnectionString %>" SelectCommand="SELECT [ItemID], [ItemImage], [ItemName], [ItemDescription], [ItemPrice] FROM [items]"></asp:SqlDataSource>
        <br />
        <h2 class="auto-style5">Get Item Details</h2>
        <table>
            <tr>
                <td>Item Name:</td>
                <td><asp:TextBox ID="txtName" runat="server" CssClass="auto-style4"></asp:TextBox></td>
                <td><asp:Button ID="btnGetItem" runat="server" Text="Retreieve Item" CssClass="auto-style4" OnClick="btnGetItem_Click" /></td>
            </tr>
        </table>
        <br />
        <asp:DataList ID="imageDisplay" runat="server">
            <ItemTemplate>
            <table>
                <tr>
                    <td><img src ="<%#Eval("ItemImage") %>"" height="300" width="300"</td>
                </tr>
            </table>
                </ItemTemplate>
        </asp:DataList>

        <br />
        <br />
        <br />
        <asp:Label ID="lblName" runat="server" Text="Item Name" CssClass="auto-style10"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lbldesc" runat="server" Text="Item Description" CssClass="auto-style9"></asp:Label>
        <br />
        <br />
        <table>
        <td class="auto-style8">Item Price</td>
        <td></td>
        <td class="auto-style12"><strong>R</strong></td>
        <td><asp:Label ID="lblPrice" runat="server" Text="0.00"></asp:Label></td>
        </table>
    </form>
    
</body>
</html>
