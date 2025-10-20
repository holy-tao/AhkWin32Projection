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
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {BOOL} fAscending 
     * @returns {HRESULT} 
     */
    SetGroupBy(key, fAscending) {
        result := ComCall(17, this, "ptr", key, "int", fAscending, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @param {Pointer<BOOL>} pfAscending 
     * @returns {HRESULT} 
     */
    GetGroupBy(pkey, pfAscending) {
        result := ComCall(18, this, "ptr", pkey, "ptr", pfAscending, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @returns {HRESULT} 
     * @deprecated
     */
    SetViewProperty(pidl, propkey, propvar) {
        result := ComCall(19, this, "ptr", pidl, "ptr", propkey, "ptr", propvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     * @deprecated
     */
    GetViewProperty(pidl, propkey, ppropvar) {
        result := ComCall(20, this, "ptr", pidl, "ptr", propkey, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {PWSTR} pszPropList 
     * @returns {HRESULT} 
     * @deprecated
     */
    SetTileViewProperties(pidl, pszPropList) {
        pszPropList := pszPropList is String ? StrPtr(pszPropList) : pszPropList

        result := ComCall(21, this, "ptr", pidl, "ptr", pszPropList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {PWSTR} pszPropList 
     * @returns {HRESULT} 
     * @deprecated
     */
    SetExtendedTileViewProperties(pidl, pszPropList) {
        pszPropList := pszPropList is String ? StrPtr(pszPropList) : pszPropList

        result := ComCall(22, this, "ptr", pidl, "ptr", pszPropList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iType 
     * @param {PWSTR} pwszText 
     * @returns {HRESULT} 
     */
    SetText(iType, pwszText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(23, this, "int", iType, "ptr", pwszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMask 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetCurrentFolderFlags(dwMask, dwFlags) {
        result := ComCall(24, this, "uint", dwMask, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetCurrentFolderFlags(pdwFlags) {
        result := ComCall(25, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcColumns 
     * @returns {HRESULT} 
     */
    GetSortColumnCount(pcColumns) {
        result := ComCall(26, this, "int*", pcColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SORTCOLUMN>} rgSortColumns 
     * @param {Integer} cColumns 
     * @returns {HRESULT} 
     */
    SetSortColumns(rgSortColumns, cColumns) {
        result := ComCall(27, this, "ptr", rgSortColumns, "int", cColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SORTCOLUMN>} rgSortColumns 
     * @param {Integer} cColumns 
     * @returns {HRESULT} 
     */
    GetSortColumns(rgSortColumns, cColumns) {
        result := ComCall(28, this, "ptr", rgSortColumns, "int", cColumns, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iItem 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetItem(iItem, riid, ppv) {
        result := ComCall(29, this, "int", iItem, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iStart 
     * @param {BOOL} fPrevious 
     * @param {Pointer<Int32>} piItem 
     * @returns {HRESULT} 
     */
    GetVisibleItem(iStart, fPrevious, piItem) {
        result := ComCall(30, this, "int", iStart, "int", fPrevious, "int*", piItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iStart 
     * @param {Pointer<Int32>} piItem 
     * @returns {HRESULT} 
     */
    GetSelectedItem(iStart, piItem) {
        result := ComCall(31, this, "int", iStart, "int*", piItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fNoneImpliesFolder 
     * @param {Pointer<IShellItemArray>} ppsia 
     * @returns {HRESULT} 
     */
    GetSelection(fNoneImpliesFolder, ppsia) {
        result := ComCall(32, this, "int", fNoneImpliesFolder, "ptr", ppsia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetSelectionState(pidl, pdwFlags) {
        result := ComCall(33, this, "ptr", pidl, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszVerb 
     * @returns {HRESULT} 
     */
    InvokeVerbOnSelection(pszVerb) {
        result := ComCall(34, this, "ptr", pszVerb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uViewMode 
     * @param {Integer} iImageSize 
     * @returns {HRESULT} 
     */
    SetViewModeAndIconSize(uViewMode, iImageSize) {
        result := ComCall(35, this, "int", uViewMode, "int", iImageSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} puViewMode 
     * @param {Pointer<Int32>} piImageSize 
     * @returns {HRESULT} 
     */
    GetViewModeAndIconSize(puViewMode, piImageSize) {
        result := ComCall(36, this, "int*", puViewMode, "int*", piImageSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cVisibleRows 
     * @returns {HRESULT} 
     */
    SetGroupSubsetCount(cVisibleRows) {
        result := ComCall(37, this, "uint", cVisibleRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcVisibleRows 
     * @returns {HRESULT} 
     */
    GetGroupSubsetCount(pcVisibleRows) {
        result := ComCall(38, this, "uint*", pcVisibleRows, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fRedrawOn 
     * @returns {HRESULT} 
     */
    SetRedraw(fRedrawOn) {
        result := ComCall(39, this, "int", fRedrawOn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsMoveInSameFolder() {
        result := ComCall(40, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DoRename() {
        result := ComCall(41, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
