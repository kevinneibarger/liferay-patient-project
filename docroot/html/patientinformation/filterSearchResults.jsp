<script>
$(document).ready(function() {
	
	//var isChecked = $("#<portlet:namespace />searchByFNChx").attr('checked');
	// initially set all check boxes to false
	//$("#<portlet:namespace />searchByFNChx").attr('checked', false);
	
	// Initially set all of the text boxes to disabled
	 $("#<portlet:namespace />searchByFN").attr('disabled', 'disabled');
	$("#<portlet:namespace />searchByLN").attr('disabled', 'disabled');
	$("#<portlet:namespace />searchByDOB").attr('disabled', 'disabled');
	$("#<portlet:namespace />searchByCity").attr('disabled', 'disabled');
	$("#<portlet:namespace />searchByState").attr('disabled', 'disabled');
	$("#<portlet:namespace />searchByZip").attr('disabled', 'disabled');
	
	$("#resetValues").click(function() {
		$("#<portlet:namespace />searchByFN").attr('disabled', 'disabled');
		$("#<portlet:namespace />searchByLN").attr('disabled', 'disabled');
		$("#<portlet:namespace />searchByDOB").attr('disabled', 'disabled');
		$("#<portlet:namespace />searchByCity").attr('disabled', 'disabled');
		$("#<portlet:namespace />searchByState").attr('disabled', 'disabled');
		$("#<portlet:namespace />searchByZip").attr('disabled', 'disabled');
		
		$("#<portlet:namespace />searchByFN").val('Search by First Name...');
		$("#<portlet:namespace />searchByLN").val('Search by Last Name...');
		$("#<portlet:namespace />searchByDOB").val('Search by DOB...');
		$("#<portlet:namespace />searchByCity").val('Search by City...');
		$("#<portlet:namespace />searchByState").val('Search by State...');
		$("#<portlet:namespace />searchByZip").val('Search by Zip Code...');
		
		$("#<portlet:namespace />searchByFNChx").attr('checked', false);
		$("#<portlet:namespace />searchByLNChx").attr('checked', false);
		$("#<portlet:namespace />searchByDOBChx").attr('checked', false);
		$("#<portlet:namespace />searchByCityChx").attr('checked', false);
		$("#<portlet:namespace />searchByStateChx").attr('checked', false);
		$("#<portlet:namespace />searchByZipChx").attr('checked', false);
		$("#<portlet:namespace />searchByOptInChx").attr('checked', false);
	});
	
	// Check check boxes
	$('#<portlet:namespace />patientSearchForm :checkbox').change(function() {
	
		if ($(this).attr('class') == 'searchCriteria') {
			
			var portletNS = "_patientinformation_WAR_patientinformationportlet_";
			
			if ($(this).is(':checked')) {
				//alert("I'm checked - my id: "+$(this).attr('id'));
				
				if ($(this).attr('id') == portletNS+'searchByFNChx') {
					$("#<portlet:namespace />searchByFN").removeAttr('disabled');
				} else if ($(this).attr('id') == portletNS+'searchByLNChx') {
					$("#<portlet:namespace />searchByLN").removeAttr('disabled');
				} else if ($(this).attr('id') == portletNS+'searchByDOBChx') {
					$("#<portlet:namespace />searchByDOB").removeAttr('disabled');
				} else if ($(this).attr('id') == portletNS+'searchByCityChx') {
					$("#<portlet:namespace />searchByCity").removeAttr('disabled');
				} else if ($(this).attr('id') == portletNS+'searchByStateChx') {
					$("#<portlet:namespace />searchByState").removeAttr('disabled');
				} else if ($(this).attr('id') == portletNS+'searchByZipChx') {
					$("#<portlet:namespace />searchByZip").removeAttr('disabled');
				}
				
		    } else {

		    	if ($(this).attr('id')  == portletNS+'searchByFNChx') {
					$("#<portlet:namespace />searchByFN").attr('disabled', 'disabled');
				} else if ($(this).attr('id')  == portletNS+'searchByLNChx') {
					$("#<portlet:namespace />searchByLN").attr('disabled', 'disabled');
				} else if ($(this).attr('id')  == portletNS+'searchByDOBChx') {
					$("#<portlet:namespace />searchByDOB").attr('disabled', 'disabled');
				} else if ($(this).attr('id')  == portletNS+'searchByCityChx') {
					$("#<portlet:namespace />searchByCity").attr('disabled', 'disabled');
				} else if ($(this).attr('id')  == portletNS+'searchByStateChx') {
					$("#<portlet:namespace />searchByState").attr('disabled', 'disabled');
				} else if ($(this).attr('id')  == portletNS+'searchByZipChx') {
					$("#<portlet:namespace />searchByZip").attr('disabled', 'disabled');
				}
		    }
		}
	}); 
	
});
</script>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<portlet:actionURL name="searchPatients" var="searchPatientURL"
	windowState="normal"></portlet:actionURL>
	
<form id="<portlet:namespace />patientSearchForm" action="<%=searchPatientURL%>" method="post">

	<table class="patient-search-criteria-table" align="center">
		<tr>
			<th colspan="3">
				<h5>Filter Search Results</h5>
			</th>
		</tr>
		<tr>
			<td>
				<input type="checkbox" id="<portlet:namespace />searchByFNChx" class="searchCriteria">&nbsp;&nbsp; 
	      		<input type="search" id="<portlet:namespace />searchByFN" name="<portlet:namespace />searchByFN" placeholder="Search by First Name..." />
	      	</td>
	      	<td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
	      	<td>
				 <input type="checkbox" id="<portlet:namespace />searchByLNChx" class="searchCriteria">&nbsp;&nbsp;
	      		 <input type="search" id="<portlet:namespace />searchByLN" name="<portlet:namespace />searchByLN" placeholder="Search by Last Name..." />
	      	</td>
		</tr> 
		<%-- <tr>
			<td>
				<input type="checkbox" id="<portlet:namespace />searchByCityChx" class="searchCriteria">&nbsp;&nbsp;
	      		<input type="search" id="<portlet:namespace />searchByCity" name="<portlet:namespace />searchByCity" placeholder="Search by City..." />
	      	</td>
	      	<td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
	      	<td>
				<input type="checkbox" id="<portlet:namespace />searchByStateChx" class="searchCriteria">&nbsp;&nbsp;
	      		<input type="search" id="<portlet:namespace />searchByState" name="<portlet:namespace />searchByState" placeholder="Search by State Abbrv..." />
	      	</td>
		</tr>
		<tr>
			<td>
				<input type="checkbox" id="<portlet:namespace />searchByDOBChx" class="searchCriteria">&nbsp;&nbsp;
	      		<input type="search" id="<portlet:namespace />searchByDOB" name="<portlet:namespace />searchByDOB" placeholder="Search by DOB..." />
	      	</td>
	      	<td> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
	      	<td>
				<input type="checkbox" id="<portlet:namespace />searchByZipChx" class="searchCriteria">&nbsp;&nbsp;
	      		<input type="search" id="<portlet:namespace />searchByZip" name="<portlet:namespace />searchByZip" placeholder="Search by Zip Code..." />
	      	</td>
		</tr> --%>
		<tr>
			<td colspan=3 align="center">
				<input type="checkbox" id="<portlet:namespace />searchByOptInChx" name="<portlet:namespace />searchByOptInChx" class="searchCriteria">&nbsp;Search By Opt-In Patients&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan=3 align="center">
				<input type="button" value="Reset Search Values" id="resetValues" />
        		<input type="submit" value="Search" />
			</td>
		</tr>
	</table>
	
</form>