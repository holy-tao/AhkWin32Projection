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
     * Called by the search service to notify the client when the status of a particular document or item changes.
     * @param {Integer} sipStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_indexing_phase">SEARCH_INDEXING_PHASE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-search_indexing_phase">SEARCH_INDEXING_PHASE</a> status of each document in the array being sent.
     * @param {Integer} dwNumEntries Type: <b>DWORD</b>
     * 
     * The number of entries in <i>rgItemStatusEntries</i>.
     * @param {Pointer<SEARCH_ITEM_INDEXING_STATUS>} rgItemStatusEntries Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_item_indexing_status">SEARCH_ITEM_INDEXING_STATUS</a>[]</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-search_item_indexing_status">SEARCH_ITEM_INDEXING_STATUS</a> structures containing status update information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchnotifyinlinesite-onitemindexedstatuschange
     */
    OnItemIndexedStatusChange(sipStatus, dwNumEntries, rgItemStatusEntries) {
        result := ComCall(3, this, "int", sipStatus, "uint", dwNumEntries, "ptr", rgItemStatusEntries, "HRESULT")
        return result
    }

    /**
     * Called by the search service to notify a client when the status of the catalog changes.
     * @param {Pointer<Guid>} guidCatalogResetSignature Type: <b>REFGUID</b>
     * 
     * A GUID representing the catalog reset. If this GUID changes, all notifications must be resent.
     * @param {Pointer<Guid>} guidCheckPointSignature Type: <b>REFGUID</b>
     * 
     * A GUID representing the last checkpoint restored. If this GUID changes, all notifications accumulated since the last saved checkpoint must be resent.
     * @param {Integer} dwLastCheckPointNumber Type: <b>DWORD</b>
     * 
     * A number indicating the last checkpoint saved.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchnotifyinlinesite-oncatalogstatuschange
     */
    OnCatalogStatusChange(guidCatalogResetSignature, guidCheckPointSignature, dwLastCheckPointNumber) {
        result := ComCall(4, this, "ptr", guidCatalogResetSignature, "ptr", guidCheckPointSignature, "uint", dwLastCheckPointNumber, "HRESULT")
        return result
    }
}
