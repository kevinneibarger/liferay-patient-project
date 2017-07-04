/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.liferay.patient.registration.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.liferay.patient.registration.PatientRegistrationExceptionException;
import com.liferay.patient.registration.model.PatientRegistration;
import com.liferay.patient.registration.service.base.PatientRegistrationLocalServiceBaseImpl;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.ResourceConstants;
import com.liferay.portal.model.User;
import com.liferay.portal.service.ServiceContext;

/**
 * The implementation of the patient registration local service.
 *
 * <p>
 * All custom service methods should be put in this class. Whenever methods are
 * added, rerun ServiceBuilder to copy their definitions into the
 * {@link com.liferay.patient.registration.service.PatientRegistrationLocalService}
 * interface.
 *
 * <p>
 * This is a local service. Methods of this service will not have security
 * checks based on the propagated JAAS credentials because this service can only
 * be accessed from within the same VM.
 * </p>
 *
 * @author kneibarger
 * @see com.liferay.patient.registration.service.base.PatientRegistrationLocalServiceBaseImpl
 * @see com.liferay.patient.registration.service.PatientRegistrationLocalServiceUtil
 */
public class PatientRegistrationLocalServiceImpl extends PatientRegistrationLocalServiceBaseImpl {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never reference this interface directly. Always use {@link
	 * com.liferay.patient.registration.service.
	 * PatientRegistrationLocalServiceUtil} to access the patient registration
	 * local service.
	 */

	public List<PatientRegistration> getAllPatients() throws SystemException {
		return patientRegistrationPersistence.findAll();
	}

	public PatientRegistration updatePatient(long userId, long patientId, String firstName, String lastName,
			String address, String city, String state, String zip, String email, String phoneNumber, String dob,
			int optIn, String referringPractice, ServiceContext serviceContext)
			throws SystemException, PortalException {

		long groupId = serviceContext.getScopeGroupId();
		
		User user = userPersistence.findByPrimaryKey(userId);
		
	    System.out.println("-------- From LOCAL Service - UPDATE -------");
		System.out.println("---- First Name: " + firstName + " ----");
		System.out.println("---- Last Name: " + lastName + " ----");
		System.out.println("---- Address: " + address + " ----");
		System.out.println("---- City: " + city + " ----");
		System.out.println("---- State: " + state + " ----");
		System.out.println("---- Zip Code: " + zip + " ----");
		System.out.println("---- Email: " + email + " ----");
		System.out.println("---- Phone Number: " + phoneNumber + " ----");
		System.out.println("---- DOB: " + dob + " ----");
		System.out.println("---- Opt In: " + optIn + " ----");
		System.out.println("---- Referring Practice: " + referringPractice + " ----");

		// Get current Patient for Updating
		PatientRegistration patient = patientRegistrationPersistence.findByPatientId(patientId);
		
		validate(firstName);
		validate(lastName);
		validate(address);
		validate(city);
		validate(state);
		validate(zip);
		validate(email);
		validate(dob);
		validate(phoneNumber);
		//validate(referringPractice); -- Not required.
		
		// Set actual columns
		patient.setAddress1(address);
		patient.setFirstName(firstName);
		patient.setLastName(lastName);
		patient.setCity(city);
		patient.setState(state);
		patient.setZipCode(zip);
		patient.setEmailAddr(email);
		patient.setPhoneNumber(phoneNumber);
		patient.setDob(dob);
		patient.setOptIn(optIn);
		patient.setReferringPractice(referringPractice);

		System.out.println(" -----> Updating Existing User <---- \n");
		patientRegistrationPersistence.update(patient);
		
		return patient;
	}
	
	public PatientRegistration deletePatient(long patientId, ServiceContext serviceContext)
		    throws PortalException, SystemException {

		PatientRegistration patient = getPatientRegistration(patientId);
	   
		resourceLocalService.deleteResource(
		        serviceContext.getCompanyId(), PatientRegistration.class.getName(),
		        ResourceConstants.SCOPE_INDIVIDUAL, patientId);
		patient = patientRegistrationPersistence.remove(patientId);
		    
		return patient;
	}

	protected void validate(String name) throws PortalException {
		if (Validator.isNull(name)) {
			throw new PatientRegistrationExceptionException();
		}
	}
	
	public List<PatientRegistration> searchPatients(Map<String,String> searchCriteriaMap, ServiceContext serviceContext) throws PortalException, SystemException {
		
		// Get the search criteria and determine what search to execute.
		for (String key : searchCriteriaMap.keySet()) {
			String criteriaVal = searchCriteriaMap.get(key);
			System.out.println("Searching by: "+key+" With Value: "+criteriaVal);
			
		}
		
		String firstName = searchCriteriaMap.get("FN");;
		String lastName = searchCriteriaMap.get("LN");;
		String optIn = searchCriteriaMap.get("OPT");
		
		// Get the list of keys so we know how to build our query
		Set<String> searchKeys = searchCriteriaMap.keySet();
		if (searchKeys.size() == 3) {
			System.out.println("Searching By First Name, Last Name and Opt In status");
			System.out.println(" -----> Searching First Name, Last Name and Opt-In <---- \n");
			return patientRegistrationPersistence.findByFirstNameLastNameOptIn(firstName, lastName, new Integer(optIn).intValue());
			
		} else if (searchKeys.size() == 2) {
			System.out.println("Either searching by First Name and Opt-in status, First Name and Last Name, "
					+ "or Last Name and Opt-in Status");
			
			if (firstName != null && lastName != null && optIn == null) {
				System.out.println(" -----> Searching First Name and Last Name <---- \n");
				return patientRegistrationPersistence.findByFirstNameLastName(firstName, lastName);
			} else if (firstName != null && lastName == null && optIn != null) {
				System.out.println(" -----> Searching First Name and Opt In <---- \n");
				int optInFlag = new Integer(optIn).intValue();
				
				if (optInFlag == 1) {
					return patientRegistrationPersistence.findByFirstNameOptIn(firstName, new Integer(optIn).intValue());
				}
				
			} else {
				System.out.println(" -----> Searching Last Name and Opt In <---- \n");
				int optInFlag = new Integer(optIn).intValue();
				
				if (optInFlag == 1) {
					return patientRegistrationPersistence.findByLastNameOptIn(lastName, new Integer(optIn).intValue());
				}
			}
			
			
		} else {
			System.out.println("Search either by First Name, Last Name or Opt In status");
			
			if (firstName != null) {
				System.out.println(" -----> Searching First Name<---- \n");
				return patientRegistrationPersistence.findByFirstName(firstName);
			} else if (lastName != null) {
				System.out.println(" -----> Searching Last Name <---- \n");
				return patientRegistrationPersistence.findByLastName(lastName);
			} else {
				System.out.println(" -----> Searching Opt In <---- \n");
				int optInFlag = new Integer(optIn).intValue();
				
				if (optInFlag == 1) {
					return patientRegistrationPersistence.findByOptIn(optInFlag);
				}
				
			}
		}
		
		return new ArrayList<PatientRegistration>();
	}
}