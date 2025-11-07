#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcRelationshipSelector.ahk
#Include .\IOpcRelationshipSelectorEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An unordered set of IOpcRelationshipSelector interface pointers that represent the selection criteria that is used to identify relationships for signing.
 * @remarks
 * 
  * Use the methods of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointers in the set to select relationships for signing.
  * 
  * To create an <b>IOpcRelationshipSelectorSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-createrelationshipselectorset">IOpcSignatureRelationshipReference::CreateRelationshipSelectorSet</a> method.
  * 
  * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointer is created and added to the set, the criterion it provides access to is saved when the package is saved.
  * 
  * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointer is deleted from the set, the criterion it provides access to is not saved when the package is saved.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcrelationshipselectorset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcRelationshipSelectorSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcRelationshipSelectorSet
     * @type {Guid}
     */
    static IID => Guid("{6e34c269-a4d3-47c0-b5c4-87ff2b3b6136}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "Delete", "GetEnumerator"]

    /**
     * 
     * @param {Integer} selector 
     * @param {PWSTR} selectionCriterion 
     * @returns {IOpcRelationshipSelector} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselectorset-create
     */
    Create(selector, selectionCriterion) {
        selectionCriterion := selectionCriterion is String ? StrPtr(selectionCriterion) : selectionCriterion

        result := ComCall(3, this, "int", selector, "ptr", selectionCriterion, "ptr*", &relationshipSelector := 0, "HRESULT")
        return IOpcRelationshipSelector(relationshipSelector)
    }

    /**
     * 
     * @param {IOpcRelationshipSelector} relationshipSelector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselectorset-delete
     */
    Delete(relationshipSelector) {
        result := ComCall(4, this, "ptr", relationshipSelector, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IOpcRelationshipSelectorEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselectorset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(5, this, "ptr*", &relationshipSelectorEnumerator := 0, "HRESULT")
        return IOpcRelationshipSelectorEnumerator(relationshipSelectorEnumerator)
    }
}
