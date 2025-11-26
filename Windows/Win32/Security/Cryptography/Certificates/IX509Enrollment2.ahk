#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509EnrollmentPolicyServer.ahk
#Include .\IX509CertificateTemplate.ahk
#Include .\IX509Enrollment.ahk

/**
 * The IX509Enrollment2 interface enables you to enroll in a certificate hierarchy and install a certificate response.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollment2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509Enrollment2 extends IX509Enrollment{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509Enrollment2
     * @type {Guid}
     */
    static IID => Guid("{728ab350-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplate", "InstallResponse2", "get_PolicyServer", "get_Template", "get_RequestIdString"]

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
     * @type {BSTR} 
     */
    RequestIdString {
        get => this.get_RequestIdString()
    }

    /**
     * 
     * @param {Integer} context 
     * @param {IX509EnrollmentPolicyServer} pPolicyServer 
     * @param {IX509CertificateTemplate} pTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment2-initializefromtemplate
     */
    InitializeFromTemplate(context, pPolicyServer, pTemplate) {
        result := ComCall(30, this, "int", context, "ptr", pPolicyServer, "ptr", pTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Restrictions 
     * @param {BSTR} strResponse 
     * @param {Integer} Encoding 
     * @param {BSTR} strPassword 
     * @param {BSTR} strEnrollmentPolicyServerUrl 
     * @param {BSTR} strEnrollmentPolicyServerID 
     * @param {Integer} EnrollmentPolicyServerFlags 
     * @param {Integer} authFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment2-installresponse2
     */
    InstallResponse2(Restrictions, strResponse, Encoding, strPassword, strEnrollmentPolicyServerUrl, strEnrollmentPolicyServerID, EnrollmentPolicyServerFlags, authFlags) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strEnrollmentPolicyServerUrl := strEnrollmentPolicyServerUrl is String ? BSTR.Alloc(strEnrollmentPolicyServerUrl).Value : strEnrollmentPolicyServerUrl
        strEnrollmentPolicyServerID := strEnrollmentPolicyServerID is String ? BSTR.Alloc(strEnrollmentPolicyServerID).Value : strEnrollmentPolicyServerID

        result := ComCall(31, this, "int", Restrictions, "ptr", strResponse, "int", Encoding, "ptr", strPassword, "ptr", strEnrollmentPolicyServerUrl, "ptr", strEnrollmentPolicyServerID, "int", EnrollmentPolicyServerFlags, "int", authFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509EnrollmentPolicyServer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment2-get_policyserver
     */
    get_PolicyServer() {
        result := ComCall(32, this, "ptr*", &ppPolicyServer := 0, "HRESULT")
        return IX509EnrollmentPolicyServer(ppPolicyServer)
    }

    /**
     * 
     * @returns {IX509CertificateTemplate} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment2-get_template
     */
    get_Template() {
        result := ComCall(33, this, "ptr*", &ppTemplate := 0, "HRESULT")
        return IX509CertificateTemplate(ppTemplate)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment2-get_requestidstring
     */
    get_RequestIdString() {
        pValue := BSTR()
        result := ComCall(34, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
