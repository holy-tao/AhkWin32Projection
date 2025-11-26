#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IX509EnrollmentPolicyServer.ahk
#Include .\IX509CertificateTemplate.ahk
#Include .\IX509CertificateRequestPkcs10.ahk

/**
 * The IX509CertificateRequestPkcs10V2 interface represents a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequestpkcs10v2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestPkcs10V2 extends IX509CertificateRequestPkcs10{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestPkcs10V2
     * @type {Guid}
     */
    static IID => Guid("{728ab35b-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 60

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplate", "InitializeFromPrivateKeyTemplate", "InitializeFromPublicKeyTemplate", "get_PolicyServer", "get_Template"]

    /**
     * @type {IX509EnrollmentPolicyServer} 
     */
    PolicyServer {
        get => this.get_PolicyServer()
    }

    /**
     * @type {IX509CertificateTemplate} 
     */
    Template {
        get => this.get_Template()
    }

    /**
     * 
     * @param {Integer} context 
     * @param {IX509EnrollmentPolicyServer} pPolicyServer 
     * @param {IX509CertificateTemplate} pTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v2-initializefromtemplate
     */
    InitializeFromTemplate(context, pPolicyServer, pTemplate) {
        result := ComCall(60, this, "int", context, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {IX509PrivateKey} pPrivateKey 
     * @param {IX509EnrollmentPolicyServer} pPolicyServer 
     * @param {IX509CertificateTemplate} pTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v2-initializefromprivatekeytemplate
     */
    InitializeFromPrivateKeyTemplate(Context, pPrivateKey, pPolicyServer, pTemplate) {
        result := ComCall(61, this, "int", Context, "ptr", pPrivateKey, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {IX509PublicKey} pPublicKey 
     * @param {IX509EnrollmentPolicyServer} pPolicyServer 
     * @param {IX509CertificateTemplate} pTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v2-initializefrompublickeytemplate
     */
    InitializeFromPublicKeyTemplate(Context, pPublicKey, pPolicyServer, pTemplate) {
        result := ComCall(62, this, "int", Context, "ptr", pPublicKey, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509EnrollmentPolicyServer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v2-get_policyserver
     */
    get_PolicyServer() {
        result := ComCall(63, this, "ptr*", &ppPolicyServer := 0, "HRESULT")
        return IX509EnrollmentPolicyServer(ppPolicyServer)
    }

    /**
     * 
     * @returns {IX509CertificateTemplate} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v2-get_template
     */
    get_Template() {
        result := ComCall(64, this, "ptr*", &ppTemplate := 0, "HRESULT")
        return IX509CertificateTemplate(ppTemplate)
    }
}
