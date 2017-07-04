<%@include file="init.jsp"%>

<%
String mvcPath = ParamUtil.getString(request, "mvcPath");
ResultRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);
PatientRegistration patient = (PatientRegistration)row.getObject(); 
%>

<liferay-ui:icon-menu>

    <%-- <c:if
        test="<%= PatientRegistrationPermission.contains(permissionChecker, patient.getPatientRegistrationId(), ActionKeys.UPDATE) %>">
        --%>
        <portlet:renderURL var="editURL">
            <portlet:param name="patientId"
                value="<%= String.valueOf(patient.getPatientRegistrationId()) %>" />
            <portlet:param name="mvcPath" value="/html/patientinformation/editPatientInfo.jsp" />
        </portlet:renderURL>

        <liferay-ui:icon image="edit" message="Edit"
            url="<%=editURL.toString() %>" />
<%--     </c:if> --%>
    
     <%--    <c:if
        test="<%=PatientRegistrationPermission.contains(permissionChecker, patient.getPatientRegistrationId(), ActionKeys.DELETE) %>">
 --%>
        <portlet:actionURL name="deletePatient" var="deleteURL">
            <portlet:param name="patientId"
                value="<%= String.valueOf(patient.getPatientRegistrationId()) %>" />
        </portlet:actionURL>

        <liferay-ui:icon-delete url="<%=deleteURL.toString() %>" />
<%--     </c:if> --%>
    
    
 </liferay-ui:icon-menu>