#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFolderView.ahk

/**
 * Exposes methods that retrieve information about a folder's display options, select specified items in that folder, and set the folder's view mode.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifolderview">IFolderView</a> interface, from which it inherits.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifolderview2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFolderView2 extends IFolderView{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFolderView2
     * @type {Guid}
     */
    static IID => Guid("{1af3a467-214f-4298-908e-06b03e0b39f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGroupBy", "GetGroupBy", "SetViewProperty", "GetViewProperty", "SetTileViewProperties", "SetExtendedTileViewProperties", "SetText", "SetCurrentFolderFlags", "GetCurrentFolderFlags", "GetSortColumnCount", "SetSortColumns", "GetSortColumns", "GetItem", "GetVisibleItem", "GetSelectedItem", "GetSelection", "GetSelectionState", "InvokeVerbOnSelection", "SetViewModeAndIconSize", "GetViewModeAndIconSize", "SetGroupSubsetCount", "GetGroupSubsetCount", "SetRedraw", "IsMoveInSameFolder", "DoRename"]

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {BOOL} fAscending 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-setgroupby
     */
    SetGroupBy(key, fAscending) {
        result := ComCall(17, this, "ptr", key, "int", fAscending, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @param {Pointer<BOOL>} pfAscending 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getgroupby
     */
    GetGroupBy(pkey, pfAscending) {
        result := ComCall(18, this, "ptr", pkey, "ptr", pfAscending, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-setviewproperty
     * @deprecated
     */
    SetViewProperty(pidl, propkey, propvar) {
        result := ComCall(19, this, "ptr", pidl, "ptr", propkey, "ptr", propvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getviewproperty
     * @deprecated
     */
    GetViewProperty(pidl, propkey, ppropvar) {
        result := ComCall(20, this, "ptr", pidl, "ptr", propkey, "ptr", ppropvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {PWSTR} pszPropList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-settileviewproperties
     * @deprecated
     */
    SetTileViewProperties(pidl, pszPropList) {
        pszPropList := pszPropList is String ? StrPtr(pszPropList) : pszPropList

        result := ComCall(21, this, "ptr", pidl, "ptr", pszPropList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {PWSTR} pszPropList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-setextendedtileviewproperties
     * @deprecated
     */
    SetExtendedTileViewProperties(pidl, pszPropList) {
        pszPropList := pszPropList is String ? StrPtr(pszPropList) : pszPropList

        result := ComCall(22, this, "ptr", pidl, "ptr", pszPropList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iType 
     * @param {PWSTR} pwszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-settext
     */
    SetText(iType, pwszText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(23, this, "int", iType, "ptr", pwszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMask 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-setcurrentfolderflags
     */
    SetCurrentFolderFlags(dwMask, dwFlags) {
        result := ComCall(24, this, "uint", dwMask, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getcurrentfolderflags
     */
    GetCurrentFolderFlags(pdwFlags) {
        result := ComCall(25, this, "uint*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcColumns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getsortcolumncount
     */
    GetSortColumnCount(pcColumns) {
        result := ComCall(26, this, "int*", pcColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SORTCOLUMN>} rgSortColumns 
     * @param {Integer} cColumns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-setsortcolumns
     */
    SetSortColumns(rgSortColumns, cColumns) {
        result := ComCall(27, this, "ptr", rgSortColumns, "int", cColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SORTCOLUMN>} rgSortColumns 
     * @param {Integer} cColumns 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getsortcolumns
     */
    GetSortColumns(rgSortColumns, cColumns) {
        result := ComCall(28, this, "ptr", rgSortColumns, "int", cColumns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iItem 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getitem
     */
    GetItem(iItem, riid, ppv) {
        result := ComCall(29, this, "int", iItem, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iStart 
     * @param {BOOL} fPrevious 
     * @param {Pointer<Integer>} piItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getvisibleitem
     */
    GetVisibleItem(iStart, fPrevious, piItem) {
        result := ComCall(30, this, "int", iStart, "int", fPrevious, "int*", piItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iStart 
     * @param {Pointer<Integer>} piItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getselecteditem
     */
    GetSelectedItem(iStart, piItem) {
        result := ComCall(31, this, "int", iStart, "int*", piItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fNoneImpliesFolder 
     * @param {Pointer<IShellItemArray>} ppsia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getselection
     */
    GetSelection(fNoneImpliesFolder, ppsia) {
        result := ComCall(32, this, "int", fNoneImpliesFolder, "ptr*", ppsia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getselectionstate
     */
    GetSelectionState(pidl, pdwFlags) {
        result := ComCall(33, this, "ptr", pidl, "uint*", pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszVerb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-invokeverbonselection
     */
    InvokeVerbOnSelection(pszVerb) {
        result := ComCall(34, this, "ptr", pszVerb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uViewMode 
     * @param {Integer} iImageSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-setviewmodeandiconsize
     */
    SetViewModeAndIconSize(uViewMode, iImageSize) {
        result := ComCall(35, this, "int", uViewMode, "int", iImageSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} puViewMode 
     * @param {Pointer<Integer>} piImageSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getviewmodeandiconsize
     */
    GetViewModeAndIconSize(puViewMode, piImageSize) {
        result := ComCall(36, this, "int*", puViewMode, "int*", piImageSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cVisibleRows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-setgroupsubsetcount
     */
    SetGroupSubsetCount(cVisibleRows) {
        result := ComCall(37, this, "uint", cVisibleRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcVisibleRows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-getgroupsubsetcount
     */
    GetGroupSubsetCount(pcVisibleRows) {
        result := ComCall(38, this, "uint*", pcVisibleRows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fRedrawOn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-setredraw
     */
    SetRedraw(fRedrawOn) {
        result := ComCall(39, this, "int", fRedrawOn, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-ismoveinsamefolder
     */
    IsMoveInSameFolder() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifolderview2-dorename
     */
    DoRename() {
        result := ComCall(41, this, "HRESULT")
        return result
    }
}
