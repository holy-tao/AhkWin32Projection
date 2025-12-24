#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IWMSInternalAdminNetSource2.ahk

/**
 * The IWMSInternalAdminNetSource3 interface provides improved methods to find proxy servers.To obtain a pointer to an instance of this interface, call the QueryInterface method of the IDispatch method retrieved by INSNetSourceCreator::GetNetSourceAdminInterface.
 * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSInternalAdminNetSource3 extends IWMSInternalAdminNetSource2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMSInternalAdminNetSource3
     * @type {Guid}
     */
    static IID => Guid("{6b63d08e-4590-44af-9eb3-57ff1e73bf80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNetSourceCreator2", "FindProxyForURLEx2", "RegisterProxyFailure2", "ShutdownProxyContext2", "IsUsingIE2", "SetCredentialsEx2", "GetCredentialsEx2"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource3
     */
    GetNetSourceCreator2() {
        result := ComCall(7, this, "ptr*", &ppNetSourceCreator := 0, "HRESULT")
        return IUnknown(ppNetSourceCreator)
    }

    /**
     * The FindProxyForURLEx2 method finds a proxy server name and port to use for the user.
     * @param {BSTR} bstrProtocol String containing the protocol for which to find the proxy server. Typically, this is either "http" or "mms".
     * @param {BSTR} bstrHost String containing the DNS name, or IP address, of the server with which you want to communicate. Depending upon the server, the proxy might be different.
     * @param {BSTR} bstrUrl String containing the full URL of the site to which you want to connect.
     * @param {Pointer<BOOL>} pfProxyEnabled Pointer to a Boolean value that is set to True if the user has enabled a proxy that applies to the specified protocol, host, and site.
     * @param {Pointer<BSTR>} pbstrProxyServer Pointer to a string containing the proxy server DNS name.
     * @param {Pointer<Integer>} pdwProxyPort Pointer to a <b>DWORD</b> containing the proxy port number.
     * @param {Pointer<Integer>} pqwProxyContext <b>QWORD</b> representing the proxy server returned. You can make multiple calls to <b>FindProxyForURL</b> to find all configured proxy servers. On your first call, set the context to zero. When the call returns, the context is set to a value representing the proxy for which information was returned. On the next call, set the context to the context value retrieved on the first call. Continue this process until the call returns S_FALSE.
     * 
     * This method has internal algorithms that determine how it looks for proxy servers. You can override this and make it find the proxy server set by the client's Web browser, by setting the context to 3.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When calling this method multiple times to find all proxies configured, this value is returned when there are no more configured proxy servers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource3-findproxyforurlex2
     */
    FindProxyForURLEx2(bstrProtocol, bstrHost, bstrUrl, pfProxyEnabled, pbstrProxyServer, pdwProxyPort, pqwProxyContext) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrHost := bstrHost is String ? BSTR.Alloc(bstrHost).Value : bstrHost
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        pfProxyEnabledMarshal := pfProxyEnabled is VarRef ? "int*" : "ptr"
        pdwProxyPortMarshal := pdwProxyPort is VarRef ? "uint*" : "ptr"
        pqwProxyContextMarshal := pqwProxyContext is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", bstrProtocol, "ptr", bstrHost, "ptr", bstrUrl, pfProxyEnabledMarshal, pfProxyEnabled, "ptr", pbstrProxyServer, pdwProxyPortMarshal, pdwProxyPort, pqwProxyContextMarshal, pqwProxyContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrParam 
     * @param {Integer} qwProxyContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource3
     */
    RegisterProxyFailure2(hrParam, qwProxyContext) {
        result := ComCall(9, this, "int", hrParam, "uint", qwProxyContext, "HRESULT")
        return result
    }

    /**
     * The ShutdownProxyContext2 method releases the internal resources used by IWMSInternalAdminNetSource3::FindProxyForURLEx2. To avoid memory leaks, you must call this method after you are finished making calls to FindProxyForURLEx2.
     * @param {Integer} qwProxyContext <b>QWORD</b> containing the proxy context. Set this to the last proxy context received from <b>FindProxyForURLEx2</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource3-shutdownproxycontext2
     */
    ShutdownProxyContext2(qwProxyContext) {
        result := ComCall(10, this, "uint", qwProxyContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} qwProxyContext 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource3
     */
    IsUsingIE2(qwProxyContext) {
        result := ComCall(11, this, "uint", qwProxyContext, "int*", &pfIsUsingIE := 0, "HRESULT")
        return pfIsUsingIE
    }

    /**
     * The SetCredentialsEx2 method adds a password to the cache. This improved version of IWMSInternalAdminNetSource2::SetCredentialsEx adds a flag (fClearTextAuthentication) that indicates whether credentials were sent in unencrypted form over the network.
     * @param {BSTR} bstrRealm String containing the realm name. Realm names are supplied by servers to distinguish different levels of access to their files. Not all servers have realm names, in which case the DNS name should be used.
     * 
     * If <i>fProxy</i> is False, this realm refers to the host server. If <i>fProxy</i> is True, this realm refers to the proxy server.
     * @param {BSTR} bstrUrl String containing the URL to which the credentials apply.
     * @param {BOOL} fProxy Boolean value that is True if the password applies when using a proxy server to access the site specified by <i>bstrUrl</i>.
     * @param {BSTR} bstrName String containing the user name.
     * @param {BSTR} bstrPassword String containing the password.
     * @param {BOOL} fPersist Boolean value that is True if these credentials should be permanently saved. If you set this to False, the credentials will only be persisted for the current session.
     * @param {BOOL} fConfirmedGood Boolean value that is True if the server has confirmed the password as correct. You can cache the password before receiving verification from the server, in which case you should set this to False.
     * @param {BOOL} fClearTextAuthentication Boolean value that is True if the credentials were obtained using an authentication scheme where credentials are sent over the network in an unencrypted form (such as HTTP Basic authentication).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource3-setcredentialsex2
     */
    SetCredentialsEx2(bstrRealm, bstrUrl, fProxy, bstrName, bstrPassword, fPersist, fConfirmedGood, fClearTextAuthentication) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(12, this, "ptr", bstrRealm, "ptr", bstrUrl, "int", fProxy, "ptr", bstrName, "ptr", bstrPassword, "int", fPersist, "int", fConfirmedGood, "int", fClearTextAuthentication, "HRESULT")
        return result
    }

    /**
     * The GetCredentialsEx2 method retrieves a cached password. This improved version of IWMSInternalAdminNetSource2::GetCredentialsEx adds a flag (fClearTextAuthentication) that indicates whether credentials were sent in unencrypted form over the network.
     * @param {BSTR} bstrRealm String containing the realm name. Realm names are supplied by servers to distinguish different levels of access to their files. Not all servers have realm names, in which case the DNS name is used.
     * 
     * If <i>fProxy</i> is False, this realm refers to the host server. If <i>fProxy</i> is True, this realm refers to the proxy server.
     * @param {BSTR} bstrUrl String containing the URL to which the credentials apply.
     * @param {BOOL} fProxy Boolean value that is True if the password applies when using a proxy server to access the site specified by <i>bstrUrl</i>.
     * @param {BOOL} fClearTextAuthentication Boolean value that is True if the cached credentials were previously sent over the network in an unencrypted form.
     * @param {Pointer<Integer>} pdwUrlPolicy Pointer to a <b>DWORD</b> containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsinternaladminnetsource/ne-wmsinternaladminnetsource-netsource_urlcredpolicy_settings">NETSOURCE_URLCREDPOLICY_SETTINGS</a> enumeration type. This value is based on the user's network security settings and determines whether your application can automatically log in to sites for the user if you have credentials cached.
     * @param {Pointer<BSTR>} pbstrName Pointer to a string containing the user name.
     * @param {Pointer<BSTR>} pbstrPassword Pointer to a string containing the password.
     * @param {Pointer<BOOL>} pfConfirmedGood Boolean value that is True if the password was cached after it was confirmed as correct by the server.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource3-getcredentialsex2
     */
    GetCredentialsEx2(bstrRealm, bstrUrl, fProxy, fClearTextAuthentication, pdwUrlPolicy, pbstrName, pbstrPassword, pfConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        pdwUrlPolicyMarshal := pdwUrlPolicy is VarRef ? "int*" : "ptr"
        pfConfirmedGoodMarshal := pfConfirmedGood is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "ptr", bstrRealm, "ptr", bstrUrl, "int", fProxy, "int", fClearTextAuthentication, pdwUrlPolicyMarshal, pdwUrlPolicy, "ptr", pbstrName, "ptr", pbstrPassword, pfConfirmedGoodMarshal, pfConfirmedGood, "HRESULT")
        return result
    }
}
