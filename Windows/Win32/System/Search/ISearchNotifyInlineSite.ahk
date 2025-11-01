#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods the Search service uses to send updates on catalog and index status to notification providers.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchnotifyinlinesite
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchNotifyInlineSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchNotifyInlineSite
     * @type {Guid}
     */
    static IID => Guid("{b5702e61-e75c-4b64-82a1-6cb4f832fccf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnItemIndexedStatusChange", "OnCatalogStatusChange"]

    /**
     * 
     * @param {Integer} sipStatus 
     * @param {Integer} dwNumEntries 
     * @param {Pointer<SEARCH_ITEM_INDEXING_STATUS>} rgItemStatusEntries 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchnotifyinlinesite-onitemindexedstatuschange
     */
    OnItemIndexedStatusChange(sipStatus, dwNumEntries, rgItemStatusEntries) {
        result := ComCall(3, this, "int", sipStatus, "uint", dwNumEntries, "ptr", rgItemStatusEntries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidCatalogResetSignature 
     * @param {Pointer<Guid>} guidCheckPointSignature 
     * @param {Integer} dwLastCheckPointNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchnotifyinlinesite-oncatalogstatuschange
     */
    OnCatalogStatusChange(guidCatalogResetSignature, guidCheckPointSignature, dwLastCheckPointNumber) {
        result := ComCall(4, this, "ptr", guidCatalogResetSignature, "ptr", guidCheckPointSignature, "uint", dwLastCheckPointNumber, "HRESULT")
        return result
    }
}
