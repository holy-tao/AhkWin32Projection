#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISearchProtocol.ahk

/**
 * Provides methods for invoking, initializing, and managing IUrlAccessor objects.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchprotocol2
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchProtocol2 extends ISearchProtocol{
    /**
     * The interface identifier for ISearchProtocol2
     * @type {Guid}
     */
    static IID => Guid("{7789f0b2-b5b2-4722-8b65-5dbd150697a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {PWSTR} pcwszURL 
     * @param {Pointer<AUTHENTICATION_INFO>} pAuthenticationInfo 
     * @param {Pointer<INCREMENTAL_ACCESS_INFO>} pIncrementalAccessInfo 
     * @param {Pointer<ITEM_INFO>} pItemInfo 
     * @param {Pointer<BLOB>} pUserData 
     * @param {Pointer<IUrlAccessor>} ppAccessor 
     * @returns {HRESULT} 
     */
    CreateAccessorEx(pcwszURL, pAuthenticationInfo, pIncrementalAccessInfo, pItemInfo, pUserData, ppAccessor) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        result := ComCall(7, this, "ptr", pcwszURL, "ptr", pAuthenticationInfo, "ptr", pIncrementalAccessInfo, "ptr", pItemInfo, "ptr", pUserData, "ptr", ppAccessor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
