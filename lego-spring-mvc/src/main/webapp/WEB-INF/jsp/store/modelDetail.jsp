<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" trimDirectiveWhitespaces="false" session="false" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<my:pagetemplate title="Model ${model.name}">
<jsp:attribute name="body">

<dl class="dl-horizontal">
    <dt>Category</dt><dd>${model.category.name} - ${model.category.description}</dd>
    <dt>Price</dt><dd>${model.price}€</dd>
    <dt>Age limit</dt><dd>${model.ageLimit}</dd>
</dl>

</jsp:attribute>
</my:pagetemplate>