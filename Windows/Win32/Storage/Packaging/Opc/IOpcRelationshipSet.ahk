#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {PWSTR} relationshipIdentifier 
     * @param {Pointer<IOpcRelationship>} relationship 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipset-getrelationship
     */
    GetRelationship(relationshipIdentifier, relationship) {
        relationshipIdentifier := relationshipIdentifier is String ? StrPtr(relationshipIdentifier) : relationshipIdentifier

        result := ComCall(3, this, "ptr", relationshipIdentifier, "ptr*", relationship, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} relationshipIdentifier 
     * @param {PWSTR} relationshipType 
     * @param {IUri} targetUri 
     * @param {Integer} targetMode 
     * @param {Pointer<IOpcRelationship>} relationship 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipset-createrelationship
     */
    CreateRelationship(relationshipIdentifier, relationshipType, targetUri, targetMode, relationship) {
        relationshipIdentifier := relationshipIdentifier is String ? StrPtr(relationshipIdentifier) : relationshipIdentifier
        relationshipType := relationshipType is String ? StrPtr(relationshipType) : relationshipType

        result := ComCall(4, this, "ptr", relationshipIdentifier, "ptr", relationshipType, "ptr", targetUri, "int", targetMode, "ptr*", relationship, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} relationshipIdentifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipset-deleterelationship
     */
    DeleteRelationship(relationshipIdentifier) {
        relationshipIdentifier := relationshipIdentifier is String ? StrPtr(relationshipIdentifier) : relationshipIdentifier

        result := ComCall(5, this, "ptr", relationshipIdentifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} relationshipIdentifier 
     * @param {Pointer<BOOL>} relationshipExists 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipset-relationshipexists
     */
    RelationshipExists(relationshipIdentifier, relationshipExists) {
        relationshipIdentifier := relationshipIdentifier is String ? StrPtr(relationshipIdentifier) : relationshipIdentifier

        result := ComCall(6, this, "ptr", relationshipIdentifier, "ptr", relationshipExists, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcRelationshipEnumerator>} relationshipEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipset-getenumerator
     */
    GetEnumerator(relationshipEnumerator) {
        result := ComCall(7, this, "ptr*", relationshipEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} relationshipType 
     * @param {Pointer<IOpcRelationshipEnumerator>} relationshipEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipset-getenumeratorfortype
     */
    GetEnumeratorForType(relationshipType, relationshipEnumerator) {
        relationshipType := relationshipType is String ? StrPtr(relationshipType) : relationshipType

        result := ComCall(8, this, "ptr", relationshipType, "ptr*", relationshipEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} contents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipset-getrelationshipscontentstream
     */
    GetRelationshipsContentStream(contents) {
        result := ComCall(9, this, "ptr*", contents, "HRESULT")
        return result
    }
}
