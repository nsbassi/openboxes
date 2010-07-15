package org.pih.warehouse.product


/* 
 * Simple implementation of entity-attribute-value model.
 */
class Attribute {
	
	String name 
	String dataType 
	
	static hasMany = [values : Value];
	
	
	
	static constraints = { 
		name(nullable:false)
		dataType(nullable:true)
	}
	       
	                  
	                  
	
}