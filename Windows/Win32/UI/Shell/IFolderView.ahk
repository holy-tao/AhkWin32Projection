#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve information about a folder's display options, select specified items in that folder, and set the folder's view mode.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifolderview
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderView extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentViewMode", "SetCurrentViewMode", "GetFolder", "Item", "ItemCount", "Items", "GetSelectionMarkedItem", "GetFocusedItem", "GetItemPosition", "GetSpacing", "GetDefaultSpacing", "GetAutoArrange", "SelectItem", "SelectAndPositionItems"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-getcurrentviewmode
     */
    GetCurrentViewMode() {
        result := ComCall(3, this, "uint*", &pViewMode := 0, "HRESULT")
        return pViewMode
    }

    /**
     * 
     * @param {Integer} ViewMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-setcurrentviewmode
     */
    SetCurrentViewMode(ViewMode) {
        result := ComCall(4, this, "uint", ViewMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-getfolder
     */
    GetFolder(riid) {
        result := ComCall(5, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} iItemIndex 
     * @returns {Pointer<ITEMIDLIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-item
     */
    Item(iItemIndex) {
        result := ComCall(6, this, "int", iItemIndex, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-itemcount
     */
    ItemCount(uFlags) {
        result := ComCall(7, this, "uint", uFlags, "int*", &pcItems := 0, "HRESULT")
        return pcItems
    }

    /**
     * 
     * @param {Integer} uFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-items
     */
    Items(uFlags, riid) {
        result := ComCall(8, this, "uint", uFlags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-getselectionmarkeditem
     */
    GetSelectionMarkedItem() {
        result := ComCall(9, this, "int*", &piItem := 0, "HRESULT")
        return piItem
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-getfocuseditem
     */
    GetFocusedItem() {
        result := ComCall(10, this, "int*", &piItem := 0, "HRESULT")
        return piItem
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {POINT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-getitemposition
     */
    GetItemPosition(pidl) {
        ppt := POINT()
        result := ComCall(11, this, "ptr", pidl, "ptr", ppt, "HRESULT")
        return ppt
    }

    /**
     * 
     * @param {Pointer<POINT>} ppt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-getspacing
     */
    GetSpacing(ppt) {
        result := ComCall(12, this, "ptr", ppt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {POINT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-getdefaultspacing
     */
    GetDefaultSpacing() {
        ppt := POINT()
        result := ComCall(13, this, "ptr", ppt, "HRESULT")
        return ppt
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-getautoarrange
     */
    GetAutoArrange() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iItem 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-selectitem
     */
    SelectItem(iItem, dwFlags) {
        result := ComCall(15, this, "int", iItem, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cidl 
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl 
     * @param {Pointer<POINT>} apt 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview-selectandpositionitems
     */
    SelectAndPositionItems(cidl, apidl, apt, dwFlags) {
        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, "uint", cidl, apidlMarshal, apidl, "ptr", apt, "uint", dwFlags, "HRESULT")
        return result
    }
}
