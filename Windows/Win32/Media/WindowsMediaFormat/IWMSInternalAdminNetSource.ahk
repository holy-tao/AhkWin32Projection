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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IUnknown} pSharedNamespace 
     * @param {IUnknown} pNamespaceNode 
     * @param {INSNetSourceCreator} pNetSourceCreator 
     * @param {BOOL} fEmbeddedInServer 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
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
     * 
     * @param {BSTR} bstrRealm 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrPassword 
     * @param {BOOL} fPersist 
     * @param {BOOL} fConfirmedGood 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-setcredentials
     */
    SetCredentials(bstrRealm, bstrName, bstrPassword, fPersist, fConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(5, this, "ptr", bstrRealm, "ptr", bstrName, "ptr", bstrPassword, "int", fPersist, "int", fConfirmedGood, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRealm 
     * @param {Pointer<BSTR>} pbstrName 
     * @param {Pointer<BSTR>} pbstrPassword 
     * @param {Pointer<BOOL>} pfConfirmedGood 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-getcredentials
     */
    GetCredentials(bstrRealm, pbstrName, pbstrPassword, pfConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm

        pfConfirmedGoodMarshal := pfConfirmedGood is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", bstrRealm, "ptr", pbstrName, "ptr", pbstrPassword, pfConfirmedGoodMarshal, pfConfirmedGood, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRealm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-deletecredentials
     */
    DeleteCredentials(bstrRealm) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm

        result := ComCall(7, this, "ptr", bstrRealm, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-getcredentialflags
     */
    GetCredentialFlags() {
        result := ComCall(8, this, "uint*", &lpdwFlags := 0, "HRESULT")
        return lpdwFlags
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-setcredentialflags
     */
    SetCredentialFlags(dwFlags) {
        result := ComCall(9, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {BSTR} bstrHost 
     * @param {Pointer<BOOL>} pfProxyEnabled 
     * @param {Pointer<BSTR>} pbstrProxyServer 
     * @param {Pointer<Integer>} pdwProxyPort 
     * @param {Pointer<Integer>} pdwProxyContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-findproxyforurl
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
     * 
     * @param {HRESULT} hrParam 
     * @param {Integer} dwProxyContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-registerproxyfailure
     */
    RegisterProxyFailure(hrParam, dwProxyContext) {
        result := ComCall(11, this, "int", hrParam, "uint", dwProxyContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProxyContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsinternaladminnetsource/nf-wmsinternaladminnetsource-iwmsinternaladminnetsource-shutdownproxycontext
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
