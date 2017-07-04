///**
// * 
// */
//package com.liferay.healthmap.patientinfo.util;
//
//import com.liferay.portal.kernel.util.OrderByComparator;
//
///**
// * @author kneibarger
// *
// */
//public class PatientComparatorUtil {
//	
//	private PatientComparatorUtil() {}
//
//	public static PatientComparatorUtil getInstance() {
//		return new PatientComparatorUtil();
//	}
//	
//	public OrderByComparator getColumnComparator(String sortColumn, String sortOrder) {
//		
//		boolean sortOrderAsc = false;
//		
//		if (sortOrder != null && sortOrder.equalsIgnoreCase("asc")) {
//			sortOrderAsc = true;
//		}
//		
//		OrderByComparator comparator = new PatientInfoComparator(sortOrderAsc, sortColumn);
//		System.out.println("---- We Are GETTING the Comparator For: "+sortColumn+" Ordering by asc =  "+(sortOrderAsc ? "Yes" : "No")+" ---- ");
//		System.out.println("--- Got Comparator: "+comparator.getClass().toString()+" ---- ");
//		return comparator;
//	}
//}
