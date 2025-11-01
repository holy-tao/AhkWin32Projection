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
     * 
     * @param {BSTR} bstrRealm 
     * @param {BSTR} bstrUrl 
     * @param {BOOL} fProxy 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrPassword 
     * @param {BOOL} fPersist 
     * @param {BOOL} fConfirmedGood 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource2-setcredentialsex
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
     * 
     * @param {BSTR} bstrRealm 
     * @param {BSTR} bstrUrl 
     * @param {BOOL} fProxy 
     * @param {Pointer<Integer>} pdwUrlPolicy 
     * @param {Pointer<BSTR>} pbstrName 
     * @param {Pointer<BSTR>} pbstrPassword 
     * @param {Pointer<BOOL>} pfConfirmedGood 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource2-getcredentialsex
     */
    GetCredentialsEx(bstrRealm, bstrUrl, fProxy, pdwUrlPolicy, pbstrName, pbstrPassword, pfConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        pdwUrlPolicyMarshal := pdwUrlPolicy is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", bstrRealm, "ptr", bstrUrl, "int", fProxy, pdwUrlPolicyMarshal, pdwUrlPolicy, "ptr", pbstrName, "ptr", pbstrPassword, "ptr", pfConfirmedGood, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRealm 
     * @param {BSTR} bstrUrl 
     * @param {BOOL} fProxy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource2-deletecredentialsex
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

        pdwProxyPortMarshal := pdwProxyPort is VarRef ? "uint*" : "ptr"
        pdwProxyContextMarshal := pdwProxyContext is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", bstrProtocol, "ptr", bstrHost, "ptr", bstrUrl, "ptr", pfProxyEnabled, "ptr", pbstrProxyServer, pdwProxyPortMarshal, pdwProxyPort, pdwProxyContextMarshal, pdwProxyContext, "HRESULT")
        return result
    }
}
