#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve information about a folder's display options, select specified items in that folder, and set the folder's view mode.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifolderview
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderView extends IUnknown{
    /**
     * The interface identifier for IFolderView
     * @type {Guid}
     */
    static IID => Guid("{cde725b0-ccc9-4519-917e-325d72fab4ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pViewMode 
     * @returns {HRESULT} 
     */
    GetCurrentViewMode(pViewMode) {
        result := ComCall(3, this, "uint*", pViewMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ViewMode 
     * @returns {HRESULT} 
     */
    SetCurrentViewMode(ViewMode) {
        result := ComCall(4, this, "uint", ViewMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetFolder(riid, ppv) {
        result := ComCall(5, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iItemIndex 
     * @param {Pointer<ITEMIDLIST>} ppidl 
     * @returns {HRESULT} 
     */
    Item(iItemIndex, ppidl) {
        result := ComCall(6, this, "int", iItemIndex, "ptr", ppidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @param {Pointer<Int32>} pcItems 
     * @returns {HRESULT} 
     */
    ItemCount(uFlags, pcItems) {
        result := ComCall(7, this, "uint", uFlags, "int*", pcItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    Items(uFlags, riid, ppv) {
        result := ComCall(8, this, "uint", uFlags, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piItem 
     * @returns {HRESULT} 
     */
    GetSelectionMarkedItem(piItem) {
        result := ComCall(9, this, "int*", piItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piItem 
     * @returns {HRESULT} 
     */
    GetFocusedItem(piItem) {
        result := ComCall(10, this, "int*", piItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     */
    GetItemPosition(pidl, ppt) {
        result := ComCall(11, this, "ptr", pidl, "ptr", ppt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     */
    GetSpacing(ppt) {
        result := ComCall(12, this, "ptr", ppt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     */
    GetDefaultSpacing(ppt) {
        result := ComCall(13, this, "ptr", ppt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetAutoArrange() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iItem 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SelectItem(iItem, dwFlags) {
        result := ComCall(15, this, "int", iItem, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cidl 
     * @param {Pointer<ITEMIDLIST>} apidl 
     * @param {Pointer<POINT>} apt 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SelectAndPositionItems(cidl, apidl, apt, dwFlags) {
        result := ComCall(16, this, "uint", cidl, "ptr", apidl, "ptr", apt, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
