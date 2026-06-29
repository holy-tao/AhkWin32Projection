#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * A read-only enumerator of pointers to CERT_CONTEXT structures.
 * @remarks
 * When an enumerator is created, the current position precedes the first pointer of the enumerator. To set the current position to the first pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateenumerator-movenext">MoveNext</a> method after the enumerator is created.
 * 
 * Changes to the set will invalidate the enumerator and all subsequent calls to it will fail.
 * 
 * To get an <b>IOpcCertificateEnumerator</b> interface pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateset-getenumerator">IOpcCertificateSet::GetEnumerator</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getcertificateenumerator">IOpcDigitalSignature::GetCertificateEnumerator</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopccertificateenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcCertificateEnumerator extends IUnknown {
    /**
     * The interface identifier for IOpcCertificateEnumerator
     * @type {Guid}
     */
    static IID := Guid("{85131937-8f24-421f-b439-59ab24d140b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcCertificateEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MoveNext     : IntPtr
        MovePrevious : IntPtr
        GetCurrent   : IntPtr
        Clone        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcCertificateEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Moves the current position of the enumerator to the next CERT_CONTEXT structure.
     * @returns {BOOL} A Boolean value that indicates the status of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure at the current position.
     * 
     * The value of <i>hasNext</i> is only valid when the method succeeds.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRUE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current position of the enumerator has been advanced to the next pointer and that pointer is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current position of the enumerator has been advanced past the end of the collection and is no longer valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, BOOL.Ptr, &hasNext := 0, "HRESULT")
        return hasNext
    }

    /**
     * Moves the current position of the enumerator to the previous CERT_CONTEXT structure.
     * @returns {BOOL} A Boolean value that indicates the status of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure at the current position.
     * 
     * The value of <i>hasPrevious</i> is only valid when the method succeeds.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>TRUE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current position of the enumerator has been moved to the previous pointer in the collection, and that pointer is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current position of the enumerator has been moved past the beginning of the collection and is no longer valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateenumerator-moveprevious
     */
    MovePrevious() {
        result := ComCall(4, this, BOOL.Ptr, &hasPrevious := 0, "HRESULT")
        return hasPrevious
    }

    /**
     * Gets the CERT_CONTEXT structure at the current position of the enumerator.
     * @remarks
     * If the certificate represented by the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure is corrupted or is not an X.509 certificate, this method will return an error; further,  the signing policy used by the caller dictates whether the signature will still be validated. After this kind of error is returned, calls to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateenumerator-movenext">MoveNext</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateenumerator-moveprevious">MovePrevious</a> method will continue to iterate through the enumerator.
     * 
     * When an enumerator is created, the current position precedes the first pointer of the enumerator. To set the current position to the first pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateenumerator-movenext">MoveNext</a> method after the enumerator is created.
     * @returns {Pointer<CERT_CONTEXT>} A  pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure.
     *             If the method succeeds, call the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreecertificatecontext">CertFreeCertificateContext</a> function to free the memory of the structure.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &certificate := 0, "HRESULT")
        return certificate
    }

    /**
     * Creates a copy of the current IOpcCertificateEnumerator interface pointer and all its descendants.
     * @remarks
     * The copy has a current position  and set that are identical to the current enumerator.
     * @returns {IOpcCertificateEnumerator} A pointer to a copy of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopccertificateenumerator">IOpcCertificateEnumerator</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateenumerator-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &copy := 0, "HRESULT")
        return IOpcCertificateEnumerator(copy)
    }

    Query(iid) {
        if (IOpcCertificateEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MoveNext := CallbackCreate(GetMethod(implObj, "MoveNext"), flags, 2)
        this.vtbl.MovePrevious := CallbackCreate(GetMethod(implObj, "MovePrevious"), flags, 2)
        this.vtbl.GetCurrent := CallbackCreate(GetMethod(implObj, "GetCurrent"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MoveNext)
        CallbackFree(this.vtbl.MovePrevious)
        CallbackFree(this.vtbl.GetCurrent)
        CallbackFree(this.vtbl.Clone)
    }
}
