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
     * Initializes an ICertPropertyEnrollmentPolicyServer object.
     * @param {Integer} PropertyFlags 
     * @param {Integer} AuthFlags 
     * @param {Integer} EnrollmentServerAuthFlags An <a href="https://docs.microsoft.com/windows/desktop/api/certcli/ne-certcli-x509enrollmentauthflags">X509EnrollmentAuthFlags</a> enumeration value that specifies the authentication type used by the client to authenticate itself to the CES. See the <i>AuthFlags</i> parameter for the possible values of the enumeration type. For Windows 7, only <b>X509AuthCertificate</b> can be specified.
     * @param {Integer} UrlFlags 
     * @param {BSTR} strRequestId A <b>BSTR</b> variable that contains a unique string identifier for the certificate request to be sent to the certification authority during enrollment. The string can contain any information that uniquely identifies the request.
     * @param {BSTR} strUrl A <b>BSTR</b> variable that contains the URL for the certificate enrollment policy (CEP) server.
     * @param {BSTR} strId A <b>BSTR</b> variable that contains the ID of the CEP server.
     * @param {BSTR} strEnrollmentServerUrl A <b>BSTR</b> variable that contains the URL for the certificate enrollment server.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory available to a string value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-initialize
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
     * Retrieves a string that contains the URL for the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the URL.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getpolicyserverurl
     */
    GetPolicyServerUrl() {
        pValue := BSTR()
        result := ComCall(15, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a string that uniquely identifies the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the ID string.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getpolicyserverid
     */
    GetPolicyServerId() {
        pValue := BSTR()
        result := ComCall(16, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a string that contains the URL for the certificate enrollment server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the URL.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getenrollmentserverurl
     */
    GetEnrollmentServerUrl() {
        pValue := BSTR()
        result := ComCall(17, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a unique string identifier for the certificate request sent to the certification authority during enrollment.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the ID string.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getrequestidstring
     */
    GetRequestIdString() {
        pValue := BSTR()
        result := ComCall(18, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value that specifies the default policy server URL.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getpropertyflags
     */
    GetPropertyFlags() {
        result := ComCall(19, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a set of flags that contain miscellaneous policy information about the certificate enrollment policy (CEP) server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-geturlflags
     */
    GetUrlFlags() {
        result := ComCall(20, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The GetAuthentication method retrieves a value that specifies the type of authentication used by the certificate enrollment policy (CEP) server to authenticate a client. This value is set by the Initialize method.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getauthentication
     */
    GetAuthentication() {
        result := ComCall(21, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The GetEnrollmentServerAuthentication method retrieves a value that specifies the type of authentication used by the certificate enrollment server (CES) to authenticate a client. This value is set by the Initialize method.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getenrollmentserverauthentication
     */
    GetEnrollmentServerAuthentication() {
        result := ComCall(22, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }
}
