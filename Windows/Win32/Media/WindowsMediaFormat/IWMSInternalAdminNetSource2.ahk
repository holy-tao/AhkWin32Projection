#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMSInternalAdminNetSource2 interface provides improved methods for password caching.
 * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMSInternalAdminNetSource2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMSInternalAdminNetSource2
     * @type {Guid}
     */
    static IID => Guid("{e74d58c3-cf77-4b51-af17-744687c43eae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCredentialsEx", "GetCredentialsEx", "DeleteCredentialsEx", "FindProxyForURLEx"]

    /**
     * The SetCredentialsEx method adds a password to the cache.
     * @param {BSTR} bstrRealm String containing the realm name. Realm names are supplied by servers to distinguish different levels of access to their files. Not all servers have realm names, in which case the DNS name should be used.
     * 
     * If <i>fProxy</i> is False, this realm refers to the host server. If <i>fProxy</i> is True, this realm refers to the proxy server.
     * @param {BSTR} bstrUrl String containing the URL to which the credentials apply.
     * @param {BOOL} fProxy Boolean value that is True if the password applies when using a proxy server to access the site specified by <i>bstrUrl</i>.
     * @param {BSTR} bstrName String containing the user name.
     * @param {BSTR} bstrPassword String containing the password.
     * @param {BOOL} fPersist Boolean value that is True if these credentials should be permanently saved. If you set this to False, the credentials will only be persisted for the current session.
     * @param {BOOL} fConfirmedGood Boolean value that is True if the server has confirmed the password as correct. You can cache the password before receiving verification from the server, in which case you should set this to False.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource2-setcredentialsex
     */
    SetCredentialsEx(bstrRealm, bstrUrl, fProxy, bstrName, bstrPassword, fPersist, fConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(3, this, "ptr", bstrRealm, "ptr", bstrUrl, "int", fProxy, "ptr", bstrName, "ptr", bstrPassword, "int", fPersist, "int", fConfirmedGood, "HRESULT")
        return result
    }

    /**
     * The GetCredentialsEx method retrieves a cached password.
     * @param {BSTR} bstrRealm String containing the realm name. Realm names are supplied by servers to distinguish different levels of access to their files. Not all servers have realm names, in which case the DNS name is used.
     * 
     * If <i>fProxy</i> is False, this realm refers to the host server. If <i>fProxy</i> is True, this realm refers to the proxy server.
     * @param {BSTR} bstrUrl String containing the URL to which the credentials apply.
     * @param {BOOL} fProxy Boolean value that is True if the password applies when using a proxy server to access the site specified by <i>bstrUrl</i>.
     * @param {Pointer<Integer>} pdwUrlPolicy Pointer to a <b>DWORD</b> containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsinternaladminnetsource/ne-wmsinternaladminnetsource-netsource_urlcredpolicy_settings">NETSOURCE_URLCREDPOLICY_SETTINGS</a> enumeration type. This value is based on the user's network security settings and determines whether your application can automatically log in to sites for the user if you have credentials cached.
     * @param {Pointer<BSTR>} pbstrName Pointer to a string containing the user name.
     * @param {Pointer<BSTR>} pbstrPassword Pointer to a string containing the password.
     * @param {Pointer<BOOL>} pfConfirmedGood Boolean value that is True if the password was cached after it was confirmed as correct by the server.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource2-getcredentialsex
     */
    GetCredentialsEx(bstrRealm, bstrUrl, fProxy, pdwUrlPolicy, pbstrName, pbstrPassword, pfConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        pdwUrlPolicyMarshal := pdwUrlPolicy is VarRef ? "int*" : "ptr"
        pfConfirmedGoodMarshal := pfConfirmedGood is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", bstrRealm, "ptr", bstrUrl, "int", fProxy, pdwUrlPolicyMarshal, pdwUrlPolicy, "ptr", pbstrName, "ptr", pbstrPassword, pfConfirmedGoodMarshal, pfConfirmedGood, "HRESULT")
        return result
    }

    /**
     * The DeleteCredentialsEx method removes a password from the cache.
     * @param {BSTR} bstrRealm String containing the realm name. Realm names are supplied by servers to distinguish different levels of access to their files. Not all servers will have realm names, in which case the DNS name is used.
     * @param {BSTR} bstrUrl String containing the URL to which the credentials apply.
     * @param {BOOL} fProxy Boolean value that is True if the password applies when using a proxy server to access the site specified by <i>bstrUrl</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource2-deletecredentialsex
     */
    DeleteCredentialsEx(bstrRealm, bstrUrl, fProxy) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(5, this, "ptr", bstrRealm, "ptr", bstrUrl, "int", fProxy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {BSTR} bstrHost 
     * @param {BSTR} bstrUrl 
     * @param {Pointer<BOOL>} pfProxyEnabled 
     * @param {Pointer<BSTR>} pbstrProxyServer 
     * @param {Pointer<Integer>} pdwProxyPort 
     * @param {Pointer<Integer>} pdwProxyContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource2
     */
    FindProxyForURLEx(bstrProtocol, bstrHost, bstrUrl, pfProxyEnabled, pbstrProxyServer, pdwProxyPort, pdwProxyContext) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrHost := bstrHost is String ? BSTR.Alloc(bstrHost).Value : bstrHost
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        pfProxyEnabledMarshal := pfProxyEnabled is VarRef ? "int*" : "ptr"
        pdwProxyPortMarshal := pdwProxyPort is VarRef ? "uint*" : "ptr"
        pdwProxyContextMarshal := pdwProxyContext is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", bstrProtocol, "ptr", bstrHost, "ptr", bstrUrl, pfProxyEnabledMarshal, pfProxyEnabled, "ptr", pbstrProxyServer, pdwProxyPortMarshal, pdwProxyPort, pdwProxyContextMarshal, pdwProxyContext, "HRESULT")
        return result
    }
}
