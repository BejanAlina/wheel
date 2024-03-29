<%@ page import="th.ac.chula.bsd.wheel.ProductStock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="submain">
		<g:set var="entityName" value="${message(code: 'productStock.label', default: 'ProductStock')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	<content tag="navleft">
		<g:render template="/layouts/submenu" />
	</content>
	<content tag="content">
		<div id="list-productStock" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					<!-- 
						<th><g:message code="productStock.branch.label" default="Branch" /></th>
					
						<th><g:message code="productStock.product.label" default="Product" /></th>  -->
						
					
						<g:sortableColumn property="stock" title="${message(code: 'productStock.stock.label', default: 'Stock')}" />
					
						<g:sortableColumn property="unitPrice" title="${message(code: 'productStock.unitPrice.label', default: 'Unit Price')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productStockInstanceList}" status="i" var="productStockInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productStockInstance.id}">${fieldValue(bean: productStockInstance, field: "branch")}</g:link></td>
					
						<td>${fieldValue(bean: productStockInstance, field: "product")}</td>
					
						<td>${fieldValue(bean: productStockInstance, field: "stock")}</td>
					
						<td>${fieldValue(bean: productStockInstance, field: "unitPrice")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productStockInstanceCount ?: 0}" />
			</div>
		</div>
	</content>
	</body>
</html>
