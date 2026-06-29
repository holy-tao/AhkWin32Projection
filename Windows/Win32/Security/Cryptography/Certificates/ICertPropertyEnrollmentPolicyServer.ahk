#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EnrollmentPolicyServerPropertyFlags.ahk" { EnrollmentPolicyServerPropertyFlags }
#Import ".\PolicyServerUrlFlags.ahk" { PolicyServerUrlFlags }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\X509EnrollmentAuthFlags.ahk" { X509EnrollmentAuthFlags }
#Import ".\ICertProperty.ahk" { ICertProperty }

/**
 * Represents an external certificate property that contains information about a certificate enrollment policy (CEP) server and a certificate enrollment server (CES).
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertpropertyenrollmentpolicyserver
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertPropertyEnrollmentPolicyServer extends ICertProperty {
    /**
     * The interface identifier for ICertPropertyEnrollmentPolicyServer
     * @type {Guid}
     */
    static IID := Guid("{728ab34a-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertPropertyEnrollmentPolicyServer interfaces
    */
    struct Vtbl extends ICertProperty.Vtbl {
        Initialize                        : IntPtr
        GetPolicyServerUrl                : IntPtr
        GetPolicyServerId                 : IntPtr
        GetEnrollmentServerUrl            : IntPtr
        GetRequestIdString                : IntPtr
        GetPropertyFlags                  : IntPtr
        GetUrlFlags                       : IntPtr
        GetAuthentication                 : IntPtr
        GetEnrollmentServerAuthentication : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertPropertyEnrollmentPolicyServer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes an ICertPropertyEnrollmentPolicyServer object.
     * @param {EnrollmentPolicyServerPropertyFlags} PropertyFlags 
     * @param {X509EnrollmentAuthFlags} AuthFlags 
     * @param {X509EnrollmentAuthFlags} EnrollmentServerAuthFlags An <a href="https://docs.microsoft.com/windows/desktop/api/certcli/ne-certcli-x509enrollmentauthflags">X509EnrollmentAuthFlags</a> enumeration value that specifies the authentication type used by the client to authenticate itself to the CES. See the <i>AuthFlags</i> parameter for the possible values of the enumeration type. For Windows 7, only <b>X509AuthCertificate</b> can be specified.
     * @param {PolicyServerUrlFlags} UrlFlags 
     * @param {BSTR} strRequestId A <b>BSTR</b> variable that contains a unique string identifier for the certificate request to be sent to the certification authority during enrollment. The string can contain any information that uniquely identifies the request.
     * @param {BSTR} strUrl A <b>BSTR</b> variable that contains the URL for the certificate enrollment policy (CEP) server.
     * @param {BSTR} strId A <b>BSTR</b> variable that contains the ID of the CEP server.
     * @param {BSTR} strEnrollmentServerUrl A <b>BSTR</b> variable that contains the URL for the certificate enrollment server.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-initialize
     */
    Initialize(PropertyFlags, AuthFlags, EnrollmentServerAuthFlags, UrlFlags, strRequestId, strUrl, strId, strEnrollmentServerUrl) {
        strRequestId := strRequestId is String ? BSTR.Alloc(strRequestId).Value : strRequestId
        strUrl := strUrl is String ? BSTR.Alloc(strUrl).Value : strUrl
        strId := strId is String ? BSTR.Alloc(strId).Value : strId
        strEnrollmentServerUrl := strEnrollmentServerUrl is String ? BSTR.Alloc(strEnrollmentServerUrl).Value : strEnrollmentServerUrl

        result := ComCall(14, this, EnrollmentPolicyServerPropertyFlags, PropertyFlags, X509EnrollmentAuthFlags, AuthFlags, X509EnrollmentAuthFlags, EnrollmentServerAuthFlags, PolicyServerUrlFlags, UrlFlags, BSTR, strRequestId, BSTR, strUrl, BSTR, strId, BSTR, strEnrollmentServerUrl, "HRESULT")
        return result
    }

    /**
     * Retrieves a string that contains the URL for the certificate enrollment policy (CEP) server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the URL.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getpolicyserverurl
     */
    GetPolicyServerUrl() {
        pValue := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a string that uniquely identifies the certificate enrollment policy (CEP) server.
     * @remarks
     * The ID can be any string. It is set by the administrator who installs the CEP server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the ID string.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getpolicyserverid
     */
    GetPolicyServerId() {
        pValue := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a string that contains the URL for the certificate enrollment server.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the URL.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getenrollmentserverurl
     */
    GetEnrollmentServerUrl() {
        pValue := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a unique string identifier for the certificate request sent to the certification authority during enrollment.
     * @remarks
     * The string can contain any information that uniquely identifies the certificate request.  This value is set when you call  the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-initialize">Initialize</a> method.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the ID string.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getrequestidstring
     */
    GetRequestIdString() {
        pValue := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value that specifies the default policy server URL.
     * @returns {EnrollmentPolicyServerPropertyFlags} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getpropertyflags
     */
    GetPropertyFlags() {
        result := ComCall(19, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a set of flags that contain miscellaneous policy information about the certificate enrollment policy (CEP) server.
     * @returns {PolicyServerUrlFlags} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-geturlflags
     */
    GetUrlFlags() {
        result := ComCall(20, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The GetAuthentication method retrieves a value that specifies the type of authentication used by the certificate enrollment policy (CEP) server to authenticate a client. This value is set by the Initialize method.
     * @returns {X509EnrollmentAuthFlags} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getauthentication
     */
    GetAuthentication() {
        result := ComCall(21, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The GetEnrollmentServerAuthentication method retrieves a value that specifies the type of authentication used by the certificate enrollment server (CES) to authenticate a client. This value is set by the Initialize method.
     * @returns {X509EnrollmentAuthFlags} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertpropertyenrollmentpolicyserver-getenrollmentserverauthentication
     */
    GetEnrollmentServerAuthentication() {
        result := ComCall(22, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (ICertPropertyEnrollmentPolicyServer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 9)
        this.vtbl.GetPolicyServerUrl := CallbackCreate(GetMethod(implObj, "GetPolicyServerUrl"), flags, 2)
        this.vtbl.GetPolicyServerId := CallbackCreate(GetMethod(implObj, "GetPolicyServerId"), flags, 2)
        this.vtbl.GetEnrollmentServerUrl := CallbackCreate(GetMethod(implObj, "GetEnrollmentServerUrl"), flags, 2)
        this.vtbl.GetRequestIdString := CallbackCreate(GetMethod(implObj, "GetRequestIdString"), flags, 2)
        this.vtbl.GetPropertyFlags := CallbackCreate(GetMethod(implObj, "GetPropertyFlags"), flags, 2)
        this.vtbl.GetUrlFlags := CallbackCreate(GetMethod(implObj, "GetUrlFlags"), flags, 2)
        this.vtbl.GetAuthentication := CallbackCreate(GetMethod(implObj, "GetAuthentication"), flags, 2)
        this.vtbl.GetEnrollmentServerAuthentication := CallbackCreate(GetMethod(implObj, "GetEnrollmentServerAuthentication"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetPolicyServerUrl)
        CallbackFree(this.vtbl.GetPolicyServerId)
        CallbackFree(this.vtbl.GetEnrollmentServerUrl)
        CallbackFree(this.vtbl.GetRequestIdString)
        CallbackFree(this.vtbl.GetPropertyFlags)
        CallbackFree(this.vtbl.GetUrlFlags)
        CallbackFree(this.vtbl.GetAuthentication)
        CallbackFree(this.vtbl.GetEnrollmentServerAuthentication)
    }
}
