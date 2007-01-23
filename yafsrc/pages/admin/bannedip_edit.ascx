<%@ Control language="c#" Codebehind="bannedip_edit.ascx.cs" AutoEventWireup="True" Inherits="YAF.Pages.Admin.bannedip_edit" %>
<%@ Register TagPrefix="YAF" Namespace="YAF.Controls" Assembly="YAF" %>
<%@ Register TagPrefix="YAF" Namespace="YAF.Classes.UI" Assembly="YAF.Classes.UI" %>
<%@ Register TagPrefix="YAF" Namespace="YAF.Classes.Utils" Assembly="YAF.Classes.Utils" %>

<YAF:PageLinks runat="server" id="PageLinks"/>

<YAF:adminmenu runat="server">

<table class=content width=100% cellspacing=1 cellpadding=0>
<tr>
	<td class=header1 colspan="2">Edit Banned IP Address</td>
</tr>
<tr>
	<td class=postheader width=50%><b>Mask:</b><br />The ip address to ban. You can use wildcards (127.0.0.*).</td>
	<td class=post width=50%><asp:textbox id=mask runat=server></asp:textbox></td>
</tr>
<tr>
	<td class=footer1 colspan="2" align=center>
		<asp:button id=save runat=server text=Save></asp:button>
		<asp:button id=cancel runat=server text=Cancel></asp:button>
	</td>
</tr>
</table>

</YAF:adminmenu>

<YAF:SmartScroller id="SmartScroller1" runat = "server" />
