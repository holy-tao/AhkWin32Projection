#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Enrollment.ahk

/**
 * The IX509Enrollment2 interface enables you to enroll in a certificate hierarchy and install a certificate response.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollment2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509Enrollment2 extends IX509Enrollment{
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
     * 
     * @param {Integer} context 
     * @param {Pointer<IX509EnrollmentPolicyServer>} pPolicyServer 
     * @param {Pointer<IX509CertificateTemplate>} pTemplate 
     * @returns {HRESULT} 
     */
    InitializeFromTemplate(context, pPolicyServer, pTemplate) {
        result := ComCall(30, this, "int", context, "ptr", pPolicyServer, "ptr", pTemplate, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    InstallResponse2(Restrictions, strResponse, Encoding, strPassword, strEnrollmentPolicyServerUrl, strEnrollmentPolicyServerID, EnrollmentPolicyServerFlags, authFlags) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strEnrollmentPolicyServerUrl := strEnrollmentPolicyServerUrl is String ? BSTR.Alloc(strEnrollmentPolicyServerUrl).Value : strEnrollmentPolicyServerUrl
        strEnrollmentPolicyServerID := strEnrollmentPolicyServerID is String ? BSTR.Alloc(strEnrollmentPolicyServerID).Value : strEnrollmentPolicyServerID

        result := ComCall(31, this, "int", Restrictions, "ptr", strResponse, "int", Encoding, "ptr", strPassword, "ptr", strEnrollmentPolicyServerUrl, "ptr", strEnrollmentPolicyServerID, "int", EnrollmentPolicyServerFlags, "int", authFlags, "int")
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
        result := ComCall(32, this, "ptr", ppPolicyServer, "int")
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
        result := ComCall(33, this, "ptr", ppTemplate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_RequestIdString(pValue) {
        result := ComCall(34, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
