#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcCertificateEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An unordered set of certificates to be used with a signature.
 * @remarks
 * 
 * Do not add the certificate that will be passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignaturemanager-sign">IOpcDigitalSignature::Sign</a> method (the signer certificate) to this certificate set.
 * 
 * Certificates that are in a certificate chain are added to the package by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateset-add">Add</a> method.
 * 
 * To access an <b>IOpcCertificateSet</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsigningoptions-getcertificateset">IOpcSigningOptions::GetCertificateSet</a> method.
 * 
 * When a signature is generated, certificates that were added to the package by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopccertificateset-add">Add</a> are associated  with the signature.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopccertificateset
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcCertificateSet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcCertificateSet
     * @type {Guid}
     */
    static IID => Guid("{56ea4325-8e2d-4167-b1a4-e486d24c8fa7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "Remove", "GetEnumerator"]

    /**
     * Adds a certificate to the set.
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
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopccertificateset-add
     */
    Add(certificate) {
        result := ComCall(3, this, "ptr", certificate, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopccertificateset-remove
     */
    Remove(certificate) {
        result := ComCall(4, this, "ptr", certificate, "HRESULT")
        return result
    }

    /**
     * Gets an enumerator of certificates in the set.
     * @returns {IOpcCertificateEnumerator} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopccertificateenumerator">IOpcCertificateEnumerator</a> interface of certificates in the set.
     * @see https://docs.microsoft.com/windows/win32/api//msopc/nf-msopc-iopccertificateset-getenumerator
     */
    GetEnumerator() {
        result := ComCall(5, this, "ptr*", &certificateEnumerator := 0, "HRESULT")
        return IOpcCertificateEnumerator(certificateEnumerator)
    }
}
