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
     * Creates an IOpcRelationshipSelector interface pointer to represent how a subset of relationships are selected to be signed, and adds the new pointer to the set.
     * @param {Integer} selector A value that describes how to interpret the  string that is passed in <i>selectionCriterion</i>.
     * @param {PWSTR} selectionCriterion A string that is interpreted to yield a criterion.
     * @returns {IOpcRelationshipSelector} A new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointer that represents how relationships are selected from a Relationships part.
     * 
     * This parameter can be <b>NULL</b> if a pointer to the  new interface is not needed.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcrelationshipselectorset-create
     */
    Create(selector, selectionCriterion) {
        selectionCriterion := selectionCriterion is String ? StrPtr(selectionCriterion) : selectionCriterion

        result := ComCall(3, this, "int", selector, "ptr", selectionCriterion, "ptr*", &relationshipSelector := 0, "HRESULT")
        return IOpcRelationshipSelector(relationshipSelector)
    }

    /**
     * Deletes a specified IOpcRelationshipSelector interface pointer from the set.
     * @param {IOpcRelationshipSelector} relationshipSelector An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointer to be deleted.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
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
     * The <i>relationshipSelector</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcrelationshipselectorset-delete
     */
    Delete(relationshipSelector) {
        result := ComCall(4, this, "ptr", relationshipSelector, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of IOpcRelationshipSelector interface pointers in the set.
     * @returns {IOpcRelationshipSelectorEnumerator} A pointer to an enumerator of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointers in the set.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopcrelationshipselectorset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(5, this, "ptr*", &relationshipSelectorEnumerator := 0, "HRESULT")
        return IOpcRelationshipSelectorEnumerator(relationshipSelectorEnumerator)
    }
}
