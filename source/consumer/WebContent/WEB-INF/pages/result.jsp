<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="com.cnnic.whois.oauth.utils.JSONHelper"%>
<%@ include file="/comm/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<title>Restful Whois SDK Demo</title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<link href="${ctx }/css/whois-style.css" type="text/css" rel="stylesheet" />

		<script type="text/javascript" src="${ctx }/js/jquery-1.6.2.min.js"></script>
		<script type="text/javascript" src="${ctx }/js/json2.js"></script>
		
		<style type="text/css">
			#content {
				float: left;
				width: 700px;
				min-height: 100%;
				background-color: #fff;
				padding: 1.5em 0 0em 1.5em;
			}
			
			#content #maincontent {
				float: left;
				width: 45.5em;
				font-size: 16px;
			}
			
			div#maincontent table {
width: 100%;
border: 2px solid #999;
margin-bottom: 1em;
-moz-box-shadow: 3px 3px 3px #ccc;
-webkit-box-shadow: 3px 3px 3px #ccc;
-khtml-box-shadow: 3px 3px 3px #ccc;
box-shadow: 3px 3px 3px #ccc;
}

div#content tr:nth-child(odd), div#content tr:nth-child(odd) td, div#content tr:nth-child(odd) th[scope="row"] {
color: #000 !important;
background-color: #ededed;
background-image: -moz-linear-gradient(bottom, #f0f0f0 0%, #fcfcfc 100%) !important;
background-image: -o-linear-gradient(bottom, #f0f0f0 0%, #fcfcfc 100%);
background-image: -webkit-gradient(linear, center bottom, center top, color-stop(0%, #f0f0f0), color-stop(100%, #fcfcfc));
}

div#maincontent table tr:first-child th, div#maincontent table tr th {
padding: .4em .8em;
border: 1px solid #ccc;
background-color: #999;
background-image: -moz-linear-gradient(top, #888 0%, #aaa 100%) !important;
background-image: -o-linear-gradient(top, #888 0%, #aaa 100%) !important;
background-image: -webkit-gradient(linear, center top, center bottom, color-stop(0%, #888), color-stop(100%, #aaa));
font-size: 12px !important;
text-align: left;
color: #fff;
text-transform: none;
vertical-align: middle;
}

div#maincontent table td {
padding: .5em .8em;
border: 1px solid #eee;
font-size: 11.5px;
text-align: left;
vertical-align: top !important;
}
			
			
		</style>
		
	</head>
<body>
	

	<input type="hidden" value=''
			id="pathUrl" />
		<div id="wrapper">
			<div id="header">
				<h1>
					<a href="${ctx }/index.jsp"><acronym>Restful Whois</acronym> </a>
				</h1>
				
			</div>
			<div id="sidebar">
				<div id="web_services">
					<fieldset>
						<legend>
							<span style="padding-left: 40px;">Restful Whois</span>
						</legend>
						<br />
						<hr />

						<table>
							
							<tr>
								<td style="padding-left: 90px;padding-top: 20px;"><span>
								<a href="${ctx }/SampleProvider?queryType=ip">IP</a></span></td>
							</tr>
							
							<tr>
								<td style="padding-left: 50px;padding-top: 20px;"><span><a href="${ctx }/SampleProvider?queryType=domain">Domain Query</a></span></td>
							</tr>
							
							<tr>
								<td style="padding-left: 80px;padding-top: 20px;"><span><a href="${ctx }/SampleProvider?queryType=entity">Entity</a></span></td>
							</tr>
							<%-- 
							<tr>
								<td style="padding-left: 40px;padding-top: 20px;"><span><a href="${ctx }/SampleProvider">Autonomous System</a></span></td>
							</tr>
							
							<tr>
								<td style="padding-left: 60px;padding-top: 20px;"><span><a href="${ctx }/SampleProvider">Name Server</a></span></td>
							</tr>
							--%>
							
						</table>
					

					</fieldset>
				</div>
			</div>
			
			<div id="content">
				<div id="maincontent">
				
				<%
					String results = (String)request.getAttribute("result");
					Map<String, Object> map = JSONHelper.reflect(JSONObject.fromObject(results));
				%>
				
				<%
				String queryType = (String)request.getAttribute("queryType");
				if(queryType.equals("ip")){
					System.out.println("ip--ip");
				%>
				
					<table>
						<tr>
							<th colspan="2">This result from restful whois api, query parameter is " ip = 1.1.1.1 "</th>
						</tr>
						
						<tr>
							<td width="20%">Handle : </td>
							<td><%=map.get("handle") %></td>
						</tr>
						<tr>
							<td>Start Address : </td>
							<td><%=map.get("startAddress") %></td>
						</tr>
						<tr>
							<td>End Address : </td>
							<td><%=map.get("endAddress") %></td>
						</tr>
						
						<tr>
							<td>IP Version : </td>
							<td><%=map.get("ipVersion") %></td>
						</tr>
					</table>
				
				<%	
				}
				if(queryType.equals("domain")){
				%>
					<table>
						<tr>
							<th colspan="2">This result from restful whois api, query parameter is " domain = z.cn "</th>
						</tr>
						
						<tr>
							<td width="20%">ldhName : </td>
							<td><%=map.get("ldhName") %></td>
						</tr>
						<tr>
							<td>Unicode Name : </td>
							<td><%=map.get("unicodeName") %></td>
						</tr>
						<tr>
							<td>Lang : </td>
							<td><%=map.get("lang") %></td>
						</tr>
						
						<tr>
							<td>Status : </td>
							<td><%=map.get("status") %></td>
						</tr>
					</table>
				
				<%	
					System.out.println("domain--domain");
				}
				if(queryType.equals("entity")){
				
				%>
				
					<table>
						<tr>
							<th colspan="2">This result from restful whois api, query parameter is " entity = IBM-1 "</th>
						</tr>
						
						<tr>
							<td width="20%">Handle : </td>
							<td><%=map.get("handle") %></td>
						</tr>
						<tr>
							<td>Lang : </td>
							<td><%=map.get("lang") %></td>
						</tr>
						<tr>
							<td>Roles : </td>
							<td><%=map.get("roles") %></td>
						</tr>
						
					</table>
				
				<%
					System.out.println("entity--entity");
				}
				%>
			
				</div>
				<div id="jsoncontent"></div>
			</div>
			<c:if test="${pageBean != null}">
				<cnnic:page href="${queryPath}" pageBeanName="pageBean" maxShowPage="5" maxRecordConfigurable= "false" id="1"/>
			</c:if>
			<div style="clear: both;"></div>
			
			<div style="clear: both;"></div>
		</div>
		<div id="footer">
			<p>
				By using the Restful Whois service, you are agreeing to the
				<a href="/whois_tou.html" class="footer_link" style="color: #000">Whois Terms of Use</a>
				<br />
				&copy; Copyright 2013, CNNIC & ICANN
			</p>
			<img name='image1' alt="" src="${ctx }/image/cnnicLogo.jpg">
			<img alt="" name='image2' src="${ctx }/image/icannLogo.jpg">
		</div>

</body>
</HTML>
