#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWSManConnectionOptionsEx.ahk" { IWSManConnectionOptionsEx }

/**
 * The IWSManConnectionOptionsEx2 object is passed to the IWSMan::CreateSession method to provide the authentication mechanism, access type, and credentials to connect to a proxy server.
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nn-wsmandisp-iwsmanconnectionoptionsex2
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct IWSManConnectionOptionsEx2 extends IWSManConnectionOptionsEx {
    /**
     * The interface identifier for IWSManConnectionOptionsEx2
     * @type {Guid}
     */
    static IID := Guid("{f500c9ec-24ee-48ab-b38d-fc9a164c658e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSManConnectionOptionsEx2 interfaces
    */
    struct Vtbl extends IWSManConnectionOptionsEx.Vtbl {
        SetProxy                        : IntPtr
        ProxyIEConfig                   : IntPtr
        ProxyWinHttpConfig              : IntPtr
        ProxyAutoDetect                 : IntPtr
        ProxyNoProxyServer              : IntPtr
        ProxyAuthenticationUseNegotiate : IntPtr
        ProxyAuthenticationUseBasic     : IntPtr
        ProxyAuthenticationUseDigest    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSManConnectionOptionsEx2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the proxy information for the session.
     * @remarks
     * The default credentials are the credentials under which the current thread is operating.
     * @param {Integer} accessType Specifies the proxy access type. This parameter must be set to one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/ne-wsmandisp-wsmanproxyaccesstypeflags">WSManProxyAccessTypeFlags</a> enumeration. The default value is <b>WSManProxyWinHttpConfig</b>.
     * @param {Integer} authenticationMechanism Specifies the authentication mechanism to use for the proxy.  This parameter is optional and the default value is 0. If this parameter is set to 0, the WinRM client chooses either Kerberos or Negotiate. Otherwise, this parameter must be set to one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/ne-wsmandisp-wsmanproxyauthenticationflags">WSManProxyAuthenticationFlags</a> enumeration. The default value from the enumeration is <b>WSManFlagProxyAuthenticationUseNegotiate</b>.
     * @param {BSTR} userName Specifies the user name for proxy authentication. This parameter is optional. If a value is not specified for this parameter, the default credentials are used.
     * @param {BSTR} password Specifies the password for proxy authentication. This parameter is optional. If a value is not specified for this parameter, the default credentials are used.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-setproxy
     */
    SetProxy(accessType, authenticationMechanism, userName, password) {
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(12, this, "int", accessType, "int", authenticationMechanism, BSTR, userName, BSTR, password, "HRESULT")
        return result
    }

    /**
     * Returns the value of the proxy access type flag WSManProxyIEConfig for use in the accessType parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyieconfig
     */
    ProxyIEConfig() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy access type flag WSManProxyWinHttpConfig for use in the accessType parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxywinhttpconfig
     */
    ProxyWinHttpConfig() {
        result := ComCall(14, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy access type flag WSManProxyAutoDetect for use in the accessType parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyautodetect
     */
    ProxyAutoDetect() {
        result := ComCall(15, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy access type flag WSManProxyNoProxyServer for use in the accessType parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxynoproxyserver
     */
    ProxyNoProxyServer() {
        result := ComCall(16, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy authentication flag WSManFlagProxyAuthenticationUseNegotiate for use in the authenticationMechanism parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyauthenticationusenegotiate
     */
    ProxyAuthenticationUseNegotiate() {
        result := ComCall(17, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy authentication flag WSManFlagProxyAuthenticationUseBasic for use in the authenticationMechanism parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyauthenticationusebasic
     */
    ProxyAuthenticationUseBasic() {
        result := ComCall(18, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy authentication flag WSManFlagProxyAuthenticationUseDigest for use in the authenticationMechanism parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyauthenticationusedigest
     */
    ProxyAuthenticationUseDigest() {
        result := ComCall(19, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IWSManConnectionOptionsEx2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProxy := CallbackCreate(GetMethod(implObj, "SetProxy"), flags, 5)
        this.vtbl.ProxyIEConfig := CallbackCreate(GetMethod(implObj, "ProxyIEConfig"), flags, 2)
        this.vtbl.ProxyWinHttpConfig := CallbackCreate(GetMethod(implObj, "ProxyWinHttpConfig"), flags, 2)
        this.vtbl.ProxyAutoDetect := CallbackCreate(GetMethod(implObj, "ProxyAutoDetect"), flags, 2)
        this.vtbl.ProxyNoProxyServer := CallbackCreate(GetMethod(implObj, "ProxyNoProxyServer"), flags, 2)
        this.vtbl.ProxyAuthenticationUseNegotiate := CallbackCreate(GetMethod(implObj, "ProxyAuthenticationUseNegotiate"), flags, 2)
        this.vtbl.ProxyAuthenticationUseBasic := CallbackCreate(GetMethod(implObj, "ProxyAuthenticationUseBasic"), flags, 2)
        this.vtbl.ProxyAuthenticationUseDigest := CallbackCreate(GetMethod(implObj, "ProxyAuthenticationUseDigest"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProxy)
        CallbackFree(this.vtbl.ProxyIEConfig)
        CallbackFree(this.vtbl.ProxyWinHttpConfig)
        CallbackFree(this.vtbl.ProxyAutoDetect)
        CallbackFree(this.vtbl.ProxyNoProxyServer)
        CallbackFree(this.vtbl.ProxyAuthenticationUseNegotiate)
        CallbackFree(this.vtbl.ProxyAuthenticationUseBasic)
        CallbackFree(this.vtbl.ProxyAuthenticationUseDigest)
    }
}
