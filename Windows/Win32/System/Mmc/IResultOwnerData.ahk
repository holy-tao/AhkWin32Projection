#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IResultOwnerData interface supports the use of virtual lists, which are list-view controls that have the LVS_OWNERDATA style set.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-iresultownerdata
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IResultOwnerData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResultOwnerData
     * @type {Guid}
     */
    static IID => Guid("{9cb396d8-ea83-11d0-aef1-00c04fb6dd2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindItem", "CacheHint", "SortItems"]

    /**
     * Finds the next item in a virtual list matching a specified string.
     * @remarks
     * Because the snap-in maintains all the item data for a virtual list, the snap-in must implement 
     * FindItem to allow navigation by partial name typing. The console calls 
     * FindItem to find the next match each time the user types a printable character. The console handles the character accumulation and timing functions, passing the snap-in the current partial name in each 
     * FindItem call.
     * @param {Pointer<RESULTFINDINFO>} pFindInfo A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-resultfindinfo">RESULTFINDINFO</a> structure.
     * @returns {Integer} A pointer to the returned index of the item found. The value is –1 if no items are found.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultownerdata-finditem
     */
    FindItem(pFindInfo) {
        result := ComCall(3, this, "ptr", pFindInfo, "int*", &pnFoundIndex := 0, "HRESULT")
        return pnFoundIndex
    }

    /**
     * Called when a virtual list is about to request display information for a range of items, allowing the snap-in to collect the information ahead of time in cases where an optimization can be made.
     * @remarks
     * MMC calls 
     * CacheHint for a virtual list view to assist in optimizing how the snap-in caches requested item data to improve retrieval performance. The arguments passed in the call provide inclusive index values for a range of items that MMC recommends be cached. When 
     * CacheHint is called, the snap-in must be prepared to load the cache with item information for the requested range so that the information will be readily available when its 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent-getdisplayinfo">IComponent::GetDisplayInfo</a> method is called later.
     * 
     * There is no certainty that all the items will be requested or that other items will not be requested.
     * @param {Integer} nStartIndex An index of the first item to be requested.
     * @param {Integer} nEndIndex An index of the last item to be requested.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultownerdata-cachehint
     */
    CacheHint(nStartIndex, nEndIndex) {
        result := ComCall(4, this, "int", nStartIndex, "int", nEndIndex, "HRESULT")
        return result
    }

    /**
     * Sorts the items of a virtual result list.
     * @remarks
     * Because the snap-in maintains all the item data storage for a virtual list, the list does not support sorting. The console calls this function when the user clicks the header item of a virtual list or when the snap-in calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-sort">IResultData::Sort</a>.
     * 
     * MMC calls <b>IResultOwnerData::SortItems</b> with the same sort options that were passed by the snap-in in the call to <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-sort">IResultData::Sort</a>.
     * @param {Integer} nColumn An index of the column header clicked.
     * @param {Integer} dwSortOptions The sort options to be used during the sort operation. This value can be a combination of the following:
     * @param {LPARAM} lUserParam A user parameter passed in an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-sort">IResultData::Sort</a> call, <b>NULL</b> if the user initiated the sort.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultownerdata-sortitems
     */
    SortItems(nColumn, dwSortOptions, lUserParam) {
        result := ComCall(5, this, "int", nColumn, "uint", dwSortOptions, "ptr", lUserParam, "HRESULT")
        return result
    }
}
