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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplate", "get_PolicyServer", "get_Template", "CheckCertificateSignature"]

    /**
     * 
     * @param {Integer} context 
     * @param {IX509EnrollmentPolicyServer} pPolicyServer 
     * @param {IX509CertificateTemplate} pTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7v2-initializefromtemplate
     */
    InitializeFromTemplate(context, pPolicyServer, pTemplate) {
        result := ComCall(40, this, "int", context, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509EnrollmentPolicyServer>} ppPolicyServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7v2-get_policyserver
     */
    get_PolicyServer(ppPolicyServer) {
        result := ComCall(41, this, "ptr*", ppPolicyServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateTemplate>} ppTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7v2-get_template
     */
    get_Template(ppTemplate) {
        result := ComCall(42, this, "ptr*", ppTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} ValidateCertificateChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7v2-checkcertificatesignature
     */
    CheckCertificateSignature(ValidateCertificateChain) {
        result := ComCall(43, this, "short", ValidateCertificateChain, "HRESULT")
        return result
    }
}
