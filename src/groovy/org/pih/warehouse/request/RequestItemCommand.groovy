package org.pih.warehouse.request

import java.io.Serializable;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;
import org.pih.warehouse.core.Person;
import org.pih.warehouse.inventory.InventoryItem;
import org.pih.warehouse.product.Product;
import org.pih.warehouse.shipping.Shipment;
import org.pih.warehouse.shipping.ShipmentItem;
import org.codehaus.groovy.grails.validation.Validateable

@Validateable
class RequestItemCommand  implements Serializable {

	Boolean primary
	RequestItem requestItem
	Shipment shipment
	ShipmentItem shipmentItem
	
	// from request item
	String type
	String description
	Integer quantityRequested
	
	// for shipment item
	String lotNumber
	Date expirationDate
	Product productReceived
	InventoryItem inventoryItem
	Integer quantityReceived	
		
	static constraints = {
		productReceived(nullable:false)
	}
	
}
