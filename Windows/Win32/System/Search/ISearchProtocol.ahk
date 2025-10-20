#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for invoking, initializing, and managing IUrlAccessor objects.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchprotocol
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchProtocol extends IUnknown{
    /**
     * The interface identifier for ISearchProtocol
     * @type {Guid}
     */
    static IID => Guid("{c73106ba-ac80-11d1-8df3-00c04fb6ef4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<TIMEOUT_INFO>} pTimeoutInfo 
     * @param {Pointer<IProtocolHandlerSite>} pProtocolHandlerSite 
     * @param {Pointer<PROXY_INFO>} pProxyInfo 
     * @returns {HRESULT} 
     */
    Init(pTimeoutInfo, pProtocolHandlerSite, pProxyInfo) {
        result := ComCall(3, this, "ptr", pTimeoutInfo, "ptr", pProtocolHandlerSite, "ptr", pProxyInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pcwszURL 
     * @param {Pointer<AUTHENTICATION_INFO>} pAuthenticationInfo 
     * @param {Pointer<INCREMENTAL_ACCESS_INFO>} pIncrementalAccessInfo 
     * @param {Pointer<ITEM_INFO>} pItemInfo 
     * @param {Pointer<IUrlAccessor>} ppAccessor 
     * @returns {HRESULT} 
     */
    CreateAccessor(pcwszURL, pAuthenticationInfo, pIncrementalAccessInfo, pItemInfo, ppAccessor) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        result := ComCall(4, this, "ptr", pcwszURL, "ptr", pAuthenticationInfo, "ptr", pIncrementalAccessInfo, "ptr", pItemInfo, "ptr", ppAccessor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUrlAccessor>} pAccessor 
     * @returns {HRESULT} 
     */
    CloseAccessor(pAccessor) {
        result := ComCall(5, this, "ptr", pAccessor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShutDown() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
