#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IUnknown>} ppNetSourceCreator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource3
     */
    GetNetSourceCreator2(ppNetSourceCreator) {
        result := ComCall(7, this, "ptr*", ppNetSourceCreator, "HRESULT")
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
     * @param {Pointer<Integer>} pqwProxyContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource3-findproxyforurlex2
     */
    FindProxyForURLEx2(bstrProtocol, bstrHost, bstrUrl, pfProxyEnabled, pbstrProxyServer, pdwProxyPort, pqwProxyContext) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrHost := bstrHost is String ? BSTR.Alloc(bstrHost).Value : bstrHost
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        pdwProxyPortMarshal := pdwProxyPort is VarRef ? "uint*" : "ptr"
        pqwProxyContextMarshal := pqwProxyContext is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", bstrProtocol, "ptr", bstrHost, "ptr", bstrUrl, "ptr", pfProxyEnabled, "ptr", pbstrProxyServer, pdwProxyPortMarshal, pdwProxyPort, pqwProxyContextMarshal, pqwProxyContext, "HRESULT")
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
     * 
     * @param {Integer} qwProxyContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource3-shutdownproxycontext2
     */
    ShutdownProxyContext2(qwProxyContext) {
        result := ComCall(10, this, "uint", qwProxyContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} qwProxyContext 
     * @param {Pointer<BOOL>} pfIsUsingIE 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nn-wmsinternaladminnetsource-iwmsinternaladminnetsource3
     */
    IsUsingIE2(qwProxyContext, pfIsUsingIE) {
        result := ComCall(11, this, "uint", qwProxyContext, "ptr", pfIsUsingIE, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRealm 
     * @param {BSTR} bstrUrl 
     * @param {BOOL} fProxy 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrPassword 
     * @param {BOOL} fPersist 
     * @param {BOOL} fConfirmedGood 
     * @param {BOOL} fClearTextAuthentication 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource3-setcredentialsex2
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
     * 
     * @param {BSTR} bstrRealm 
     * @param {BSTR} bstrUrl 
     * @param {BOOL} fProxy 
     * @param {BOOL} fClearTextAuthentication 
     * @param {Pointer<Integer>} pdwUrlPolicy 
     * @param {Pointer<BSTR>} pbstrName 
     * @param {Pointer<BSTR>} pbstrPassword 
     * @param {Pointer<BOOL>} pfConfirmedGood 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource3-getcredentialsex2
     */
    GetCredentialsEx2(bstrRealm, bstrUrl, fProxy, fClearTextAuthentication, pdwUrlPolicy, pbstrName, pbstrPassword, pfConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        pdwUrlPolicyMarshal := pdwUrlPolicy is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, "ptr", bstrRealm, "ptr", bstrUrl, "int", fProxy, "int", fClearTextAuthentication, pdwUrlPolicyMarshal, pdwUrlPolicy, "ptr", pbstrName, "ptr", pbstrPassword, "ptr", pfConfirmedGood, "HRESULT")
        return result
    }
}
