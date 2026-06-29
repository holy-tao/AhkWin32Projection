#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpcRelationshipSelectorEnumerator.ahk" { IOpcRelationshipSelectorEnumerator }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IOpcRelationshipSelector.ahk" { IOpcRelationshipSelector }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\OPC_RELATIONSHIP_SELECTOR.ahk" { OPC_RELATIONSHIP_SELECTOR }

/**
 * An unordered set of IOpcRelationshipSelector interface pointers that represent the selection criteria that is used to identify relationships for signing.
 * @remarks
 * Use the methods of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointers in the set to select relationships for signing.
 * 
 * To create an <b>IOpcRelationshipSelectorSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-createrelationshipselectorset">IOpcSignatureRelationshipReference::CreateRelationshipSelectorSet</a> method.
 * 
 * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointer is created and added to the set, the criterion it provides access to is saved when the package is saved.
 * 
 * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointer is deleted from the set, the criterion it provides access to is not saved when the package is saved.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcrelationshipselectorset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcRelationshipSelectorSet extends IUnknown {
    /**
     * The interface identifier for IOpcRelationshipSelectorSet
     * @type {Guid}
     */
    static IID := Guid("{6e34c269-a4d3-47c0-b5c4-87ff2b3b6136}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcRelationshipSelectorSet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create        : IntPtr
        Delete        : IntPtr
        GetEnumerator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcRelationshipSelectorSet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an IOpcRelationshipSelector interface pointer to represent how a subset of relationships are selected to be signed, and adds the new pointer to the set.
     * @remarks
     * Use the methods of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointers in the set to select relationships for signing.
     * 
     * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointer is created and added to the set, the criterion it provides access to is saved when the package is saved.
     * @param {OPC_RELATIONSHIP_SELECTOR} selector A value that describes how to interpret the  string that is passed in <i>selectionCriterion</i>.
     * @param {PWSTR} selectionCriterion A string that is interpreted to yield a criterion.
     * @returns {IOpcRelationshipSelector} A new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointer that represents how relationships are selected from a Relationships part.
     * 
     * This parameter can be <b>NULL</b> if a pointer to the  new interface is not needed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselectorset-create
     */
    Create(selector, selectionCriterion) {
        selectionCriterion := selectionCriterion is String ? StrPtr(selectionCriterion) : selectionCriterion

        result := ComCall(3, this, OPC_RELATIONSHIP_SELECTOR, selector, "ptr", selectionCriterion, "ptr*", &relationshipSelector := 0, "HRESULT")
        return IOpcRelationshipSelector(relationshipSelector)
    }

    /**
     * Deletes a specified IOpcRelationshipSelector interface pointer from the set.
     * @remarks
     * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointer is deleted from the set, the criterion it provides access to is not saved when the package is saved.
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
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselectorset-delete
     */
    Delete(relationshipSelector) {
        result := ComCall(4, this, "ptr", relationshipSelector, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of IOpcRelationshipSelector interface pointers in the set.
     * @returns {IOpcRelationshipSelectorEnumerator} A pointer to an enumerator of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcrelationshipselector">IOpcRelationshipSelector</a> interface pointers in the set.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselectorset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(5, this, "ptr*", &relationshipSelectorEnumerator := 0, "HRESULT")
        return IOpcRelationshipSelectorEnumerator(relationshipSelectorEnumerator)
    }

    Query(iid) {
        if (IOpcRelationshipSelectorSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 4)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 2)
        this.vtbl.GetEnumerator := CallbackCreate(GetMethod(implObj, "GetEnumerator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.GetEnumerator)
    }
}
