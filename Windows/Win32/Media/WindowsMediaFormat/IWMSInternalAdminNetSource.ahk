#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IUnknown>} pSharedNamespace 
     * @param {Pointer<IUnknown>} pNamespaceNode 
     * @param {Pointer<INSNetSourceCreator>} pNetSourceCreator 
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
        result := ComCall(3, this, "ptr", pSharedNamespace, "ptr", pNamespaceNode, "ptr", pNetSourceCreator, "int", fEmbeddedInServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INSNetSourceCreator>} ppNetSourceCreator 
     * @returns {HRESULT} 
     */
    GetNetSourceCreator(ppNetSourceCreator) {
        result := ComCall(4, this, "ptr", ppNetSourceCreator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRealm 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrPassword 
     * @param {BOOL} fPersist 
     * @param {BOOL} fConfirmedGood 
     * @returns {HRESULT} 
     */
    SetCredentials(bstrRealm, bstrName, bstrPassword, fPersist, fConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(5, this, "ptr", bstrRealm, "ptr", bstrName, "ptr", bstrPassword, "int", fPersist, "int", fConfirmedGood, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRealm 
     * @param {Pointer<BSTR>} pbstrName 
     * @param {Pointer<BSTR>} pbstrPassword 
     * @param {Pointer<BOOL>} pfConfirmedGood 
     * @returns {HRESULT} 
     */
    GetCredentials(bstrRealm, pbstrName, pbstrPassword, pfConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm

        result := ComCall(6, this, "ptr", bstrRealm, "ptr", pbstrName, "ptr", pbstrPassword, "ptr", pfConfirmedGood, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRealm 
     * @returns {HRESULT} 
     */
    DeleteCredentials(bstrRealm) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm

        result := ComCall(7, this, "ptr", bstrRealm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpdwFlags 
     * @returns {HRESULT} 
     */
    GetCredentialFlags(lpdwFlags) {
        result := ComCall(8, this, "uint*", lpdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetCredentialFlags(dwFlags) {
        result := ComCall(9, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {BSTR} bstrHost 
     * @param {Pointer<BOOL>} pfProxyEnabled 
     * @param {Pointer<BSTR>} pbstrProxyServer 
     * @param {Pointer<UInt32>} pdwProxyPort 
     * @param {Pointer<UInt32>} pdwProxyContext 
     * @returns {HRESULT} 
     */
    FindProxyForURL(bstrProtocol, bstrHost, pfProxyEnabled, pbstrProxyServer, pdwProxyPort, pdwProxyContext) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrHost := bstrHost is String ? BSTR.Alloc(bstrHost).Value : bstrHost

        result := ComCall(10, this, "ptr", bstrProtocol, "ptr", bstrHost, "ptr", pfProxyEnabled, "ptr", pbstrProxyServer, "uint*", pdwProxyPort, "uint*", pdwProxyContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrParam 
     * @param {Integer} dwProxyContext 
     * @returns {HRESULT} 
     */
    RegisterProxyFailure(hrParam, dwProxyContext) {
        result := ComCall(11, this, "int", hrParam, "uint", dwProxyContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProxyContext 
     * @returns {HRESULT} 
     */
    ShutdownProxyContext(dwProxyContext) {
        result := ComCall(12, this, "uint", dwProxyContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProxyContext 
     * @param {Pointer<BOOL>} pfIsUsingIE 
     * @returns {HRESULT} 
     */
    IsUsingIE(dwProxyContext, pfIsUsingIE) {
        result := ComCall(13, this, "uint", dwProxyContext, "ptr", pfIsUsingIE, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
