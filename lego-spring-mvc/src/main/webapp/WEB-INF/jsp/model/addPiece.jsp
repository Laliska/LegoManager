<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" trimDirectiveWhitespaces="false" session="false" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<my:pagetemplate title="Add piece ${pieceType.name} to model ${model.name}">
    <jsp:attribute name="body">

        <div class="container">
            <form:form method="post" action="${pageContext.request.contextPath}/model/edit/${id}/addPiece"
                       modelAttribute="piece" cssClass="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Piece type</label>
                    <div class="col-sm-10">
                        <input class="form-control" readonly value="${pieceType.name}"/>
                        <form:hidden path="pieceTypeId" />
                    </div>
                </div>
                <div class="form-group ${currentColor_error?'has-error':''}">
                    <form:label path="currentColor" cssClass="col-sm-2 control-label">Name</form:label>
                    <div class="col-sm-10">
                        <my:colors path="currentColor" allColors="${pieceType.colors}" type="radiobutton" activeColor="${piece.currentColor}"/>
                        <form:errors path="currentColor" cssClass="help-block"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button class="btn btn-success" type="submit">Edit model details</button>
                    </div>
                </div>
            </form:form>
        </div>

</jsp:attribute>
</my:pagetemplate>