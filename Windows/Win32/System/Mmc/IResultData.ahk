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
     * 
     * @param {Pointer<RESULTDATAITEM>} item 
     * @returns {HRESULT} 
     */
    InsertItem(item) {
        result := ComCall(3, this, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} itemID 
     * @param {Integer} nCol 
     * @returns {HRESULT} 
     */
    DeleteItem(itemID, nCol) {
        result := ComCall(4, this, "ptr", itemID, "int", nCol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {LPARAM} lParam 
     * @param {Pointer<IntPtr>} pItemID 
     * @returns {HRESULT} 
     */
    FindItemByLParam(lParam, pItemID) {
        result := ComCall(5, this, "ptr", lParam, "ptr*", pItemID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAllRsltItems() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RESULTDATAITEM>} item 
     * @returns {HRESULT} 
     */
    SetItem(item) {
        result := ComCall(7, this, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RESULTDATAITEM>} item 
     * @returns {HRESULT} 
     */
    GetItem(item) {
        result := ComCall(8, this, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RESULTDATAITEM>} item 
     * @returns {HRESULT} 
     */
    GetNextItem(item) {
        result := ComCall(9, this, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer} itemID 
     * @param {Integer} uAdd 
     * @param {Integer} uRemove 
     * @returns {HRESULT} 
     */
    ModifyItemState(nIndex, itemID, uAdd, uRemove) {
        result := ComCall(10, this, "int", nIndex, "ptr", itemID, "uint", uAdd, "uint", uRemove, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} add 
     * @param {Integer} remove 
     * @returns {HRESULT} 
     */
    ModifyViewStyle(add, remove) {
        result := ComCall(11, this, "int", add, "int", remove, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lViewMode 
     * @returns {HRESULT} 
     */
    SetViewMode(lViewMode) {
        result := ComCall(12, this, "int", lViewMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lViewMode 
     * @returns {HRESULT} 
     */
    GetViewMode(lViewMode) {
        result := ComCall(13, this, "int*", lViewMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} itemID 
     * @returns {HRESULT} 
     */
    UpdateItem(itemID) {
        result := ComCall(14, this, "ptr", itemID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nColumn 
     * @param {Integer} dwSortOptions 
     * @param {LPARAM} lUserParam 
     * @returns {HRESULT} 
     */
    Sort(nColumn, dwSortOptions, lUserParam) {
        result := ComCall(15, this, "int", nColumn, "uint", dwSortOptions, "ptr", lUserParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} DescText 
     * @returns {HRESULT} 
     */
    SetDescBarText(DescText) {
        DescText := DescText is String ? StrPtr(DescText) : DescText

        result := ComCall(16, this, "ptr", DescText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nItemCount 
     * @param {Integer} dwOptions 
     * @returns {HRESULT} 
     */
    SetItemCount(nItemCount, dwOptions) {
        result := ComCall(17, this, "int", nItemCount, "uint", dwOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
