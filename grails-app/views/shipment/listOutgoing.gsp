
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${message(code: 'shipment.label', default: 'Outgoing Shipments')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
		<!-- Specify content to overload like global navigation links, page titles, etc. -->
		<content tag="pageTitle"><g:message code="default.list.label" args="[entityName]" /></content>
		<content tag="menuTitle">${entityName}</content>		
		<content tag="globalLinksMode">append</content>
		<content tag="localLinksMode">override</content>
		<content tag="globalLinks"><g:render template="global" model="[entityName:entityName]"/></content>
		<content tag="localLinks"><g:render template="local" model="[entityName:entityName]"/></content>		
    </head>    
    <body>
        <div class="body">
            <g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
            
                <table>
                    <thead>
                        <tr>   
                            <g:sortableColumn property="shipmentNumber" title="${message(code: 'shipment.shipmentNumber.label', default: 'Shipment Number')}" />
                            <g:sortableColumn property="name" title="${message(code: 'shipment.name.label', default: 'Name')}" />
                            <g:sortableColumn property="destination.name" title="${message(code: 'shipment.origin.label', default: 'To')}" />
                            <g:sortableColumn property="events" title="${message(code: 'shipment.events.label', default: 'Most Recent Event')}" />
							<g:sortableColumn property="documents" title="${message(code: 'shipment.documents.label', default: 'Documents')}" />
                        </tr>
                    </thead>
                    <tbody>
	                    <g:each in="${shipmentInstanceList}" status="i" var="shipmentInstance">
	                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">            
								<td align="center"><g:link action="showDetails" id="${shipmentInstance.id}">${fieldValue(bean: shipmentInstance, field: "shipmentNumber")}</g:link></td>
								<td align="center">${fieldValue(bean: shipmentInstance, field: "name")}</td>
								<td align="center">
									${fieldValue(bean: shipmentInstance, field: "destination.name")}
								</td>
								<td>
									<g:if test="${!shipmentInstance.events}">None</g:if>									
									<g:else>
										<table>
											<tr>
												<td><g:formatDate format="dd MMM yyyy" date="${shipmentInstance.mostRecentEvent.eventDate}"/></td>
												<td><b>${shipmentInstance.mostRecentEvent.eventLocation.name}<b></td>
											</tr>
											<tr>
												<td></td>
												<td>${shipmentInstance.mostRecentEvent.eventType.name}</td>
											</tr>
										</table>									
									</g:else>
								</td>
								<td>
								
									<g:if test="${!shipmentInstance.events}">None</g:if>
									<g:else>
										<table>
											<g:each in="${shipmentInstance.documents}" var="document" status="j">
												<tr id="document-${document.id}">
													<td>
														<g:link controller="document" action="download" id="${document.id}">${document?.filename}</g:link>					
													</td>					
												</tr>
											</g:each>							
										</table>	
									</g:else>
								</td>
	                        </tr>
	                    </g:each>
                    </tbody>
                </table>

            </div>
            <div class="paginateButtons">
                <g:paginate total="${shipmentInstanceTotal}" />
            </div>
        </div>
    </body>
</html>