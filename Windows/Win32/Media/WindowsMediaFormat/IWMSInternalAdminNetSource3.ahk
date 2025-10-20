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
     * 
     * @param {Pointer<IUnknown>} ppNetSourceCreator 
     * @returns {HRESULT} 
     */
    GetNetSourceCreator2(ppNetSourceCreator) {
        result := ComCall(7, this, "ptr", ppNetSourceCreator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {BSTR} bstrHost 
     * @param {BSTR} bstrUrl 
     * @param {Pointer<BOOL>} pfProxyEnabled 
     * @param {Pointer<BSTR>} pbstrProxyServer 
     * @param {Pointer<UInt32>} pdwProxyPort 
     * @param {Pointer<UInt64>} pqwProxyContext 
     * @returns {HRESULT} 
     */
    FindProxyForURLEx2(bstrProtocol, bstrHost, bstrUrl, pfProxyEnabled, pbstrProxyServer, pdwProxyPort, pqwProxyContext) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrHost := bstrHost is String ? BSTR.Alloc(bstrHost).Value : bstrHost
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(8, this, "ptr", bstrProtocol, "ptr", bstrHost, "ptr", bstrUrl, "ptr", pfProxyEnabled, "ptr", pbstrProxyServer, "uint*", pdwProxyPort, "uint*", pqwProxyContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hrParam 
     * @param {Integer} qwProxyContext 
     * @returns {HRESULT} 
     */
    RegisterProxyFailure2(hrParam, qwProxyContext) {
        result := ComCall(9, this, "int", hrParam, "uint", qwProxyContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} qwProxyContext 
     * @returns {HRESULT} 
     */
    ShutdownProxyContext2(qwProxyContext) {
        result := ComCall(10, this, "uint", qwProxyContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} qwProxyContext 
     * @param {Pointer<BOOL>} pfIsUsingIE 
     * @returns {HRESULT} 
     */
    IsUsingIE2(qwProxyContext, pfIsUsingIE) {
        result := ComCall(11, this, "uint", qwProxyContext, "ptr", pfIsUsingIE, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    SetCredentialsEx2(bstrRealm, bstrUrl, fProxy, bstrName, bstrPassword, fPersist, fConfirmedGood, fClearTextAuthentication) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(12, this, "ptr", bstrRealm, "ptr", bstrUrl, "int", fProxy, "ptr", bstrName, "ptr", bstrPassword, "int", fPersist, "int", fConfirmedGood, "int", fClearTextAuthentication, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRealm 
     * @param {BSTR} bstrUrl 
     * @param {BOOL} fProxy 
     * @param {BOOL} fClearTextAuthentication 
     * @param {Pointer<Int32>} pdwUrlPolicy 
     * @param {Pointer<BSTR>} pbstrName 
     * @param {Pointer<BSTR>} pbstrPassword 
     * @param {Pointer<BOOL>} pfConfirmedGood 
     * @returns {HRESULT} 
     */
    GetCredentialsEx2(bstrRealm, bstrUrl, fProxy, fClearTextAuthentication, pdwUrlPolicy, pbstrName, pbstrPassword, pfConfirmedGood) {
        bstrRealm := bstrRealm is String ? BSTR.Alloc(bstrRealm).Value : bstrRealm
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(13, this, "ptr", bstrRealm, "ptr", bstrUrl, "int", fProxy, "int", fClearTextAuthentication, "int*", pdwUrlPolicy, "ptr", pbstrName, "ptr", pbstrPassword, "ptr", pfConfirmedGood, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
