#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUrlAccessor.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for invoking, initializing, and managing IUrlAccessor objects.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchprotocol
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchProtocol extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "CreateAccessor", "CloseAccessor", "ShutDown"]

    /**
     * 
     * @param {Pointer<TIMEOUT_INFO>} pTimeoutInfo 
     * @param {IProtocolHandlerSite} pProtocolHandlerSite 
     * @param {Pointer<PROXY_INFO>} pProxyInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocol-init
     */
    Init(pTimeoutInfo, pProtocolHandlerSite, pProxyInfo) {
        result := ComCall(3, this, "ptr", pTimeoutInfo, "ptr", pProtocolHandlerSite, "ptr", pProxyInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pcwszURL 
     * @param {Pointer<AUTHENTICATION_INFO>} pAuthenticationInfo 
     * @param {Pointer<INCREMENTAL_ACCESS_INFO>} pIncrementalAccessInfo 
     * @param {Pointer<ITEM_INFO>} pItemInfo 
     * @returns {IUrlAccessor} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocol-createaccessor
     */
    CreateAccessor(pcwszURL, pAuthenticationInfo, pIncrementalAccessInfo, pItemInfo) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        result := ComCall(4, this, "ptr", pcwszURL, "ptr", pAuthenticationInfo, "ptr", pIncrementalAccessInfo, "ptr", pItemInfo, "ptr*", &ppAccessor := 0, "HRESULT")
        return IUrlAccessor(ppAccessor)
    }

    /**
     * 
     * @param {IUrlAccessor} pAccessor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocol-closeaccessor
     */
    CloseAccessor(pAccessor) {
        result := ComCall(5, this, "ptr", pAccessor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocol-shutdown
     */
    ShutDown() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
