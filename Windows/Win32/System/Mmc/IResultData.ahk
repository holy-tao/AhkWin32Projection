#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IResultData interface enables a user to add, remove, find, and modify items associated with the result view pane. It also enables the manipulation of the view style of the result view pane.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iresultdata
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IResultData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResultData
     * @type {Guid}
     */
    static IID => Guid("{31da5fa0-e0eb-11cf-9f21-00aa003ca9f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertItem", "DeleteItem", "FindItemByLParam", "DeleteAllRsltItems", "SetItem", "GetItem", "GetNextItem", "ModifyItemState", "ModifyViewStyle", "SetViewMode", "GetViewMode", "UpdateItem", "Sort", "SetDescBarText", "SetItemCount"]

    /**
     * The IResultData::InsertItem method enables the snap-in to add a single new item to the result pane view.
     * @param {Pointer<RESULTDATAITEM>} item A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-resultdataitem">RESULTDATAITEM</a> structure that contains information about the item to be added.
     * 
     * After the item is inserted, a unique identifier (an item ID) is assigned to it by MMC and returned through the <b>itemID</b> member of the structure pointed to by the item parameter. Be aware that the <b>itemID</b> value is the <b>HRESULTITEM</b> handle of the inserted item. The snap-in should store this value in order to later manipulate the inserted item by calling methods such as <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-getitem">IResultData::GetItem</a>.
     * 
     * If this identifier is not stored, it can be looked up using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-iresultdata-finditembylparam">IResultData::FindItemByLParam</a>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-insertitem
     */
    InsertItem(item) {
        result := ComCall(3, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * Enables the snap-in to delete a single item in the result view pane.
     * @param {Pointer} itemID A value that specifies the unique ID of the item to be deleted. When applied to virtual lists, pass the item index instead of the itemID.
     * @param {Integer} nCol Not used. Must be zero.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-deleteitem
     */
    DeleteItem(itemID, nCol) {
        result := ComCall(4, this, "ptr", itemID, "int", nCol, "HRESULT")
        return result
    }

    /**
     * The IResultData::FindItemByLParam method enables the snap-in to find an item or subitem based on its user-inserted lParam value.
     * @param {LPARAM} lParam A generic 32-bit value in which information can be stored.
     * @returns {Pointer} A pointer to an item identifier to hold the results of the search for the lParam value.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-finditembylparam
     */
    FindItemByLParam(lParam) {
        result := ComCall(5, this, "ptr", lParam, "ptr*", &pItemID := 0, "HRESULT")
        return pItemID
    }

    /**
     * The IResultData::DeleteAllRsltItems method enables the snap-in to remove all user-inserted items and subitems from the result view pane.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-deleteallrsltitems
     */
    DeleteAllRsltItems() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The IResultData::SetItem method enables the snap-in to set a single item in the result pane.
     * @param {Pointer<RESULTDATAITEM>} item A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-resultdataitem">RESULTDATAITEM</a> structure that contains information about the item to be changed.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-setitem
     */
    SetItem(item) {
        result := ComCall(7, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * Enables a user to retrieve the parameters of a single item.
     * @param {Pointer<RESULTDATAITEM>} item A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-resultdataitem">RESULTDATAITEM</a> structure that contains information about the item whose parameters are being retrieved.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-getitem
     */
    GetItem(item) {
        result := ComCall(8, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * The IResultData::GetNextItem method gets the next item in the result view with the specified state flags set.
     * @param {Pointer<RESULTDATAITEM>} item A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-resultdataitem">RESULTDATAITEM</a> structure that contains information about the item to be obtained. The <b>nIndex</b> member should be set to the index at which to start the search, or to –1 to start at the first item. The specified index is excluded from the search. The <b>nState</b> member should specify which state flags must be set on the returned item.
     * 
     * The <b>nIndex</b> member will be updated to the index of the found item (or –1, if none is found). The <b>bScopeItem</b> and <b>lParam</b> members will be set according to the found item.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-getnextitem
     */
    GetNextItem(item) {
        result := ComCall(9, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * Enables the snap-in to modify the state of an item.
     * @param {Integer} nIndex A value that specifies the index of the item whose state is to be modified. This parameter is used only when the itemID parameter is zero. When applied to virtual lists, you must use nIndex and set itemID to zero.
     * @param {Pointer} itemID Unique identifier of the item whose state is to be modified. When applied to virtual lists, set itemID = 0.
     * @param {Integer} uAdd A value that specifies which Windows list-view state flags can be set. When applied to virtual lists, only focus and select states can be modified. This value can be any valid combination of the following:
     * @param {Integer} uRemove A value that specifies the list-view item state flags that can be removed. This value can be any valid combination of the preceding Win32 LVIS_* flags shown for the uAdd parameter.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-modifyitemstate
     */
    ModifyItemState(nIndex, itemID, uAdd, uRemove) {
        result := ComCall(10, this, "int", nIndex, "ptr", itemID, "uint", uAdd, "uint", uRemove, "HRESULT")
        return result
    }

    /**
     * The IResultData::ModifyViewStyle method enables the snap-in to set the result pane's view style.
     * @param {Integer} add A value that specifies the view style (or styles) to be set in the result view pane. This value can be a valid combination of the following:
     * @param {Integer} remove A value that specifies the view style (or styles) to be removed from the result view pane. This value can be a valid combination of the preceding flags shown for the add parameter. As described there, these values are from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-mmc_result_view_style">MMC_RESULT_VIEW_STYLE</a> enumeration and correspond to the Win32 LVS_* flags of the same names.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-modifyviewstyle
     */
    ModifyViewStyle(add, remove) {
        result := ComCall(11, this, "int", add, "int", remove, "HRESULT")
        return result
    }

    /**
     * Enables the snap-in to set the view mode in which the result view pane displays its items.
     * @param {Integer} lViewMode 
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-setviewmode
     */
    SetViewMode(lViewMode) {
        result := ComCall(12, this, "int", lViewMode, "HRESULT")
        return result
    }

    /**
     * Enables the snap-in to retrieve a view mode for the result view pane.
     * @returns {Integer} A pointer to the view mode to be retrieved. It can be one of the following:
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-getviewmode
     */
    GetViewMode() {
        result := ComCall(13, this, "int*", &lViewMode := 0, "HRESULT")
        return lViewMode
    }

    /**
     * Causes a specified item in the result pane to be redrawn.
     * @param {Pointer} itemID A value that specifies the unique identifier of the item to be redrawn in the result pane. When applied to virtual lists, pass the item index instead of the itemID.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-updateitem
     */
    UpdateItem(itemID) {
        result := ComCall(14, this, "ptr", itemID, "HRESULT")
        return result
    }

    /**
     * Sorts all items in the result pane.
     * @param {Integer} nColumn An index of the column header clicked.
     * @param {Integer} dwSortOptions The sort options to be used during the sort operation. This value can be a combination of the following:
     * @param {LPARAM} lUserParam A value that specifies information determined by the user. This parameter can contain a variety of entries such as including sort order or context information.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-sort
     */
    Sort(nColumn, dwSortOptions, lUserParam) {
        result := ComCall(15, this, "int", nColumn, "uint", dwSortOptions, "ptr", lUserParam, "HRESULT")
        return result
    }

    /**
     * Sets the description bar text for the result view pane.
     * @param {PWSTR} DescText A pointer to a null-terminated string that contains text to be displayed in the description bar.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-setdescbartext
     */
    SetDescBarText(DescText) {
        DescText := DescText is String ? StrPtr(DescText) : DescText

        result := ComCall(16, this, "ptr", DescText, "HRESULT")
        return result
    }

    /**
     * Sets the number of items in a virtual list.
     * @param {Integer} nItemCount The number of items that the control will contain.
     * @param {Integer} dwOptions Combination of the following flags:
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-iresultdata-setitemcount
     */
    SetItemCount(nItemCount, dwOptions) {
        result := ComCall(17, this, "int", nItemCount, "uint", dwOptions, "HRESULT")
        return result
    }
}
