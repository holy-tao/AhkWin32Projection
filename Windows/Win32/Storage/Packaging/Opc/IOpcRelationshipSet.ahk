#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcRelationship.ahk
#Include .\IOpcRelationshipEnumerator.ahk
#Include ..\..\..\System\Com\IStream.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a Relationships part as an unordered set of IOpcRelationship interface pointers to relationship objects.
 * @remarks
 * 
 * When a relationship object is created and a pointer to it is added to the set, the relationship it represents is saved when the package is saved.
 * 
 * When an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface pointer is deleted from the set, the relationship it represents is not saved when the package is saved.
 * 
 * If a relationship is represented in the set, the relationship is stored in the Relationships part represented as the set.
 * 
 * For how to form the part name for the target of a relationship, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/resolving-a-part-name-from-a-relationship-s-target-uri">Resolving a Part Name from a Target URI</a>.
 * 
 * For more information about relationships, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/open-packaging-conventions-overview">Open Packaging Conventions Fundamentals</a> and the <i>ECMA-376 OpenXML, 1st Edition, Part 2: Open Packaging Conventions (OPC)</i>.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface provides access to relationship properties. For details about these properties, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/opc/relationships-overview">Relationships Overview</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcrelationshipset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcRelationshipSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcRelationshipSet
     * @type {Guid}
     */
    static IID => Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRelationship", "CreateRelationship", "DeleteRelationship", "RelationshipExists", "GetEnumerator", "GetEnumeratorForType", "GetRelationshipsContentStream"]

    /**
     * Gets a relationship object from the set that represents a specified relationship.
     * @param {PWSTR} relationshipIdentifier The unique identifier of a relationship.
     * @returns {IOpcRelationship} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface of the relationship object that represents the relationship that has the  specified identifier.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcrelationshipset-getrelationship
     */
    GetRelationship(relationshipIdentifier) {
        relationshipIdentifier := relationshipIdentifier is String ? StrPtr(relationshipIdentifier) : relationshipIdentifier

        result := ComCall(3, this, "ptr", relationshipIdentifier, "ptr*", &relationship := 0, "HRESULT")
        return IOpcRelationship(relationship)
    }

    /**
     * Creates a relationship object that represents a specified relationship, then adds to the set a pointer to the object's IOpcRelationship interface.
     * @param {PWSTR} relationshipIdentifier A unique identifier of the relationship to be represented as the relationship object. To use a randomly generated identifier, pass <b>NULL</b> to this parameter.
     * 
     * Valid identifiers conform to the restrictions for <b>xsd:ID</b>, which are  documented in section 3.3.8 ID of the <a href="https://www.w3.org/TR/xmlschema-2/#ID">W3C Recommendation, XML Schema Part 2: Datatypes Second Edition</a> (http://www.w3.org/TR/xmlschema-2/#ID).
     * @param {PWSTR} relationshipType The relationship type that defines the role of  the relationship to be represented as the relationship object.
     * @param {IUri} targetUri A  URI to the target of the relationship to be represented as the relationship object.
     * 
     * If the value in <i>targetMode</i> is <b>OPC_URI_TARGET_MODE_INTERNAL</b>, target is a part and the URI must be relative to the source of the relationship.
     * 
     * If the value in <i>targetMode</i> is <b>OPC_URI_TARGET_MODE_EXTERNAL</b>, target is a resource outside of the package and the URI may be absolute or relative to the location of the package.
     * 
     * For more information about the URI of a relationship's target, see the <i>OPC</i>.
     * @param {Integer} targetMode A value that indicates whether the target of the relationship to be represented as the relationship object is internal or external to  the package.
     * @returns {IOpcRelationship} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface  of the relationship object that represents the relationship. 
     * 
     * This parameter can be <b>NULL</b> if a pointer to the  new object is not needed.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcrelationshipset-createrelationship
     */
    CreateRelationship(relationshipIdentifier, relationshipType, targetUri, targetMode) {
        relationshipIdentifier := relationshipIdentifier is String ? StrPtr(relationshipIdentifier) : relationshipIdentifier
        relationshipType := relationshipType is String ? StrPtr(relationshipType) : relationshipType

        result := ComCall(4, this, "ptr", relationshipIdentifier, "ptr", relationshipType, "ptr", targetUri, "int", targetMode, "ptr*", &relationship := 0, "HRESULT")
        return IOpcRelationship(relationship)
    }

    /**
     * Deletes a specified IOpcRelationship interface pointer from the set.
     * @param {PWSTR} relationshipIdentifier The unique   identifier of a relationship.
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface pointer to be deleted is the pointer to the relationship object that represents the relationship the  specified identifier.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>relationshipIdentifier</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OPC_E_NO_SUCH_RELATIONSHIP</b></dt>
     * <dt>0x80510048</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified relationship does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Package Consumption error</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An <b>HRESULT</b> error code from the <a href="/previous-versions/windows/desktop/opc/package-consumption-error-group">Package Consumption Error Group</a>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Part URI error</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An <b>HRESULT</b> error code from the <a href="/previous-versions/windows/desktop/opc/part-uri-error-group">Part URI Error Group</a>. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcrelationshipset-deleterelationship
     */
    DeleteRelationship(relationshipIdentifier) {
        relationshipIdentifier := relationshipIdentifier is String ? StrPtr(relationshipIdentifier) : relationshipIdentifier

        result := ComCall(5, this, "ptr", relationshipIdentifier, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether a specified relationship is represented as a relationship object in the set.
     * @param {PWSTR} relationshipIdentifier The unique identifier of a relationship.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcrelationshipset-relationshipexists
     */
    RelationshipExists(relationshipIdentifier) {
        relationshipIdentifier := relationshipIdentifier is String ? StrPtr(relationshipIdentifier) : relationshipIdentifier

        result := ComCall(6, this, "ptr", relationshipIdentifier, "int*", &relationshipExists := 0, "HRESULT")
        return relationshipExists
    }

    /**
     * Gets an enumerator of IOpcRelationship interface pointers in the set.
     * @returns {IOpcRelationshipEnumerator} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipenumerator">IOpcRelationshipEnumerator</a> interface of the enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface pointers in the set.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcrelationshipset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(7, this, "ptr*", &relationshipEnumerator := 0, "HRESULT")
        return IOpcRelationshipEnumerator(relationshipEnumerator)
    }

    /**
     * Gets an enumerator of the IOpcRelationship interface pointers in the set that point to representations of relationships that have a specified relationship type.
     * @param {PWSTR} relationshipType The relationship type used to identify <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface pointers to be enumerated.
     * @returns {IOpcRelationshipEnumerator} A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipenumerator">IOpcRelationshipEnumerator</a> interface of the  enumerator of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationship">IOpcRelationship</a> interface pointers in the set that point to representations of relationships  that have a specified relationship type.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcrelationshipset-getenumeratorfortype
     */
    GetEnumeratorForType(relationshipType) {
        relationshipType := relationshipType is String ? StrPtr(relationshipType) : relationshipType

        result := ComCall(8, this, "ptr", relationshipType, "ptr*", &relationshipEnumerator := 0, "HRESULT")
        return IOpcRelationshipEnumerator(relationshipEnumerator)
    }

    /**
     * Gets a read-only stream that contains the part content of the Relationships part represented by the set.
     * @returns {IStream} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface of the read-only  stream that contains the part content of the Relationships part represented by the set.
     * 
     * If  the relationships stored in the  Relationships part  have not been  modified, part content can include markup compatibility data that is not otherwise accessible through the relationship objects in the set.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcrelationshipset-getrelationshipscontentstream
     */
    GetRelationshipsContentStream() {
        result := ComCall(9, this, "ptr*", &contents := 0, "HRESULT")
        return IStream(contents)
    }
}
