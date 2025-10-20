#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509EnrollmentHelper interface defines methods that enable a web application to enroll a certificate, store policy server credentials in the credential cache, and register policy servers and enrollment servers.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollmenthelper
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509EnrollmentHelper extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509EnrollmentHelper
     * @type {Guid}
     */
    static IID => Guid("{728ab351-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPolicyServer", "AddEnrollmentServer", "Enroll", "Initialize"]

    /**
     * 
     * @param {BSTR} strEnrollmentPolicyServerURI 
     * @param {BSTR} strEnrollmentPolicyID 
     * @param {Integer} EnrollmentPolicyServerFlags 
     * @param {Integer} authFlags 
     * @param {BSTR} strCredential 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmenthelper-addpolicyserver
     */
    AddPolicyServer(strEnrollmentPolicyServerURI, strEnrollmentPolicyID, EnrollmentPolicyServerFlags, authFlags, strCredential, strPassword) {
        strEnrollmentPolicyServerURI := strEnrollmentPolicyServerURI is String ? BSTR.Alloc(strEnrollmentPolicyServerURI).Value : strEnrollmentPolicyServerURI
        strEnrollmentPolicyID := strEnrollmentPolicyID is String ? BSTR.Alloc(strEnrollmentPolicyID).Value : strEnrollmentPolicyID
        strCredential := strCredential is String ? BSTR.Alloc(strCredential).Value : strCredential
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(7, this, "ptr", strEnrollmentPolicyServerURI, "ptr", strEnrollmentPolicyID, "int", EnrollmentPolicyServerFlags, "int", authFlags, "ptr", strCredential, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strEnrollmentServerURI 
     * @param {Integer} authFlags 
     * @param {BSTR} strCredential 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmenthelper-addenrollmentserver
     */
    AddEnrollmentServer(strEnrollmentServerURI, authFlags, strCredential, strPassword) {
        strEnrollmentServerURI := strEnrollmentServerURI is String ? BSTR.Alloc(strEnrollmentServerURI).Value : strEnrollmentServerURI
        strCredential := strCredential is String ? BSTR.Alloc(strCredential).Value : strCredential
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(8, this, "ptr", strEnrollmentServerURI, "int", authFlags, "ptr", strCredential, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strEnrollmentPolicyServerURI 
     * @param {BSTR} strTemplateName 
     * @param {Integer} Encoding 
     * @param {Integer} enrollFlags 
     * @param {Pointer<BSTR>} pstrCertificate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmenthelper-enroll
     */
    Enroll(strEnrollmentPolicyServerURI, strTemplateName, Encoding, enrollFlags, pstrCertificate) {
        strEnrollmentPolicyServerURI := strEnrollmentPolicyServerURI is String ? BSTR.Alloc(strEnrollmentPolicyServerURI).Value : strEnrollmentPolicyServerURI
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(9, this, "ptr", strEnrollmentPolicyServerURI, "ptr", strTemplateName, "int", Encoding, "int", enrollFlags, "ptr", pstrCertificate, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} Context 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(Context) {
        result := ComCall(10, this, "int", Context, "HRESULT")
        return result
    }
}
