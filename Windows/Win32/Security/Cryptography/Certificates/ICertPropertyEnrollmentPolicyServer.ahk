#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertProperty.ahk

/**
 * Represents an external certificate property that contains information about a certificate enrollment policy (CEP) server and a certificate enrollment server (CES).
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertpropertyenrollmentpolicyserver
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPropertyEnrollmentPolicyServer extends ICertProperty{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPropertyEnrollmentPolicyServer
     * @type {Guid}
     */
    static IID => Guid("{728ab34a-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetPolicyServerUrl", "GetPolicyServerId", "GetEnrollmentServerUrl", "GetRequestIdString", "GetPropertyFlags", "GetUrlFlags", "GetAuthentication", "GetEnrollmentServerAuthentication"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} PropertyFlags 
     * @param {Integer} AuthFlags 
     * @param {Integer} EnrollmentServerAuthFlags 
     * @param {Integer} UrlFlags 
     * @param {BSTR} strRequestId 
     * @param {BSTR} strUrl 
     * @param {BSTR} strId 
     * @param {BSTR} strEnrollmentServerUrl 
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
    Initialize(PropertyFlags, AuthFlags, EnrollmentServerAuthFlags, UrlFlags, strRequestId, strUrl, strId, strEnrollmentServerUrl) {
        strRequestId := strRequestId is String ? BSTR.Alloc(strRequestId).Value : strRequestId
        strUrl := strUrl is String ? BSTR.Alloc(strUrl).Value : strUrl
        strId := strId is String ? BSTR.Alloc(strId).Value : strId
        strEnrollmentServerUrl := strEnrollmentServerUrl is String ? BSTR.Alloc(strEnrollmentServerUrl).Value : strEnrollmentServerUrl

        result := ComCall(14, this, "int", PropertyFlags, "int", AuthFlags, "int", EnrollmentServerAuthFlags, "int", UrlFlags, "ptr", strRequestId, "ptr", strUrl, "ptr", strId, "ptr", strEnrollmentServerUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getpolicyserverurl
     */
    GetPolicyServerUrl(pValue) {
        result := ComCall(15, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getpolicyserverid
     */
    GetPolicyServerId(pValue) {
        result := ComCall(16, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getenrollmentserverurl
     */
    GetEnrollmentServerUrl(pValue) {
        result := ComCall(17, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getrequestidstring
     */
    GetRequestIdString(pValue) {
        result := ComCall(18, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getpropertyflags
     */
    GetPropertyFlags(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-geturlflags
     */
    GetUrlFlags(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getauthentication
     */
    GetAuthentication(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getenrollmentserverauthentication
     */
    GetEnrollmentServerAuthentication(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pValueMarshal, pValue, "HRESULT")
        return result
    }
}
