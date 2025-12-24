#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INSNetSourceCreator.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMSInternalAdminNetSource interface manages cached passwords and finds proxy servers.To obtain a pointer to an instance of this interface, call the QueryInterface method of the IDispatch interface retrieved by INSNetSourceCreator::GetNetSourceAdminInterface.
 * @remarks
 * 
 * Most of the methods of the <b>IWMSInternalAdminNetSource</b> interface have been updated in <a href="https://docs.microsoft.com/windows/desktop/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource2">IWMSInternalAdminNetSource2</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource3">IWMSInternalAdminNetSource3</a>. If you are developing an application using a version of the Windows Media Format SDK that supports the later interfaces, you should use them.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSInternalAdminNetSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMSInternalAdminNetSource
     * @type {Guid}
     */
    static IID => Guid("{8bb23e5f-d127-4afb-8d02-ae5b66d54c78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetNetSourceCreator", "SetCredentials", "GetCredentials", "DeleteCredentials", "GetCredentialFlags", "SetCredentialFlags", "FindProxyForURL", "RegisterProxyFailure", "ShutdownProxyContext", "IsUsingIE"]

    /**
     * 
     * @param {IUnknown} pSharedNamespace 
     * @param {IUnknown} pNamespaceNode 
     * @param {INSNetSourceCreator} pNetSourceCreator 
     * @param {BOOL} fEmbeddedInServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource
     */
    Initialize(pSharedNamespace, pNamespaceNode, pNetSourceCreator, fEmbeddedInServer) {
        result := ComCall(3, this, "ptr", pSharedNamespace, "ptr", pNamespaceNode, "ptr", pNetSourceCreator, "int", fEmbeddedInServer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {INSNetSourceCreator} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource
     */
    GetNetSourceCreator() {
        result := ComCall(4, this, "ptr*", &ppNetSourceCreator := 0, "HRESULT")
        return INSNetSourceCreator(ppNetSourceCreator)
    }

    /**
     * The SetCredentials method adds a password to the cache.
     * @param {BSTR} bstrRealm String containing the realm name. Realm names are supplied by servers to distinguish different levels of access to their files. Not all servers have realm names, in which case the DNS name should be used.
     * @param {BSTR} bstrName String containing the user name.
     * @param {BSTR} bstrPassword String containing the password.
     * @param {BOOL} fPersist Boolean value that is True if these credentials should be permanently saved. If you set this to False, the credentials will be saved only for the current session.
     * @param {BOOL} fConfirmedGood Boolean value that is True if the server has confirmed the password as correct. You can cache the password before receiving verification from the server, in which case you should set this to False.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-setcredentials
     */
    SetCredentials(bstrRealm, bstrName, bstrPassword, fPersist, fConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(5, this, "ptr", bstrRealm, "ptr", bstrName, "ptr", bstrPassword, "int", fPersist, "int", fConfirmedGood, "HRESULT")
        return result
    }

    /**
     * The GetCredentials method retrieves a cached password.
     * @param {BSTR} bstrRealm String containing the realm name. Realm names are supplied by servers to distinguish different levels of access to their files. Not all servers have realm names, in which case the DNS name is used.
     * @param {Pointer<BSTR>} pbstrName Pointer to a string containing the user name.
     * @param {Pointer<BSTR>} pbstrPassword Pointer to a string containing the password.
     * @param {Pointer<BOOL>} pfConfirmedGood Pointer to a Boolean value that is set to True if the password was cached after it was confirmed as correct by the server.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-getcredentials
     */
    GetCredentials(bstrRealm, pbstrName, pbstrPassword, pfConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm

        pfConfirmedGoodMarshal := pfConfirmedGood is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", bstrRealm, "ptr", pbstrName, "ptr", pbstrPassword, pfConfirmedGoodMarshal, pfConfirmedGood, "HRESULT")
        return result
    }

    /**
     * The DeleteCredentials method removes a password from the cache.
     * @param {BSTR} bstrRealm String containing the realm name. Realm names are supplied by servers to distinguish different levels of access to their files. Not all servers will have realm names, in which case the DNS name is used.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-deletecredentials
     */
    DeleteCredentials(bstrRealm) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm

        result := ComCall(7, this, "ptr", bstrRealm, "HRESULT")
        return result
    }

    /**
     * The GetCredentialFlags method can be used in conjunction with IWMSInternalAdminNetSource::SetCredentialFlags to determine whether the user wants passwords saved as a default behavior. This method retrieves any flags previously set.
     * @returns {Integer} <b>DWORD</b> containing credential flags. At this time, the only supported flag is 0x1, which signifies that the user has stated a preference that passwords should be saved automatically.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-getcredentialflags
     */
    GetCredentialFlags() {
        result := ComCall(8, this, "uint*", &lpdwFlags := 0, "HRESULT")
        return lpdwFlags
    }

    /**
     * The SetCredentialFlags method is used to set the user preference for automatic password caching.
     * @param {Integer} dwFlags <b>DWORD</b> containing the credential flags. At this time, the only supported flag is 0x1, which signifies that the user has stated a preference that passwords should be saved automatically.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-setcredentialflags
     */
    SetCredentialFlags(dwFlags) {
        result := ComCall(9, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The FindProxyForURL method finds a proxy server name and port to use for the client.
     * @param {BSTR} bstrProtocol String containing the protocol for which to find the proxy server. Typically, this is either "http" or "mms".
     * @param {BSTR} bstrHost String containing the DNS name or IP address of the server with which you want to communicate. Depending upon the server, the proxy might be different.
     * @param {Pointer<BOOL>} pfProxyEnabled Pointer to a Boolean value that is True if the user has enabled a proxy that applies to the specified protocol and host.
     * @param {Pointer<BSTR>} pbstrProxyServer Pointer to a string containing the proxy server DNS name.
     * @param {Pointer<Integer>} pdwProxyPort Pointer to a <b>DWORD</b> containing the proxy port number.
     * @param {Pointer<Integer>} pdwProxyContext <b>DWORD</b> representing the proxy server returned. You can make multiple calls to <b>FindProxyForURL</b> to find all configured proxy servers. On your first call, set the context to zero. When the call returns, the context is set to a value representing the proxy for which information was returned. On the next call, set the context to the context value retrieved on the first call. Continue this process until the call returns S_FALSE.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-findproxyforurl
     */
    FindProxyForURL(bstrProtocol, bstrHost, pfProxyEnabled, pbstrProxyServer, pdwProxyPort, pdwProxyContext) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrHost := bstrHost is String ? BSTR.Alloc(bstrHost).Value : bstrHost

        pfProxyEnabledMarshal := pfProxyEnabled is VarRef ? "int*" : "ptr"
        pdwProxyPortMarshal := pdwProxyPort is VarRef ? "uint*" : "ptr"
        pdwProxyContextMarshal := pdwProxyContext is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", bstrProtocol, "ptr", bstrHost, pfProxyEnabledMarshal, pfProxyEnabled, "ptr", pbstrProxyServer, pdwProxyPortMarshal, pdwProxyPort, pdwProxyContextMarshal, pdwProxyContext, "HRESULT")
        return result
    }

    /**
     * Registers a proxy failure.
     * @param {HRESULT} hrParam The <b>HRESULT</b> code of  the failure.
     * @param {Integer} dwProxyContext Represents the proxy server.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-registerproxyfailure
     */
    RegisterProxyFailure(hrParam, dwProxyContext) {
        result := ComCall(11, this, "int", hrParam, "uint", dwProxyContext, "HRESULT")
        return result
    }

    /**
     * The ShutdownProxyContext method releases the internal resources used by IWMSInternalAdminNetSource::FindProxyForURL. To avoid memory leaks, you must call this method after you are finished making calls to FindProxyForURL.
     * @param {Integer} dwProxyContext <b>DWORD</b> containing the proxy context. Set this to the last proxy context received from <b>FindProxyForURL</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-shutdownproxycontext
     */
    ShutdownProxyContext(dwProxyContext) {
        result := ComCall(12, this, "uint", dwProxyContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProxyContext 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource
     */
    IsUsingIE(dwProxyContext) {
        result := ComCall(13, this, "uint", dwProxyContext, "int*", &pfIsUsingIE := 0, "HRESULT")
        return pfIsUsingIE
    }
}
