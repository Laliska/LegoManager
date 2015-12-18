<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" trimDirectiveWhitespaces="false" session="false" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<my:pagetemplate title="Lego Sets">
    <jsp:attribute name="body">

        <my:a href="/legoset/new" class="btn btn-success">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            New legoset
        </my:a>

        <table class="table">
            <thead>
                <tr>
                    <th>id</th>
                    <th>name</th>
                    <th>price</th>
                    <th>Category</th>
                    <th>Models</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${legosets}" var="legoset">
                    <tr>
                        <td>${legoset.id}</td>
                        <td><c:out value="${legoset.name}"/></td>
                        <td><c:out value="${legoset.price}"/></td>
                        <td><p><c:out value="${legoset.category.name}"/></p></td>
                        <td><p>
                                <c:forEach items="${legoset.models}" var="model" varStatus="loop">
                                    <c:out value="${model.name}"></c:out>
                                    <c:if test="${!loop.last}">, </c:if>
                                </c:forEach>
                            </p>
                        </td>
                        <td>
                            <my:a href="/legoset/change/${legoset.id}" class="btn btn-default">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </my:a>
                            <my:a href="/legoset/delete/${legoset.id}" class="btn btn-default">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                            </my:a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


    </jsp:attribute>
</my:pagetemplate>