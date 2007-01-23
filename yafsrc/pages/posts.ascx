<%@ Control language="c#" Codebehind="posts.ascx.cs" AutoEventWireup="True" Inherits="YAF.Pages.posts" %>
<%@ Register TagPrefix="YAF" Namespace="YAF.Controls" Assembly="YAF" %>
<%@ Register TagPrefix="YAF" Namespace="YAF.Classes.UI" Assembly="YAF.Classes.UI" %>
<%@ Register TagPrefix="YAF" Namespace="YAF.Classes.Utils" Assembly="YAF.Classes.Utils" %>
<%@ Register TagPrefix="YAF" TagName="displaypost" Src="../controls/DisplayPost.ascx" %>

<YAF:PageLinks runat="server" id="PageLinks"/>

<a name="top"></a>

<asp:repeater id="Poll" runat="server" visible="false">
<HeaderTemplate>
<table class="content" cellspacing="1" cellpadding="0" width="100%">
	<tr>
		<td class="header1" colspan="3"><%= GetText("question") %>: <%# GetPollQuestion() %> <%# GetPollIsClosed() %></td>
	</tr>
	<tr>
		<td class="header2"><%= GetText("choice") %></td>
		<td class="header2" align="center" width="10%"><%= GetText("votes") %></td>
		<td class="header2" width="40%"><%= GetText("statistics") %></td>
	</tr>
</HeaderTemplate>
<ItemTemplate>
	<tr>
		<td class="post">
		<YAF:mylinkbutton runat="server" enabled="<%#CanVote%>" commandname=vote commandargument='<%# DataBinder.Eval(Container.DataItem, "ChoiceID") %>' text='<%# DataBinder.Eval(Container.DataItem, "Choice") %>'/></td>
		<td class="post" align="center"><%# DataBinder.Eval(Container.DataItem, "Votes") %></td>
		<td class="post"><nobr><img src="<%# GetThemeContents("VOTE","LCAP") %>"><img src='<%# GetThemeContents("VOTE","BAR") %>' height=12px width='<%# VoteWidth(Container.DataItem) %>%'><img src='<%# GetThemeContents("VOTE","RCAP") %>'></nobr> <%# DataBinder.Eval(Container.DataItem,"Stats") %>%</td>
	</tr>
</ItemTemplate>
<FooterTemplate>
</table><br/>
</FooterTemplate>
</asp:repeater>
<table class='command' cellspacing='0' cellpadding='0' width='100%'>
<tr>
	<td align="left" class="navlinks"><YAF:pager runat="server" id="Pager"/></td>
	<td align="right">
		<asp:linkbutton id="PostReplyLink1" runat="server" cssclass="imagelink" ToolTip="Post Reply" onclick="PostReplyLink_Click" />
		<asp:linkbutton id="NewTopic1" runat="server" cssclass="imagelink" onclick="NewTopic_Click" />
		<asp:linkbutton id="DeleteTopic1" runat="server" onload="DeleteTopic_Load" cssclass="imagelink" onclick="DeleteTopic_Click" />
		<asp:linkbutton id="LockTopic1" runat="server" cssclass="imagelink" onclick="LockTopic_Click" />
		<asp:linkbutton id="UnlockTopic1" runat="server" cssclass="imagelink" onclick="UnlockTopic_Click" />
		<asp:linkbutton id="MoveTopic1" runat="server" cssclass="imagelink" onclick="MoveTopic_Click" />
	</td>
</tr>
</table>

<table class="content" cellspacing="1" cellpadding="0" width="100%" border="0">
<tr>
	<td colspan="3" style="padding:0px">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" class="header1">
			<tr class="header1">
				<td class="header1Title"><asp:label id="TopicTitle" runat="server"/></td>
				<td align="right">
					<asp:hyperlink id="MyTest" runat="server"><%= GetText("Options") %></asp:hyperlink>
					<asp:placeholder runat="server" id="ViewOptions">
					&middot;
					<asp:hyperlink id="View" runat="server"><%= GetText("View") %></asp:hyperlink>
					</asp:placeholder>
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr class="header2">
	<td colspan="3" align="right" class="header2links">
		<asp:linkbutton id="PrevTopic" CssClass="header2link" runat="server" onclick="PrevTopic_Click"><%# GetText("prevtopic") %></asp:linkbutton>
		&middot;
		<asp:linkbutton id="NextTopic" CssClass="header2link" runat="server" onclick="NextTopic_Click"><%# GetText("nexttopic") %></asp:linkbutton>
		<div runat="server" visible="false">
			<asp:linkbutton id="TrackTopic" CssClass="header2link" runat="server" onclick="TrackTopic_Click"><%# GetText("watchtopic") %></asp:linkbutton>
			&middot;
			<asp:linkbutton id="EmailTopic" CssClass="header2link" runat="server" onclick="EmailTopic_Click"><%# GetText("emailtopic") %></asp:linkbutton>
			&middot;
			<asp:linkbutton id="PrintTopic" CssClass="header2link" runat="server" onclick="PrintTopic_Click"><%# GetText("printtopic") %></asp:linkbutton>
 			&middot;
 			<asp:hyperlink id="RssTopic" CssClass="header2link" runat="server"><%# GetText("rsstopic") %></asp:hyperlink>
		</div>
	</td>
</tr>

<asp:repeater id="MessageList" runat="server">
<ItemTemplate>
	<%# GetThreadedRow(Container.DataItem) %>
	<YAF:displaypost runat="server" datarow="<%# Container.DataItem %>" visible="<%#IsCurrentMessage(Container.DataItem)%>" isthreaded="<%#IsThreaded%>"/>
</ItemTemplate>
<AlternatingItemTemplate>
	<%# GetThreadedRow(Container.DataItem) %>
	<YAF:displaypost runat="server" datarow="<%# Container.DataItem %>" IsAlt="True" visible="<%#IsCurrentMessage(Container.DataItem)%>" isthreaded="<%#IsThreaded%>"/>
</AlternatingItemTemplate>
</asp:repeater>

    <asp:PlaceHolder id="QuickReplyPlaceHolder" runat="server">
    <tr>
        <td colspan="3" class="post" style="padding:0px;">
            <YAF:DataPanel runat="server" id="DataPanel1"  AllowTitleExpandCollapse="true" TitleStyle-CssClass="header2" TitleStyle-Font-Bold="true" Collapsed="true">
                <div class="post" id="QuickReplyLine" runat="server" style="margin-top:10px;margin-left:20px;margin-right:20px;padding:2px;height:100px">
                </div>                
                <div align="center" style="margin:7px;">
                    <asp:button id="QuickReply" cssclass="pbutton" runat="server"/>
                </div>                
            </YAF:DataPanel>
        </td>
    </tr>
    </asp:PlaceHolder>        

<YAF:ForumUsers ID="ForumUsers1" runat="server"/>

</table>

<br />

<table class="command" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td align="left" class="navlinks"><YAF:pager runat="server" linkedpager="Pager"/></td>
    <td align="right">
		<asp:linkbutton id="PostReplyLink2" runat="server" cssclass="imagelink" onclick="PostReplyLink_Click" />
		<asp:linkbutton id="NewTopic2" runat="server" cssclass="imagelink" onclick="NewTopic_Click" />
		<asp:linkbutton id="DeleteTopic2" runat="server" onload="DeleteTopic_Load" cssclass="imagelink" onclick="DeleteTopic_Click" />
		<asp:linkbutton id="LockTopic2" runat="server" cssclass="imagelink" onclick="LockTopic_Click" />
		<asp:linkbutton id="UnlockTopic2" runat="server" cssclass="imagelink" onclick="UnlockTopic_Click" />
		<asp:linkbutton id="MoveTopic2" runat="server" cssclass="imagelink" onclick="MoveTopic_Click" />
</td></tr>
</table>

<br />
<table cellspacing="0" cellpadding="0" width="100%">
<tr id="ForumJumpLine" runat="Server">
	<td align="right"><%= GetText("FORUM_JUMP") %> <YAF:forumjump id="ForumJump1" runat="server"/></td>
</tr>
<tr>
	<td align="right" valign="top" class="smallfont"><YAF:PageAccess id="PageAccess1" runat="server"/></td>
</tr>
</table>

<YAF:SmartScroller id="SmartScroller1" runat = "server" />

<YAF:PopMenu runat="server" id="MyTestMenu" control="MyTest"/>
<YAF:PopMenu runat="server" id="ViewMenu" control="View"/>

<span id="WatchTopicID" runat="server" visible="false"></span>
