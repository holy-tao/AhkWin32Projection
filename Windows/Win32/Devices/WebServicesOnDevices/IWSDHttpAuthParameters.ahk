#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use this interface to retrieve the access token or authorization scheme used during the authentication of a client.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nn-wsdbase-iwsdhttpauthparameters
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDHttpAuthParameters extends IUnknown {
    /**
     * The interface identifier for IWSDHttpAuthParameters
     * @type {Guid}
     */
    static IID := Guid("{0b476df0-8dac-480d-b05c-99781a5884aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDHttpAuthParameters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClientAccessToken : IntPtr
        GetAuthType          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDHttpAuthParameters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * GetClientAccessToken method retrieves the client access token that can be used to either authenticate or impersonate the client.
     * @returns {HANDLE} Pointer to a variable that on return receives the token handle.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpauthparameters-getclientaccesstoken
     */
    GetClientAccessToken() {
        phToken := HANDLE.Owned()
        result := ComCall(3, this, HANDLE.Ptr, phToken, "HRESULT")
        return phToken
    }

    /**
     * GetAuthType method retrieves the HTTP authentication scheme used during the authentication of the client.
     * @returns {Integer} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_request_auth_type">HTTP_REQUEST_AUTH_TYPE</a>  value that indicates the HTTP authentication scheme used during authentication. Possible values include:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSD_SECURITY_HTTP_AUTH_SCHEME_NEGOTIATE_"></a><a id="wsd_security_http_auth_scheme_negotiate_"></a><dl>
     * <dt><b>WSD_SECURITY_HTTP_AUTH_SCHEME_NEGOTIATE </b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Negotiate authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WSD_SECURITY_HTTP_AUTH_SCHEME_NTLM"></a><a id="wsd_security_http_auth_scheme_ntlm"></a><dl>
     * <dt><b>WSD_SECURITY_HTTP_AUTH_SCHEME_NTLM</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NTLM authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdhttpauthparameters-getauthtype
     */
    GetAuthType() {
        result := ComCall(4, this, "uint*", &pAuthType := 0, "HRESULT")
        return pAuthType
    }

    Query(iid) {
        if (IWSDHttpAuthParameters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClientAccessToken := CallbackCreate(GetMethod(implObj, "GetClientAccessToken"), flags, 2)
        this.vtbl.GetAuthType := CallbackCreate(GetMethod(implObj, "GetAuthType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClientAccessToken)
        CallbackFree(this.vtbl.GetAuthType)
    }
}
