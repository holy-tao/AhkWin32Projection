#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IOpcSignaturePartReferenceEnumerator.ahk" { IOpcSignaturePartReferenceEnumerator }
#Import ".\IOpcSignaturePartReference.ahk" { IOpcSignaturePartReference }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\OPC_CANONICALIZATION_METHOD.ahk" { OPC_CANONICALIZATION_METHOD }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An unordered set of IOpcSignaturePartReference interface pointers that represent references to parts to be signed.
 * @remarks
 * Only parts that can be represented by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface can be referenced by an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer. Relationships parts are referenced for signing  by a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface. To create an <b>IOpcSignatureRelationshipReference</b> interface pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create">IOpcSignatureRelationshipReferenceSet::Create</a> method.
 * 
 * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer is created and added to the set, the reference it represents is saved when the package is saved.
 * 
 * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer is deleted from the set, the reference it represents is not saved when the package is saved.
 * 
 * To create an <b>IOpcSignaturePartReferenceSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getsignaturepartreferenceset">IOpcSigningOptions::GetSignaturePartReferenceSet</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopcsignaturepartreferenceset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcSignaturePartReferenceSet extends IUnknown {
    /**
     * The interface identifier for IOpcSignaturePartReferenceSet
     * @type {Guid}
     */
    static IID := Guid("{6c9fe28c-ecd9-4b22-9d36-7fdde670fec0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcSignaturePartReferenceSet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create        : IntPtr
        Delete        : IntPtr
        GetEnumerator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcSignaturePartReferenceSet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an IOpcSignaturePartReference interface pointer that represents a reference to a part to be signed, and adds the new interface to the set.
     * @remarks
     * Only parts that can be represented by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface can be referenced by an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer. Relationships parts are referenced for signing  by a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface. To create an <b>IOpcSignatureRelationshipReference</b> interface pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create">IOpcSignatureRelationshipReferenceSet::Create</a> method.
     * 
     * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer is created and added to the set, the reference it represents is saved when the package is saved.
     * @param {IOpcPartUri} partUri An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcparturi">IOpcPartUri</a> that represents the part name of the part to be referenced.
     * @param {PWSTR} digestMethod The digest method to be used for part content of the part to be referenced. To use the default digest method, pass <b>NULL</b> to this parameter. <div class="alert"><b>Important</b>  The default digest method must be set by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-setdefaultdigestmethod">IOpcSigningOptions::SetDefaultDigestMethod</a> method before <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignatureManager::Sign</a> is called.</div>
     * <div> </div>
     * @param {OPC_CANONICALIZATION_METHOD} transformMethod The canonicalization method  used for part content of the part to be referenced.
     * @returns {IOpcSignaturePartReference} A new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer that represents the reference to  the part to be signed.
     * 
     * This parameter can be <b>NULL</b> if a pointer to the  new interface is not needed.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreferenceset-create
     */
    Create(partUri, digestMethod, transformMethod) {
        digestMethod := digestMethod is String ? StrPtr(digestMethod) : digestMethod

        result := ComCall(3, this, "ptr", partUri, "ptr", digestMethod, OPC_CANONICALIZATION_METHOD, transformMethod, "ptr*", &partReference := 0, "HRESULT")
        return IOpcSignaturePartReference(partReference)
    }

    /**
     * Deletes a specified IOpcSignaturePartReference interface pointer from the set.
     * @remarks
     * When an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer is deleted from the set, the reference it represents is not saved when the package is saved.
     * @param {IOpcSignaturePartReference} partReference An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointer to be deleted.
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
     * The <i>partReference</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreferenceset-delete
     */
    Delete(partReference) {
        result := ComCall(4, this, "ptr", partReference, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of IOpcSignaturePartReference interface pointers in the set.
     * @returns {IOpcSignaturePartReferenceEnumerator} A pointer to an enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturepartreference">IOpcSignaturePartReference</a> interface pointers in the set.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreferenceset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(5, this, "ptr*", &partReferenceEnumerator := 0, "HRESULT")
        return IOpcSignaturePartReferenceEnumerator(partReferenceEnumerator)
    }

    Query(iid) {
        if (IOpcSignaturePartReferenceSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 5)
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
