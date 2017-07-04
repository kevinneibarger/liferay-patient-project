$(document).ready(function() {
	
	$(function() { 
		
			jQuery.validator.addMethod("validPhone", 
				function (value, element) {
				return value.match(/^\d{3}-\d{3}-\d{4}$/);
			});
			
			jQuery.validator.addMethod(
					"validZip",
				    function(value, element) {
				        return value.match(/^[0-9]{5}$/);
				    }
				);
			
			
			$("#<portlet:namespace />patientRegForm").validate({
				 rules: {
					 portletNamespace + firstName: "required",
//					 <portlet:namespace/>lastName: "required",
//					 <portlet:namespace/>address1: "required",
//					 <portlet:namespace/>city: "required",
//					 <portlet:namespace/>state: "required",
//					 <portlet:namespace/>zipCode: {
//						required: true,
//						validZip: true
//					 },
//					 <portlet:namespace />dob: {
//						 required: true,
//						 validDOB: true
//					 },
//					 <portlet:namespace />phoneNumber: {
//						 required: true,
//						 validPhone: true
//					 },
//					 <portlet:namespace />emailAddr: {
//				        required: true,
//				        email: true
//				      }
				 },
				 messages: {
					 firstName: {
				    	 	required: 
				 				function(){
				   
				    		  		return $("#<portlet:namespace />firstNameErr").text("Please enter your first name");
				    	 		}
				      },
//				      <portlet:namespace />lastName: {
//				    	 	required: function(){
//				    		  	return $("#<portlet:namespace />lastNameErr").text("Please enter your last name");
//				    	 	}
//				      }, 
//				      
//				      <portlet:namespace />address1: {
//				    	 	required: function(){
//				    		  	return $("#<portlet:namespace />address1Err").text("Please enter your Address");
//				    	 	}
//				      },
//				      <portlet:namespace />city: {
//				    	 	required: function(){
//				    		  	return $("#<portlet:namespace />cityErr").text("Please enter your City");
//				    	 	}
//				      },
//				      <portlet:namespace />state: {
//				    	 	required: function(){
//				    		  	return $("#<portlet:namespace />stateErr").text("Please enter your state");
//				    	 	}
//				      },
//				      <portlet:namespace />zipCode: {
//				    	 	required: function(){
//				    		  	return $("#<portlet:namespace />zipCodeErr").text("Please enter your zip code");
//				    	 	},
//				    	 	validZip: function() {
//				    	 		return $("#<portlet:namespace />zipCodeErr").text("Zip Code is invalid format, must be only 5 digit numbers");
//				    	 	}
//				      },
//				      <portlet:namespace />emailAddr: {
//				    	 	required: function(){
//				    		  	return $("#<portlet:namespace />emailAddrErr").text("Please enter an email address");
//				    	 	},
//				      		email: function() {
//				      			return $("#<portlet:namespace />emailAddrErr").text("Please enter a valid email address");
//				      		}
//				      },
//				      <portlet:namespace />phoneNumber: {
//				    	 	required: function(){
//				    		  	return $("#<portlet:namespace />phoneNumberErr").text("Please enter a Phone Number");
//				    	 	},
//				    	 	validPhone: function() {
//				      			return $("#<portlet:namespace />phoneNumberErr").text("Please enter a phone number in the format 111-222-3333");
//				      		}
//				      },
//				      <portlet:namespace />dob: {
//				    	 	required: function(){
//				    		  	return $("#<portlet:namespace />dobErr").text("Please enter a valid date of birth");
//				    	 	},
//				    	 	validDOB: function() {
//				    	 		return $("#<portlet:namespace />dobErr").text("Please enter a date in the format dd/mm/yyyy.");
//				    	 	}
//				      }
				 
				 },
				 submitHandler: function(form) {
					 form.submit();
				 }
			 });   
		});
	});