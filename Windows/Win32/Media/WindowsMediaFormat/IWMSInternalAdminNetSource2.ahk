#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\NETSOURCE_URLCREDPOLICY_SETTINGS.ahk" { NETSOURCE_URLCREDPOLICY_SETTINGS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMSInternalAdminNetSource2 interface provides improved methods for password caching.
 * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMSInternalAdminNetSource2 extends IUnknown {
    /**
     * The interface identifier for IWMSInternalAdminNetSource2
     * @type {Guid}
     */
    static IID := Guid("{e74d58c3-cf77-4b51-af17-744687c43eae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMSInternalAdminNetSource2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCredentialsEx    : IntPtr
        GetCredentialsEx    : IntPtr
        DeleteCredentialsEx : IntPtr
        FindProxyForURLEx   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMSInternalAdminNetSource2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource2-setcredentialsex
     */
    SetCredentialsEx(bstrRealm, bstrUrl, fProxy, bstrName, bstrPassword, fPersist, fConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(3, this, BSTR, bstrRealm, BSTR, bstrUrl, BOOL, fProxy, BSTR, bstrName, BSTR, bstrPassword, BOOL, fPersist, BOOL, fConfirmedGood, "HRESULT")
        return result
    }

    /**
     * The GetCredentialsEx method retrieves a cached password.
     * @param {BSTR} bstrRealm String containing the realm name. Realm names are supplied by servers to distinguish different levels of access to their files. Not all servers have realm names, in which case the DNS name is used.
     * 
     * If <i>fProxy</i> is False, this realm refers to the host server. If <i>fProxy</i> is True, this realm refers to the proxy server.
     * @param {BSTR} bstrUrl String containing the URL to which the credentials apply.
     * @param {BOOL} fProxy Boolean value that is True if the password applies when using a proxy server to access the site specified by <i>bstrUrl</i>.
     * @param {Pointer<NETSOURCE_URLCREDPOLICY_SETTINGS>} pdwUrlPolicy Pointer to a <b>DWORD</b> containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsinternaladminnetsource/ne-wmsinternaladminnetsource-netsource_urlcredpolicy_settings">NETSOURCE_URLCREDPOLICY_SETTINGS</a> enumeration type. This value is based on the user's network security settings and determines whether your application can automatically log in to sites for the user if you have credentials cached.
     * @param {Pointer<BSTR>} pbstrName Pointer to a string containing the user name.
     * @param {Pointer<BSTR>} pbstrPassword Pointer to a string containing the password.
     * @param {Pointer<BOOL>} pfConfirmedGood Boolean value that is True if the password was cached after it was confirmed as correct by the server.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource2-getcredentialsex
     */
    GetCredentialsEx(bstrRealm, bstrUrl, fProxy, pdwUrlPolicy, pbstrName, pbstrPassword, pfConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        pdwUrlPolicyMarshal := pdwUrlPolicy is VarRef ? "int*" : "ptr"
        pfConfirmedGoodMarshal := pfConfirmedGood is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, BSTR, bstrRealm, BSTR, bstrUrl, BOOL, fProxy, pdwUrlPolicyMarshal, pdwUrlPolicy, BSTR.Ptr, pbstrName, BSTR.Ptr, pbstrPassword, pfConfirmedGoodMarshal, pfConfirmedGood, "HRESULT")
        return result
    }

    /**
     * The DeleteCredentialsEx method removes a password from the cache.
     * @param {BSTR} bstrRealm String containing the realm name. Realm names are supplied by servers to distinguish different levels of access to their files. Not all servers will have realm names, in which case the DNS name is used.
     * @param {BSTR} bstrUrl String containing the URL to which the credentials apply.
     * @param {BOOL} fProxy Boolean value that is True if the password applies when using a proxy server to access the site specified by <i>bstrUrl</i>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource2-deletecredentialsex
     */
    DeleteCredentialsEx(bstrRealm, bstrUrl, fProxy) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(5, this, BSTR, bstrRealm, BSTR, bstrUrl, BOOL, fProxy, "HRESULT")
        return result
    }

    /**
     * The IWMSInternalAdminNetSource2 interface provides improved methods for password caching.
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

        result := ComCall(6, this, BSTR, bstrProtocol, BSTR, bstrHost, BSTR, bstrUrl, pfProxyEnabledMarshal, pfProxyEnabled, BSTR.Ptr, pbstrProxyServer, pdwProxyPortMarshal, pdwProxyPort, pdwProxyContextMarshal, pdwProxyContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMSInternalAdminNetSource2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCredentialsEx := CallbackCreate(GetMethod(implObj, "SetCredentialsEx"), flags, 8)
        this.vtbl.GetCredentialsEx := CallbackCreate(GetMethod(implObj, "GetCredentialsEx"), flags, 8)
        this.vtbl.DeleteCredentialsEx := CallbackCreate(GetMethod(implObj, "DeleteCredentialsEx"), flags, 4)
        this.vtbl.FindProxyForURLEx := CallbackCreate(GetMethod(implObj, "FindProxyForURLEx"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCredentialsEx)
        CallbackFree(this.vtbl.GetCredentialsEx)
        CallbackFree(this.vtbl.DeleteCredentialsEx)
        CallbackFree(this.vtbl.FindProxyForURLEx)
    }
}
