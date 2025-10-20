#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IX509CertificateRequestPkcs7.ahk

/**
 * The IX509CertificateRequestPkcs7V2 interface represents a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequestpkcs7v2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestPkcs7V2 extends IX509CertificateRequestPkcs7{
    /**
     * The interface identifier for IX509CertificateRequestPkcs7V2
     * @type {Guid}
     */
    static IID => Guid("{728ab35c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * 
     * @param {Integer} context 
     * @param {Pointer<IX509EnrollmentPolicyServer>} pPolicyServer 
     * @param {Pointer<IX509CertificateTemplate>} pTemplate 
     * @returns {HRESULT} 
     */
    InitializeFromTemplate(context, pPolicyServer, pTemplate) {
        result := ComCall(40, this, "int", context, "ptr", pPolicyServer, "ptr", pTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509EnrollmentPolicyServer>} ppPolicyServer 
     * @returns {HRESULT} 
     */
    get_PolicyServer(ppPolicyServer) {
        result := ComCall(41, this, "ptr", ppPolicyServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateTemplate>} ppTemplate 
     * @returns {HRESULT} 
     */
    get_Template(ppTemplate) {
        result := ComCall(42, this, "ptr", ppTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} ValidateCertificateChain 
     * @returns {HRESULT} 
     */
    CheckCertificateSignature(ValidateCertificateChain) {
        result := ComCall(43, this, "short", ValidateCertificateChain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
