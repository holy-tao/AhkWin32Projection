#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IX509CertificateRequestCmc.ahk

/**
 * The IX509CertificateRequestCmc2 interface represents a CMC (Certificate Management Message over CMS) certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequestcmc2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestCmc2 extends IX509CertificateRequestCmc{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestCmc2
     * @type {Guid}
     */
    static IID => Guid("{728ab35d-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 63

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplate", "InitializeFromInnerRequestTemplate", "get_PolicyServer", "get_Template", "CheckSignature", "CheckCertificateSignature"]

    /**
     * 
     * @param {Integer} context 
     * @param {IX509EnrollmentPolicyServer} pPolicyServer 
     * @param {IX509CertificateTemplate} pTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-initializefromtemplate
     */
    InitializeFromTemplate(context, pPolicyServer, pTemplate) {
        result := ComCall(63, this, "int", context, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IX509CertificateRequest} pInnerRequest 
     * @param {IX509EnrollmentPolicyServer} pPolicyServer 
     * @param {IX509CertificateTemplate} pTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-initializefrominnerrequesttemplate
     */
    InitializeFromInnerRequestTemplate(pInnerRequest, pPolicyServer, pTemplate) {
        result := ComCall(64, this, "ptr", pInnerRequest, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509EnrollmentPolicyServer>} ppPolicyServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-get_policyserver
     */
    get_PolicyServer(ppPolicyServer) {
        result := ComCall(65, this, "ptr*", ppPolicyServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateTemplate>} ppTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-get_template
     */
    get_Template(ppTemplate) {
        result := ComCall(66, this, "ptr*", ppTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AllowedSignatureTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-checksignature
     */
    CheckSignature(AllowedSignatureTypes) {
        result := ComCall(67, this, "int", AllowedSignatureTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISignerCertificate} pSignerCertificate 
     * @param {VARIANT_BOOL} ValidateCertificateChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc2-checkcertificatesignature
     */
    CheckCertificateSignature(pSignerCertificate, ValidateCertificateChain) {
        result := ComCall(68, this, "ptr", pSignerCertificate, "short", ValidateCertificateChain, "HRESULT")
        return result
    }
}
