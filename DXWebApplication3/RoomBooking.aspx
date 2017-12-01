<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="RoomBooking.aspx.cs" Inherits="DXWebApplication3.RoomBooking" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register assembly="DevExpress.XtraScheduler.v17.1.Core, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <dx:ASPxComboBox ID="cbx_room_no" runat="server" AutoPostBack="True" DataSourceID="sds_rooms" TextField="mname" TextFormatString=" {1}" ValueField="mno">
            <Columns>
                <dx:ListBoxColumn Caption="代號" FieldName="mno" Width="50px">
                </dx:ListBoxColumn>
                <dx:ListBoxColumn Caption="名稱" FieldName="mname" Width="300px">
                </dx:ListBoxColumn>
            </Columns>
        </dx:ASPxComboBox>
    </div>
    <hr />
    <div>
        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" ActiveViewType="Month" AppointmentDataSourceID="sds_Appointments" ClientIDMode="AutoID" DataMember="" DataSourceID="" ResourceDataSourceID="sds_Resource" Start="2017-11-19">
            <Storage>
                <Appointments AutoRetrieveId="True">
                    <Mappings AllDay="AllDay" AppointmentId="UniqueID" Description="Description" End="EndDate" Label="Label" Location="Location" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo" ResourceId="ResourceID" Start="StartDate" Status="Status" Subject="Subject" Type="Type" />
                </Appointments>
            </Storage>
            <Views>
<DayView><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
</DayView>

<WorkWeekView><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
</WorkWeekView>

                <WeekView Enabled="false"></WeekView>
                <FullWeekView Enabled="true">
                    <TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                </FullWeekView>
            </Views>

        </dxwschs:ASPxScheduler>
    </div>
    <div id="sds_rooms">
        <asp:SqlDataSource ID="sds_rooms" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [mno], [mname] FROM [rooms] ORDER BY [mno]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_Appointments" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [Appointments] WHERE [UniqueID] = @UniqueID" InsertCommand="INSERT INTO [Appointments] ([UniqueID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField1], [room_no]) VALUES (@UniqueID, @Type, @StartDate, @EndDate, @AllDay, @Subject, @Location, @Description, @Status, @Label, @ResourceID, @ResourceIDs, @ReminderInfo, @RecurrenceInfo, @CustomField1, @room_no)" SelectCommand="SELECT * FROM [Appointments] WHERE ([room_no] = @room_no)" UpdateCommand="UPDATE [Appointments] SET [Type] = @Type, [StartDate] = @StartDate, [EndDate] = @EndDate, [AllDay] = @AllDay, [Subject] = @Subject, [Location] = @Location, [Description] = @Description, [Status] = @Status, [Label] = @Label, [ResourceID] = @ResourceID, [ResourceIDs] = @ResourceIDs, [ReminderInfo] = @ReminderInfo, [RecurrenceInfo] = @RecurrenceInfo, [CustomField1] = @CustomField1, [room_no] = @room_no WHERE [UniqueID] = @UniqueID">
            <DeleteParameters>
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UniqueID" Type="Int32" />
                <asp:Parameter Name="Type" Type="Int32" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="AllDay" Type="Boolean" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="Label" Type="Int32" />
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceIDs" Type="String" />
                <asp:Parameter Name="ReminderInfo" Type="String" />
                <asp:Parameter Name="RecurrenceInfo" Type="String" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:ControlParameter ControlID="cbx_room_no" Name="room_no" PropertyName="Value" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="cbx_room_no" Name="room_no" PropertyName="Value" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type" Type="Int32" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="AllDay" Type="Boolean" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="Label" Type="Int32" />
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceIDs" Type="String" />
                <asp:Parameter Name="ReminderInfo" Type="String" />
                <asp:Parameter Name="RecurrenceInfo" Type="String" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:Parameter Name="room_no" Type="String" />
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_Resource" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [Resource] WHERE [UniqueID] = @UniqueID" InsertCommand="INSERT INTO [Resource] ([ResourceID], [ResourceName], [Color], [Image], [CustomField1]) VALUES (@ResourceID, @ResourceName, @Color, @Image, @CustomField1)" SelectCommand="SELECT * FROM [Resource] ORDER BY [ResourceID]" UpdateCommand="UPDATE [Resource] SET [ResourceID] = @ResourceID, [ResourceName] = @ResourceName, [Color] = @Color, [Image] = @Image, [CustomField1] = @CustomField1 WHERE [UniqueID] = @UniqueID">
            <DeleteParameters>
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceName" Type="String" />
                <asp:Parameter Name="Color" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="CustomField1" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceName" Type="String" />
                <asp:Parameter Name="Color" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
