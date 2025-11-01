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
     * 
     * @param {Pointer<RESULTDATAITEM>} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-insertitem
     */
    InsertItem(item) {
        result := ComCall(3, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} itemID 
     * @param {Integer} nCol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-deleteitem
     */
    DeleteItem(itemID, nCol) {
        result := ComCall(4, this, "ptr", itemID, "int", nCol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {LPARAM} lParam 
     * @param {Pointer<Pointer>} pItemID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-finditembylparam
     */
    FindItemByLParam(lParam, pItemID) {
        pItemIDMarshal := pItemID is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", lParam, pItemIDMarshal, pItemID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-deleteallrsltitems
     */
    DeleteAllRsltItems() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RESULTDATAITEM>} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-setitem
     */
    SetItem(item) {
        result := ComCall(7, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RESULTDATAITEM>} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-getitem
     */
    GetItem(item) {
        result := ComCall(8, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RESULTDATAITEM>} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-getnextitem
     */
    GetNextItem(item) {
        result := ComCall(9, this, "ptr", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer} itemID 
     * @param {Integer} uAdd 
     * @param {Integer} uRemove 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-modifyitemstate
     */
    ModifyItemState(nIndex, itemID, uAdd, uRemove) {
        result := ComCall(10, this, "int", nIndex, "ptr", itemID, "uint", uAdd, "uint", uRemove, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} add 
     * @param {Integer} remove 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-modifyviewstyle
     */
    ModifyViewStyle(add, remove) {
        result := ComCall(11, this, "int", add, "int", remove, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lViewMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-setviewmode
     */
    SetViewMode(lViewMode) {
        result := ComCall(12, this, "int", lViewMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lViewMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-getviewmode
     */
    GetViewMode(lViewMode) {
        lViewModeMarshal := lViewMode is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, lViewModeMarshal, lViewMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} itemID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-updateitem
     */
    UpdateItem(itemID) {
        result := ComCall(14, this, "ptr", itemID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nColumn 
     * @param {Integer} dwSortOptions 
     * @param {LPARAM} lUserParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-sort
     */
    Sort(nColumn, dwSortOptions, lUserParam) {
        result := ComCall(15, this, "int", nColumn, "uint", dwSortOptions, "ptr", lUserParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} DescText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-setdescbartext
     */
    SetDescBarText(DescText) {
        DescText := DescText is String ? StrPtr(DescText) : DescText

        result := ComCall(16, this, "ptr", DescText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nItemCount 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-iresultdata-setitemcount
     */
    SetItemCount(nItemCount, dwOptions) {
        result := ComCall(17, this, "int", nItemCount, "uint", dwOptions, "HRESULT")
        return result
    }
}
