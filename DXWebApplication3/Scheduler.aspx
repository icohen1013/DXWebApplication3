﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Scheduler.aspx.cs" Inherits="DXWebApplication3.Scheduler" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v17.1.Core, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" ActiveViewType="Month" AppointmentDataSourceID="sds_Appointments" ClientIDMode="AutoID" DataMember="" DataSourceID="" ResourceDataSourceID="sds_Resource" Start="2017-11-26">
            <Storage>
                <Appointments AutoRetrieveId="True">
                    <Mappings AppointmentId="UniqueID" Description="Description" End="EndDate" Label="Label" Location="Location" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo" ResourceId="ResourceID" Start="StartDate" Status="Status" Subject="Subject" Type="Type" />
                </Appointments>
                <Resources>
                    <Mappings Caption="ResourceName" Color="Color" Image="Image" ResourceId="UniqueID" />
                </Resources>
            </Storage>
            <Views>
                <DayView>
                    <TimeRulers>
                        <cc1:TimeRuler></cc1:TimeRuler>
                    </TimeRulers>

                    <AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                </DayView>

                <WorkWeekView>
                    <TimeRulers>
                        <cc1:TimeRuler></cc1:TimeRuler>
                    </TimeRulers>

                    <AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                </WorkWeekView>

                <FullWeekView Enabled="true">
                    <TimeRulers>
                        <cc1:TimeRuler></cc1:TimeRuler>
                    </TimeRulers>

                    <AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                </FullWeekView>
            </Views>
        </dxwschs:ASPxScheduler>
    </div>
    <div>
        <asp:SqlDataSource ID="sds_Appointments" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [Appointments] WHERE [UniqueID] = @UniqueID" InsertCommand="INSERT INTO Appointments(Type, StartDate, EndDate, AllDay, Subject, Location, Description, Status, Label, ResourceID, ResourceIDs, ReminderInfo, RecurrenceInfo, CustomField1, room_no) VALUES (@Type, @StartDate, @EndDate, @AllDay, @Subject, @Location, @Description, @Status, @Label, @ResourceID, @ResourceIDs, @ReminderInfo, @RecurrenceInfo, @CustomField1, @room_no)" SelectCommand="SELECT * FROM [Appointments]" UpdateCommand="UPDATE [Appointments] SET [Type] = @Type, [StartDate] = @StartDate, [EndDate] = @EndDate, [AllDay] = @AllDay, [Subject] = @Subject, [Location] = @Location, [Description] = @Description, [Status] = @Status, [Label] = @Label, [ResourceID] = @ResourceID, [ResourceIDs] = @ResourceIDs, [ReminderInfo] = @ReminderInfo, [RecurrenceInfo] = @RecurrenceInfo, [CustomField1] = @CustomField1, [room_no] = @room_no WHERE [UniqueID] = @UniqueID">
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
                <asp:Parameter Name="room_no" Type="String" />
            </InsertParameters>
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
        <asp:SqlDataSource ID="sds_Resource" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT * FROM [Resource] ORDER BY [ResourceID]"></asp:SqlDataSource>
    </div>
</asp:Content>
