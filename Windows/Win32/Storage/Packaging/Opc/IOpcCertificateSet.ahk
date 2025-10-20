#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<CERT_CONTEXT>} certificate 
     * @returns {HRESULT} 
     */
    Add(certificate) {
        result := ComCall(3, this, "ptr", certificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} certificate 
     * @returns {HRESULT} 
     */
    Remove(certificate) {
        result := ComCall(4, this, "ptr", certificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcCertificateEnumerator>} certificateEnumerator 
     * @returns {HRESULT} 
     */
    GetEnumerator(certificateEnumerator) {
        result := ComCall(5, this, "ptr", certificateEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
