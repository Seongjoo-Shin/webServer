/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.43
 * Generated at: 2021-06-14 04:38:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.project;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.PrintWriter;
import tour.Tour;
import tour.Tour_check;
import java.util.*;

public final class map_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.PrintWriter");
    _jspx_imports_classes.add("tour.Tour_check");
    _jspx_imports_classes.add("tour.Tour");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP?????? ?????? GET, POST ?????? HEAD ??????????????? ???????????????. Jasper??? OPTIONS ????????? ?????? ???????????????.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      tour.Tour_check tour_name = null;
      tour_name = (tour.Tour_check) _jspx_page_context.getAttribute("tour_name", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (tour_name == null){
        tour_name = new tour.Tour_check();
        _jspx_page_context.setAttribute("tour_name", tour_name, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>?????? ??????</title>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\r\n");
      out.write("  \t\t<div class=\"container-fluid\">\r\n");
      out.write("    \t\t\r\n");
      out.write("    \t\t<a class=\"navbar-brand\" href=\"index.jsp\">Home</a>\r\n");
      out.write("    \t\t<ul class=\"navbar-nav me-auto mb-2 mb-lg-0\">\r\n");
      out.write("        \t<div class=\"collapse navbar-collapse\" id=\"navbarTogglerDemo03\">\r\n");
      out.write("      \t\t\t\r\n");
      out.write("        \t\t<li class=\"nav-item\">\r\n");
      out.write("          \t\t\t<a class=\"nav-link\" href=\"post.jsp\">????????? ?????????</a>\r\n");
      out.write("        \t\t</li>\r\n");
      out.write("        \t\t<li class=\"nav-item\">\r\n");
      out.write("          \t\t\t<a class=\"nav-link\" href=\"map.jsp\">?????? ??????</a>\r\n");
      out.write("        \t\t</li>\r\n");
      out.write("        \t\t<li class=\"nav-item\">\r\n");
      out.write("          \t\t\t<a class=\"nav-link\" href=\"mypage.jsp\">MyPage</a>\r\n");
      out.write("        \t\t</li>\r\n");
      out.write("     \t\t</div>\r\n");
      out.write("     \t\t\t<li class=\"nav-item\">\r\n");
      out.write("     \t\t\t\t<div class=\"col-12\"><a class=\"btn btn-secondary\" href=\"logout.jsp\">????????????</a></div>\r\n");
      out.write("     \t\t\t</li>\r\n");
      out.write("      \t\t</ul>\t\r\n");
      out.write("  \t\t</div>\r\n");
      out.write("\t</nav><br>\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t<div id=\"map\" style=\"width:600px; height:400px; margin:0 auto;\"></div><br><br>\r\n");
      out.write("\t\t\t\t<div id=\"selected\" style=\"width:600px; height: 300px; margin:0 auto;\" class=\"form-control\">\r\n");
      out.write("\t\t\t\t\t<form method=\"post\" action=\"map_process.jsp\">\r\n");
      out.write("\t\t\t\t\t\t<h6 class=\"text-center text-info\">?????????</h6>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" style=\"height:20px;\" name=\"num1\" id=\"num1\"/><br>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" style=\"height:20px;\" name=\"num2\" id=\"num2\"/><br>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" style=\"height:20px;\" name=\"num3\" id=\"num3\"/><br>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" style=\"height:20px;\" name=\"num4\" id=\"num4\"/><br>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" style=\"height:20px;\" name=\"num5\" id=\"num5\"/><br>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"reset\" class=\"btn btn-primary\" value=\"?????????\" style=\"float:left;\">&nbsp;&nbsp; \r\n");
      out.write("\t\t\t\t\t\t<input type=\"submit\" class=\"btn btn-primary\" value=\"??????\" style=\"float:right\">&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t&nbsp;&nbsp;<input type=\"button\" class=\"btn btn-primary\" value=\"??????\" style=\"float:right\" onclick=\"show()\">&nbsp;&nbsp; <!-- ???????????? -->\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"col-sm-6\">\r\n");
      out.write("\t\t\t\t\t<div style=\"width:600px; height:800px; margin:0 auto;\">\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<fieldset><legend><h5 class=\"text-info\">?????????</h5></legend>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"form-control\" style=\" overflow-y:scroll; width:500px; height:250px; margin:0 auto;\">\r\n");
      out.write("\t\t\t\t\t\t\t");

								ArrayList<Tour> list1 = tour_name.getTourList();
								
								for(Tour tour1 : list1){
							
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<label>");
      out.print(tour1.getTourism());
      out.write("&nbsp;<input type=\"checkbox\" id=\"tourism\" name=\"");
      out.print(tour1.getTourism());
      out.write("\" value=\"");
      out.print(tour1.getTourism());
      out.write("\"  onclick=getCheckboxValue()></label>&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t");

								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<fieldset><legend><h5 class=\"text-info\">?????????</h5></legend>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"form-control\" style=\" overflow-y:scroll; width:500px; height:250px; margin:0 auto;\">\r\n");
      out.write("\t\t\t\t\t\t\t");

								ArrayList<Tour> list2 = tour_name.getRestaurantList();
								
								for(Tour tour2 : list2){
							
      out.write("\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<label>");
      out.print(tour2.getRestaurant());
      out.write("&nbsp;<input type=\"checkbox\" id=\"restaurant\" name=\"");
      out.print(tour2.getRestaurant());
      out.write("\" value=\"");
      out.print(tour2.getRestaurant());
      out.write("\"  onclick=getCheckboxValue()></label>&nbsp;&nbsp;\r\n");
      out.write("\t\t\t\t\t\t\t");

								}
							
      out.write("\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</fieldset><br>\r\n");
      out.write("\t\t\t\t\t\t</form>\t\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\t\t\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction getCheckboxValue(){\r\n");
      out.write("\t\tvar selected = document.querySelectorAll(\"#tourism:checked, #restaurant:checked\");\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar result = [];\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar i=1;\r\n");
      out.write("\t\tselected.forEach((el) => {\r\n");
      out.write("\t\t\tvar temp = \"\"; \r\n");
      out.write("\t\t\ttemp += el.value;\r\n");
      out.write("\t\t\tdocument.getElementById('num'+i).value = temp;\r\n");
      out.write("\t\t\ttemp = \"\";\r\n");
      out.write("\t\t\ti++;\r\n");
      out.write("\t\t});\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=2c253b08d08769de56ed8091ee7fa204&libraries=services\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction show(){\r\n");
      out.write("\t    num1 = document.getElementById(\"num1\").value;\r\n");
      out.write("\t    num2 = document.getElementById(\"num2\").value;\r\n");
      out.write("\t    num3 = document.getElementById(\"num3\").value;\r\n");
      out.write("\t    num4 = document.getElementById(\"num4\").value;\r\n");
      out.write("\t    num5 = document.getElementById(\"num5\").value;\r\n");
      out.write("\t \r\n");
      out.write("\t    printMap(num1);\r\n");
      out.write("\t    printMap(num2);\r\n");
      out.write("\t    printMap(num3);\r\n");
      out.write("\t    printMap(num4);\r\n");
      out.write("\t    printMap(num5);\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("</script>\r\n");
      out.write("<script>\r\n");
      out.write("// ????????? ???????????? ???????????? ????????? ??????????????? ?????????\r\n");
      out.write("var infowindow = new kakao.maps.InfoWindow({zIndex:1});\r\n");
      out.write("\r\n");
      out.write("var mapContainer = document.getElementById('map'), // ????????? ????????? div \r\n");
      out.write("    mapOption = {\r\n");
      out.write("                center: new kakao.maps.LatLng(37.88129, 127.73008), // ????????? ????????????\r\n");
      out.write("                level: 7 // ????????? ?????? ??????\r\n");
      out.write("            };   \r\n");
      out.write("\r\n");
      out.write("// ????????? ???????????????    \r\n");
      out.write("var map = new kakao.maps.Map(mapContainer, mapOption); \r\n");
      out.write("\r\n");
      out.write("// ?????? ?????? ????????? ???????????????\r\n");
      out.write("var ps = new kakao.maps.services.Places(); \r\n");
      out.write("\r\n");
      out.write("var markers = [];\r\n");
      out.write("// ???????????? ????????? ???????????????\r\n");
      out.write("function printMap(num){\r\n");
      out.write("\tps.keywordSearch(num, placesSearchCB); \r\n");
      out.write("\r\n");
      out.write("// ????????? ?????? ?????? ??? ???????????? ???????????? ?????????\r\n");
      out.write("\tfunction placesSearchCB (data, status, pagination) {\r\n");
      out.write("\t    if (status === kakao.maps.services.Status.OK) {\r\n");
      out.write("\t\r\n");
      out.write("\t        // ????????? ?????? ????????? ???????????? ?????? ????????? ?????????????????????\r\n");
      out.write("\t        // LatLngBounds ????????? ????????? ???????????????\r\n");
      out.write("\t        var bounds = new kakao.maps.LatLngBounds();\r\n");
      out.write("\t\r\n");
      out.write("\t        for (var i=0; i<1; i++) {\r\n");
      out.write("\t            displayMarker(data[0]);    \r\n");
      out.write("\t            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));\r\n");
      out.write("\t        }       \r\n");
      out.write("\t\r\n");
      out.write("\t        // ????????? ?????? ????????? ???????????? ?????? ????????? ??????????????????\r\n");
      out.write("\t        map.setBounds(bounds+5);\r\n");
      out.write("\t    } \r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\t// ????????? ????????? ???????????? ???????????????\r\n");
      out.write("\tfunction displayMarker(place) {\r\n");
      out.write("\t    \r\n");
      out.write("\t    // ????????? ???????????? ????????? ???????????????\r\n");
      out.write("\t    marker = new kakao.maps.Marker({\r\n");
      out.write("\t        map: map,\r\n");
      out.write("\t        position: new kakao.maps.LatLng(place.y, place.x) \r\n");
      out.write("\t    });\r\n");
      out.write("\t\r\n");
      out.write("\t    // ????????? ?????????????????? ???????????????\r\n");
      out.write("\t    kakao.maps.event.addListener(marker, 'click', function() {\r\n");
      out.write("\t        // ????????? ???????????? ???????????? ?????????????????? ???????????????\r\n");
      out.write("\t        infowindow.setContent('<div style=\"padding:5px;font-size:12px;\">' + place.place_name + '</div>');\r\n");
      out.write("\t        infowindow.open(map, marker);\r\n");
      out.write("\t    });\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("function hideMarkers() {\r\n");
      out.write("    markers.setMap(null);\r\n");
      out.write("}\r\n");
      out.write("</script>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
