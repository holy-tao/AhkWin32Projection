#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUrlAccessor.ahk
#Include .\ISearchProtocol.ahk

/**
 * Provides methods for invoking, initializing, and managing IUrlAccessor objects.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchprotocol2
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchProtocol2 extends ISearchProtocol{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateAccessorEx"]

    /**
     * Creates and initializes an IUrlAccessor object. This method has the same basic functionality as the ISearchProtocol::CreateAccessor method, but it includes an additional pUserData parameter to supply additional data to the protocol handler.
     * @param {PWSTR} pcwszURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string containing the URL of the item being accessed.
     * @param {Pointer<AUTHENTICATION_INFO>} pAuthenticationInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-authentication_info">AUTHENTICATION_INFO</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-authentication_info">AUTHENTICATION_INFO</a> structure that contains authentication information necessary for accessing this item in the content source.
     * @param {Pointer<INCREMENTAL_ACCESS_INFO>} pIncrementalAccessInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-incremental_access_info">INCREMENTAL_ACCESS_INFO</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-incremental_access_info">INCREMENTAL_ACCESS_INFO</a> structure that contains incremental access information, such as the last time the file was accessed by the gatherer.
     * @param {Pointer<ITEM_INFO>} pItemInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-item_info">ITEM_INFO</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-item_info">ITEM_INFO</a> structure that contains information about the URL item, such as the name of the item's workspace catalog.
     * @param {Pointer<BLOB>} pUserData Type: <b>const BLOB*</b>
     * 
     * Pointer to user information. This data can be whatever the notification originator decides. If the protocol handler implements this interface, it will receive this data.  Not all notifications have this blob set.
     * @returns {IUrlAccessor} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a> object created by this method. This object contains information about the URL item, such as the item's file name.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchprotocol2-createaccessorex
     */
    CreateAccessorEx(pcwszURL, pAuthenticationInfo, pIncrementalAccessInfo, pItemInfo, pUserData) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        result := ComCall(7, this, "ptr", pcwszURL, "ptr", pAuthenticationInfo, "ptr", pIncrementalAccessInfo, "ptr", pItemInfo, "ptr", pUserData, "ptr*", &ppAccessor := 0, "HRESULT")
        return IUrlAccessor(ppAccessor)
    }
}
