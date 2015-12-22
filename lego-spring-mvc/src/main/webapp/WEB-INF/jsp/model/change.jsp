<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" trimDirectiveWhitespaces="false" session="false" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<my:pagetemplate title="Change model">
    <jsp:attribute name="body">
        <div class="container">
            <form:form method="post" action="${pageContext.request.contextPath}/model/edit/${id}"
                       modelAttribute="modelChange" cssClass="form-horizontal">
                <div class="form-group">
                    <form:label path="categoryId" cssClass="col-sm-2 control-label">Category</form:label>
                    <div class="col-sm-10">
                        <form:select path="categoryId" cssClass="form-control">
                            <c:forEach items="${categories}" var="c">
                                <form:option value="${c.id}">${c.name}</form:option>
                            </c:forEach>
                        </form:select>
                        <p class="help-block"><form:errors path="categoryId" cssClass="error"/></p>
                    </div>
                </div>
                <div class="form-group ${name_error?'has-error':''}">
                    <form:label path="name" cssClass="col-sm-2 control-label">Name</form:label>
                    <div class="col-sm-10">
                        <form:input path="name" cssClass="form-control"/>
                        <form:errors path="name" cssClass="help-block"/>
                    </div>
                </div>
                <div class="form-group ${ageLimit_error?'has-error':''}">
                    <form:label path="ageLimit" cssClass="col-sm-2 control-label">Age limit</form:label>
                    <div class="col-sm-10">
                        <form:input path="ageLimit" cssClass="form-control"/>
                        <form:errors path="ageLimit" cssClass="help-block"/>
                    </div>
                </div>
                <div class="form-group ${price_error?'has-error':''}">
                    <form:label path="price" cssClass="col-sm-2 control-label">Price</form:label>
                    <div class="col-sm-10">
                        <form:input path="price" cssClass="form-control"/>
                        <form:errors path="price" cssClass="help-block"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button class="btn btn-success" type="submit">Edit model details</button>
                    </div>
                </div>
            </form:form>

            <form:form method="post" action="${pageContext.request.contextPath}/model/discount/${id}"
                       modelAttribute="modelChange" cssClass="form-horizontal">

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button class="btn btn-success" type="submit">Set 50% discount</button>
                    </div>
                </div>
            </form:form>

            <form:form method="post" action="${pageContext.request.contextPath}/model/edit/${id}"
                       modelAttribute="pieces" cssClass="form-horizontal">

                <table class="table">
                    <thead>
                    <tr>
                        <th>Piece type</th>
                        <th>Color</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${pieces}" var="p">
                        <tr>
                            <td><c:out value="${p.type.name}"/></td>
                            <td class="button-cell">
                                <my:colors allColors="${p.type.colors}" type="inactive" activeColor="${p.currentColor}"/>
                            </td>
                            <td class="button-cell tight-cell">
                                <my:a href="/model/${id}/deletePiece/${p.id}" class="btn btn-danger" method="post">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                </my:a>
                            </td>
                        </tr>
                    </c:forEach>


                    <tr>
                        <td colspan="3"></td>
                    </tr>

                    <tr>

                        <td class="button-cell" colspan="3">
                            Add piece <i class="glyphicon glyphicon-plus"></i>
                            <div class="btn-group">
                            <c:forEach items="${pieceTypes}" var="pieceType">

                                <my:a href="/model/change/${id}/addPiece?pieceTypeId=${pieceType.id}" class="btn btn-default">${pieceType.name}</my:a>

                            </c:forEach>
                            </div>

                        </td>

                    </tr>

                    </tbody>
                </table>
            </form:form>
        </div>

</jsp:attribute>
</my:pagetemplate>