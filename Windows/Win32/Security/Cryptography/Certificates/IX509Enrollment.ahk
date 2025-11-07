#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateRequest.ahk
#Include .\IX509NameValuePairs.ahk
#Include .\IX509EnrollmentStatus.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents the top level object and enables you to enroll in a certificate hierarchy and install a certificate response.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollment
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509Enrollment extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509Enrollment
     * @type {Guid}
     */
    static IID => Guid("{728ab346-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InitializeFromTemplateName", "InitializeFromRequest", "CreateRequest", "Enroll", "InstallResponse", "CreatePFX", "get_Request", "get_Silent", "put_Silent", "get_ParentWindow", "put_ParentWindow", "get_NameValuePairs", "get_EnrollmentContext", "get_Status", "get_Certificate", "get_Response", "get_CertificateFriendlyName", "put_CertificateFriendlyName", "get_CertificateDescription", "put_CertificateDescription", "get_RequestId", "get_CAConfigString"]

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
        result := ComCall(7, this, "int", Context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {BSTR} strTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-initializefromtemplatename
     */
    InitializeFromTemplateName(Context, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(8, this, "int", Context, "ptr", strTemplateName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IX509CertificateRequest} pRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-initializefromrequest
     */
    InitializeFromRequest(pRequest) {
        result := ComCall(9, this, "ptr", pRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-createrequest
     */
    CreateRequest(Encoding) {
        pValue := BSTR()
        result := ComCall(10, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-enroll
     */
    Enroll() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Restrictions 
     * @param {BSTR} strResponse 
     * @param {Integer} Encoding 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-installresponse
     */
    InstallResponse(Restrictions, strResponse, Encoding, strPassword) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(12, this, "int", Restrictions, "ptr", strResponse, "int", Encoding, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPassword 
     * @param {Integer} ExportOptions 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-createpfx
     */
    CreatePFX(strPassword, ExportOptions, Encoding) {
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        pValue := BSTR()
        result := ComCall(13, this, "ptr", strPassword, "int", ExportOptions, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {IX509CertificateRequest} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_request
     */
    get_Request() {
        result := ComCall(14, this, "ptr*", &pValue := 0, "HRESULT")
        return IX509CertificateRequest(pValue)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_silent
     */
    get_Silent() {
        result := ComCall(15, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-put_silent
     */
    put_Silent(Value) {
        result := ComCall(16, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(17, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-put_parentwindow
     */
    put_ParentWindow(Value) {
        result := ComCall(18, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509NameValuePairs} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_namevaluepairs
     */
    get_NameValuePairs() {
        result := ComCall(19, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509NameValuePairs(ppValue)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_enrollmentcontext
     */
    get_EnrollmentContext() {
        result := ComCall(20, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {IX509EnrollmentStatus} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_status
     */
    get_Status() {
        result := ComCall(21, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509EnrollmentStatus(ppValue)
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_certificate
     */
    get_Certificate(Encoding) {
        pValue := BSTR()
        result := ComCall(22, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_response
     */
    get_Response(Encoding) {
        pValue := BSTR()
        result := ComCall(23, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_certificatefriendlyname
     */
    get_CertificateFriendlyName() {
        pValue := BSTR()
        result := ComCall(24, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-put_certificatefriendlyname
     */
    put_CertificateFriendlyName(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(25, this, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_certificatedescription
     */
    get_CertificateDescription() {
        pValue := BSTR()
        result := ComCall(26, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-put_certificatedescription
     */
    put_CertificateDescription(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(27, this, "ptr", strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_requestid
     */
    get_RequestId() {
        result := ComCall(28, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollment-get_caconfigstring
     */
    get_CAConfigString() {
        pValue := BSTR()
        result := ComCall(29, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
