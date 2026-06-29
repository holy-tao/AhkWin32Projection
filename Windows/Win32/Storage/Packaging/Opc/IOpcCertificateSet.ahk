#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOpcCertificateEnumerator.ahk" { IOpcCertificateEnumerator }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An unordered set of certificates to be used with a signature.
 * @remarks
 * Do not add the certificate that will be passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignature::Sign</a> method (the signer certificate) to this certificate set.
 * 
 * Certificates that are in a certificate chain are added to the package by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateset-add">Add</a> method.
 * 
 * To access an <b>IOpcCertificateSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getcertificateset">IOpcSigningOptions::GetCertificateSet</a> method.
 * 
 * When a signature is generated, certificates that were added to the package by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateset-add">Add</a> are associated  with the signature.
 * @see https://learn.microsoft.com/windows/win32/api/msopc/nn-msopc-iopccertificateset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 */
export default struct IOpcCertificateSet extends IUnknown {
    /**
     * The interface identifier for IOpcCertificateSet
     * @type {Guid}
     */
    static IID := Guid("{56ea4325-8e2d-4167-b1a4-e486d24c8fa7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOpcCertificateSet interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Add           : IntPtr
        Remove        : IntPtr
        GetEnumerator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOpcCertificateSet.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a certificate to the set.
     * @remarks
     * Certificates that are in a certificate chain are added to the package by calling the 
     *     <b>Add</b> method.
     * 
     * When a signature is 
     *     generated, certificates that were added to the package by calling 
     *     <b>Add</b> are associated  with the signature.
     * @param {Pointer<CERT_CONTEXT>} certificate A 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> 
     *        structure that contains the certificate to be added.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, 
     *        those in the following table.
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
     * The <i>certificate</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateset-add
     */
    Add(certificate) {
        result := ComCall(3, this, CERT_CONTEXT.Ptr, certificate, "HRESULT")
        return result
    }

    /**
     * Removes a specified certificate from the set.
     * @param {Pointer<CERT_CONTEXT>} certificate A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the certificate to be removed.
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
     * The <i>certificate</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateset-remove
     */
    Remove(certificate) {
        result := ComCall(4, this, CERT_CONTEXT.Ptr, certificate, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of certificates in the set.
     * @returns {IOpcCertificateEnumerator} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopccertificateenumerator">IOpcCertificateEnumerator</a> interface of certificates in the set.
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopccertificateset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(5, this, "ptr*", &certificateEnumerator := 0, "HRESULT")
        return IOpcCertificateEnumerator(certificateEnumerator)
    }

    Query(iid) {
        if (IOpcCertificateSet.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.GetEnumerator := CallbackCreate(GetMethod(implObj, "GetEnumerator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.GetEnumerator)
    }
}
