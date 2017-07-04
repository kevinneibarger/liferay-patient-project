<%@include file="init.jsp"%>
<%@include file="filterSearchResults.jsp"%> 

<%
    long patientId = Long.valueOf((Long) renderRequest
            .getAttribute("patientId"));

	List<PatientRegistration> patients = null;
	patients = (List<PatientRegistration>)renderRequest.getAttribute("patientData");
	
	if (patients == null) {
		patients = PatientRegistrationLocalServiceUtil.getAllPatients();
	}
	
	// Get the columns for sort purposes
	String sortingColumn = ParamUtil.getString(request, "orderByCol"); 
	String orderByType = ParamUtil.getString(request, "orderByType");
	String sortOrder = orderByType;
	
	//Logic for toggle asc and desc
	if(orderByType.equals("desc")){
	    orderByType = "asc";
	}else{
	    orderByType = "desc";
	}
	 
	if(Validator.isNull(orderByType)){
	    orderByType = "desc";
	}
%>

<% if(SessionMessages.contains(renderRequest.getPortletSession(),"patient-delete-success")){%>
	<liferay-ui:success key="patient-delete-success" message="The Patient was successfully deleted in the database" />
<%} %>

<liferay-ui:search-container emptyResultsMessage="No Patients Found" orderByType="<%=orderByType %>">
	
	<liferay-ui:search-container-results>
		<%
			total = patients.size();
			results = patients;
			
			// Get a sublist of current users that is Not sortable
			List<PatientRegistration> patientsOnPage = ListUtil.subList(patients, searchContainer.getStart(), searchContainer.getEnd());
			// Get a list of patient that we can sort.
			List<PatientRegistration> sortablePatients = new ArrayList<PatientRegistration>(patients);
			
			// Sort by the column selected
			if (Validator.isNotNull(sortingColumn)) {
				// get the comparator
				PatientInfoComparator comparator = null;
				if (sortOrder.equals("asc")) {
					comparator = new PatientInfoComparator(sortingColumn, true);
				} else {
					comparator = new PatientInfoComparator(sortingColumn, false);
				}
				
				Collections.sort(sortablePatients, comparator);
			}
			
			results = sortablePatients;
			searchContainer.setResults(results);
			searchContainer.setTotal(total);
			
		%>
	</liferay-ui:search-container-results>
	
    <liferay-ui:search-container-row
        className="com.liferay.patient.registration.model.PatientRegistration" modelVar="patient">

        <liferay-ui:search-container-column-text 
        	name="First Name"
        	property="firstName"
        	orderable="true"
      		orderableProperty="firstName"/>
        	 
        <liferay-ui:search-container-column-text 
        	name="Last Name"
        	property="lastName"
        	orderable="true"
      		orderableProperty="lastName"
        	 />	 

		<liferay-ui:search-container-column-jsp path="/html/patientinformation/patientInfoActions.jsp" 
		name="Edit/Delete" align="right" />
    </liferay-ui:search-container-row>
	
    <liferay-ui:search-iterator /> 
    
</liferay-ui:search-container>
