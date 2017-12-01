<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="DXWebApplication3.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <dx:ASPxGridView ID="gv_master" runat="server" AutoGenerateColumns="False" DataSourceID="sds_users" EnableTheming="True" Font-Size="Medium" KeyFieldName="rowid" Theme="Moderno" Width="100%">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsPopup>
                <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" Width="800px" />
            </SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="代號" FieldName="mno" VisibleIndex="1">
                    <HeaderStyle HorizontalAlign="Right" Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="名稱" FieldName="mname" VisibleIndex="2">
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="出生日期" FieldName="mbirthday" VisibleIndex="4">
                    <PropertiesDateEdit DisplayFormatInEditMode="True" DisplayFormatString="yyyy/MM/dd" EditFormat="Custom" EditFormatString="yyyy/MM/dd">
                    </PropertiesDateEdit>
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="電子信箱" FieldName="memail" VisibleIndex="8">
                    <EditFormSettings ColumnSpan="2" />
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="備註" FieldName="remark" VisibleIndex="9" Width="100%">
                    <EditFormSettings ColumnSpan="2" />
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="rowid" ReadOnly="True" Visible="False" VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="mpass" Visible="False" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn Caption="啟用" FieldName="isenabled" VisibleIndex="5">
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataComboBoxColumn Caption="性別" FieldName="mgender" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="男性" Value="M" />
                            <dx:ListEditItem Text="女性" Value="F" />
                        </Items>
                    </PropertiesComboBox>
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataSpinEditColumn Caption="基本薪資" FieldName="msalsry" VisibleIndex="6">
                    <PropertiesSpinEdit DisplayFormatInEditMode="True" DisplayFormatString="#,##0" NumberFormat="Custom" NumberType="Integer">
                    </PropertiesSpinEdit>
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataSpinEditColumn>
                <dx:GridViewDataTextColumn Caption="全勤獎金" FieldName="fulltime" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="#,##0">
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="False" />
                    <HeaderStyle Wrap="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <div>
        <asp:SqlDataSource ID="sds_users" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [users] WHERE [rowid] = @rowid" InsertCommand="INSERT INTO users(mno, mname, mpass, mgender, mbirthday, isenabled, memail, msalsry, remark) VALUES (@mno, @mname, @mpass, @mgender, @mbirthday, @isenabled, @memail, @msalsry, @remark)" SelectCommand="SELECT mno, mname, mgender, mbirthday, isenabled, memail, remark, rowid, mpass, msalsry, msalsry * 10 / 100 AS fulltime FROM users ORDER BY mno" UpdateCommand="UPDATE users SET mno = @mno, mname = @mname, mpass = @mpass, mgender = @mgender, mbirthday = @mbirthday, isenabled = @isenabled, memail = @memail, msalsry = @msalsry, remark = @remark WHERE (rowid = @rowid)">
            <DeleteParameters>
                <asp:Parameter Name="rowid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="mno" Type="String" />
                <asp:Parameter Name="mname" Type="String" />
                <asp:Parameter Name="mpass" Type="String" />
                <asp:Parameter Name="mgender" Type="String" />
                <asp:Parameter DbType="Date" Name="mbirthday" />
                <asp:Parameter Name="isenabled" Type="Int32" />
                <asp:Parameter Name="memail" Type="String" />
                <asp:Parameter Name="msalsry" />
                <asp:Parameter Name="remark" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="mno" Type="String" />
                <asp:Parameter Name="mname" Type="String" />
                <asp:Parameter Name="mpass" Type="String" />
                <asp:Parameter Name="mgender" Type="String" />
                <asp:Parameter DbType="Date" Name="mbirthday" />
                <asp:Parameter Name="isenabled" Type="Int32" />
                <asp:Parameter Name="memail" Type="String" />
                <asp:Parameter Name="msalsry" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="rowid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
