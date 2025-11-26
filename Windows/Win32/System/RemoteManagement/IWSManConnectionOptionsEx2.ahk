#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWSManConnectionOptionsEx.ahk

/**
 * The IWSManConnectionOptionsEx2 object is passed to the IWSMan::CreateSession method to provide the authentication mechanism, access type, and credentials to connect to a proxy server.
 * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nn-wsmandisp-iwsmanconnectionoptionsex2
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class IWSManConnectionOptionsEx2 extends IWSManConnectionOptionsEx{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSManConnectionOptionsEx2
     * @type {Guid}
     */
    static IID => Guid("{f500c9ec-24ee-48ab-b38d-fc9a164c658e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProxy", "ProxyIEConfig", "ProxyWinHttpConfig", "ProxyAutoDetect", "ProxyNoProxyServer", "ProxyAuthenticationUseNegotiate", "ProxyAuthenticationUseBasic", "ProxyAuthenticationUseDigest"]

    /**
     * Sets the proxy information for the session.
     * @param {Integer} accessType Specifies the proxy access type. This parameter must be set to one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/ne-wsmandisp-wsmanproxyaccesstypeflags">WSManProxyAccessTypeFlags</a> enumeration. The default value is <b>WSManProxyWinHttpConfig</b>.
     * @param {Integer} authenticationMechanism Specifies the authentication mechanism to use for the proxy.  This parameter is optional and the default value is 0. If this parameter is set to 0, the WinRM client chooses either Kerberos or Negotiate. Otherwise, this parameter must be set to one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/ne-wsmandisp-wsmanproxyauthenticationflags">WSManProxyAuthenticationFlags</a> enumeration. The default value from the enumeration is <b>WSManFlagProxyAuthenticationUseNegotiate</b>.
     * @param {BSTR} userName Specifies the user name for proxy authentication. This parameter is optional. If a value is not specified for this parameter, the default credentials are used.
     * @param {BSTR} password Specifies the password for proxy authentication. This parameter is optional. If a value is not specified for this parameter, the default credentials are used.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-setproxy
     */
    SetProxy(accessType, authenticationMechanism, userName, password) {
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(12, this, "int", accessType, "int", authenticationMechanism, "ptr", userName, "ptr", password, "HRESULT")
        return result
    }

    /**
     * Returns the value of the proxy access type flag WSManProxyIEConfig for use in the accessType parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyieconfig
     */
    ProxyIEConfig() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy access type flag WSManProxyWinHttpConfig for use in the accessType parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxywinhttpconfig
     */
    ProxyWinHttpConfig() {
        result := ComCall(14, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy access type flag WSManProxyAutoDetect for use in the accessType parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyautodetect
     */
    ProxyAutoDetect() {
        result := ComCall(15, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy access type flag WSManProxyNoProxyServer for use in the accessType parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxynoproxyserver
     */
    ProxyNoProxyServer() {
        result := ComCall(16, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy authentication flag WSManFlagProxyAuthenticationUseNegotiate for use in the authenticationMechanism parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyauthenticationusenegotiate
     */
    ProxyAuthenticationUseNegotiate() {
        result := ComCall(17, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy authentication flag WSManFlagProxyAuthenticationUseBasic for use in the authenticationMechanism parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyauthenticationusebasic
     */
    ProxyAuthenticationUseBasic() {
        result := ComCall(18, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Returns the value of the proxy authentication flag WSManFlagProxyAuthenticationUseDigest for use in the authenticationMechanism parameter of the IWSManConnectionOptionsEx2::SetProxy method.
     * @returns {Integer} Specifies the value of the constant.
     * @see https://docs.microsoft.com/windows/win32/api//wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex2-proxyauthenticationusedigest
     */
    ProxyAuthenticationUseDigest() {
        result := ComCall(19, this, "int*", &value := 0, "HRESULT")
        return value
    }
}
