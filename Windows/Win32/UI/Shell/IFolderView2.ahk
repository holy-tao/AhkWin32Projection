#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include .\SORTCOLUMN.ahk
#Include .\IShellItemArray.ahk
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
     * Groups the view by the given property key and direction.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> by which the view should be grouped.
     * @param {BOOL} fAscending Type: <b>BOOL</b>
     * 
     * A value of type <b>BOOL</b> to indicate sort order of the groups.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-setgroupby
     */
    SetGroupBy(key, fAscending) {
        result := ComCall(17, this, "ptr", key, "int", fAscending, "HRESULT")
        return result
    }

    /**
     * Retrieves the property and sort order used for grouping items in the folder display.
     * @param {Pointer<PROPERTYKEY>} pkey Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> by which the view is grouped.
     * @param {Pointer<BOOL>} pfAscending Type: <b>BOOL*</b>
     * 
     * A pointer to a value of type <b>BOOL</b> that indicates sort order of the groups.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The view is grouped.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The view is not grouped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getgroupby
     */
    GetGroupBy(pkey, pfAscending) {
        pfAscendingMarshal := pfAscending is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, "ptr", pkey, pfAscendingMarshal, pfAscending, "HRESULT")
        return result
    }

    /**
     * Caches a property for an item in the view's property cache.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A PIDL that identifies the item.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> which is to be stored.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure in which the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> is stored.
     * @returns {HRESULT} Type: <b>DEPRECATED_HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-setviewproperty
     * @deprecated 
     */
    SetViewProperty(pidl, propkey, propvar) {
        result := ComCall(19, this, "ptr", pidl, "ptr", propkey, "ptr", propvar, "HRESULT")
        return result
    }

    /**
     * Gets a property value for a given property key from the view's cache.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A pointer to an item identifier list (PIDL).
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> to be retrieved.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure in which the <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a> is stored.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getviewproperty
     * @deprecated 
     */
    GetViewProperty(pidl, propkey) {
        ppropvar := PROPVARIANT()
        result := ComCall(20, this, "ptr", pidl, "ptr", propkey, "ptr", ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * Set the list of tile properties for an item.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A pointer to an item identifier list (PIDL).
     * @param {PWSTR} pszPropList Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string containing a list of properties.
     * @returns {HRESULT} Type: <b>DEPRECATED_HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-settileviewproperties
     * @deprecated 
     */
    SetTileViewProperties(pidl, pszPropList) {
        pszPropList := pszPropList is String ? StrPtr(pszPropList) : pszPropList

        result := ComCall(21, this, "ptr", pidl, "ptr", pszPropList, "HRESULT")
        return result
    }

    /**
     * Sets the list of extended tile properties for an item.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A pointer to an item identifier list (PIDL).
     * @param {PWSTR} pszPropList Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string containing a list of properties.
     * @returns {HRESULT} Type: <b>DEPRECATED_HRESULT</b>
     * 
     * Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-setextendedtileviewproperties
     * @deprecated 
     */
    SetExtendedTileViewProperties(pidl, pszPropList) {
        pszPropList := pszPropList is String ? StrPtr(pszPropList) : pszPropList

        result := ComCall(22, this, "ptr", pidl, "ptr", pszPropList, "HRESULT")
        return result
    }

    /**
     * Sets the default text to be used when there are no items in the view.
     * @param {Integer} iType Type: <b>FVTEXTTYPE</b>
     * 
     * This value should be set to the following flag.
     * @param {PWSTR} pwszText Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string that contains the text to be used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-settext
     */
    SetText(iType, pwszText) {
        pwszText := pwszText is String ? StrPtr(pwszText) : pwszText

        result := ComCall(23, this, "int", iType, "ptr", pwszText, "HRESULT")
        return result
    }

    /**
     * Sets and applies specified folder flags.
     * @param {Integer} dwMask Type: <b>DWORD</b>
     * 
     * The value of type <b>DWORD</b> that specifies the bitmask indicating which items in the structure are desired or valid.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * The value of type <b>DWORD</b> that contains one or more <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-setcurrentfolderflags
     */
    SetCurrentFolderFlags(dwMask, dwFlags) {
        result := ComCall(24, this, "uint", dwMask, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Gets the currently applied folder flags.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a <b>DWORD</b> with any <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a> that have been applied to the folder.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getcurrentfolderflags
     */
    GetCurrentFolderFlags() {
        result := ComCall(25, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Gets the count of sort columns currently applied to the view.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getsortcolumncount
     */
    GetSortColumnCount() {
        result := ComCall(26, this, "int*", &pcColumns := 0, "HRESULT")
        return pcColumns
    }

    /**
     * Sets and sorts the view by the given sort columns.
     * @param {Pointer<SORTCOLUMN>} rgSortColumns Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-sortcolumn">SORTCOLUMN</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-sortcolumn">SORTCOLUMN</a> structure. The size of this structure is determined by <i>cColumns</i>.
     * @param {Integer} cColumns Type: <b>int</b>
     * 
     * The count of columns to sort by.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-setsortcolumns
     */
    SetSortColumns(rgSortColumns, cColumns) {
        result := ComCall(27, this, "ptr", rgSortColumns, "int", cColumns, "HRESULT")
        return result
    }

    /**
     * Gets the sort columns currently applied to the view.
     * @param {Integer} cColumns Type: <b>int</b>
     * 
     * The count of columns to sort by.
     * @returns {SORTCOLUMN} Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-sortcolumn">SORTCOLUMN</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-sortcolumn">SORTCOLUMN</a> structure. The size of this structure is determined by <i>cColumns</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getsortcolumns
     */
    GetSortColumns(cColumns) {
        rgSortColumns := SORTCOLUMN()
        result := ComCall(28, this, "ptr", rgSortColumns, "int", cColumns, "HRESULT")
        return rgSortColumns
    }

    /**
     * Retrieves an object that represents a specified item.
     * @param {Integer} iItem Type: <b>int</b>
     * 
     * The zero-based index of the item to retrieve.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the desired IID to represent the item, such as IID_IShellItem.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getitem
     */
    GetItem(iItem, riid) {
        result := ComCall(29, this, "int", iItem, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets the next visible item in relation to a given index in the view.
     * @param {Integer} iStart Type: <b>int</b>
     * 
     * The zero-based position at which to start searching for a visible item.
     * @param {BOOL} fPrevious Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> to find the first visible item before <i>iStart</i>. <b>FALSE</b> to find the first visible item after <i>iStart</i>.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * When this method returns, contains a pointer to a value that receives the index of the visible item in the view.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getvisibleitem
     */
    GetVisibleItem(iStart, fPrevious) {
        result := ComCall(30, this, "int", iStart, "int", fPrevious, "int*", &piItem := 0, "HRESULT")
        return piItem
    }

    /**
     * Locates the currently selected item at or after a given index.
     * @param {Integer} iStart Type: <b>int</b>
     * 
     * The index position from which to start searching for the currently selected item.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to a value that receives the index of the item in the view.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getselecteditem
     */
    GetSelectedItem(iStart) {
        result := ComCall(31, this, "int", iStart, "int*", &piItem := 0, "HRESULT")
        return piItem
    }

    /**
     * Gets the current selection as an IShellItemArray.
     * @param {BOOL} fNoneImpliesFolder Type: <b>BOOL</b>
     * 
     * If <b>TRUE</b>, this method returns an IShellItemArray containing the parent folder when there is no current selection.
     * @returns {IShellItemArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>**</b>
     * 
     * The address of a pointer to an IShellItemArray.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getselection
     */
    GetSelection(fNoneImpliesFolder) {
        result := ComCall(32, this, "int", fNoneImpliesFolder, "ptr*", &ppsia := 0, "HRESULT")
        return IShellItemArray(ppsia)
    }

    /**
     * Gets the selection state including check state.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A PIDL of the item.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Zero or one of the following <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svsif">_SVSIF</a> constants that specify the current type of selection: <b>SVSI_FOCUSED</b>, <b>SVSI_SELECT</b>, <b>SVSI_CHECK</b>, or <b>SVSI_CHECK2</b>. Other <b>_SVSIF</b> constants are not returned by this API.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getselectionstate
     */
    GetSelectionState(pidl) {
        result := ComCall(33, this, "ptr", pidl, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Invokes the given verb on the current selection.
     * @param {PSTR} pszVerb Type: <b>LPCSTR</b>
     * 
     * A pointer to a Unicode string containing a verb.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-invokeverbonselection
     */
    InvokeVerbOnSelection(pszVerb) {
        pszVerb := pszVerb is String ? StrPtr(pszVerb) : pszVerb

        result := ComCall(34, this, "ptr", pszVerb, "HRESULT")
        return result
    }

    /**
     * Sets and applies the view mode and image size.
     * @param {Integer} uViewMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a> to be applied.
     * @param {Integer} iImageSize Type: <b>int</b>
     * 
     * The size of the image in pixels.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-setviewmodeandiconsize
     */
    SetViewModeAndIconSize(uViewMode, iImageSize) {
        result := ComCall(35, this, "int", uViewMode, "int", iImageSize, "HRESULT")
        return result
    }

    /**
     * Gets the current view mode and icon size applied to the view.
     * @param {Pointer<Integer>} puViewMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a>*</b>
     * 
     * A pointer to the current <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a>.
     * @param {Pointer<Integer>} piImageSize Type: <b>int*</b>
     * 
     * A pointer to the size of the icon in pixels.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getviewmodeandiconsize
     */
    GetViewModeAndIconSize(puViewMode, piImageSize) {
        puViewModeMarshal := puViewMode is VarRef ? "int*" : "ptr"
        piImageSizeMarshal := piImageSize is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, puViewModeMarshal, puViewMode, piImageSizeMarshal, piImageSize, "HRESULT")
        return result
    }

    /**
     * Turns on group subsetting and sets the number of visible rows of items in each group.
     * @param {Integer} cVisibleRows Type: <b>UINT</b>
     * 
     * The number of rows to be visible.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-setgroupsubsetcount
     */
    SetGroupSubsetCount(cVisibleRows) {
        result := ComCall(37, this, "uint", cVisibleRows, "HRESULT")
        return result
    }

    /**
     * Gets the count of visible rows displayed for a group's subset.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The number of rows currently visible.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-getgroupsubsetcount
     */
    GetGroupSubsetCount() {
        result := ComCall(38, this, "uint*", &pcVisibleRows := 0, "HRESULT")
        return pcVisibleRows
    }

    /**
     * Sets redraw on and off.
     * @param {BOOL} fRedrawOn Type: <b>BOOL</b>
     * 
     * a <b>BOOL</b> value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-setredraw
     */
    SetRedraw(fRedrawOn) {
        result := ComCall(39, this, "int", fRedrawOn, "HRESULT")
        return result
    }

    /**
     * Checks to see if this view sourced the current drag-and-drop or cut-and-paste operation (used by drop target objects).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-ismoveinsamefolder
     */
    IsMoveInSameFolder() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * Starts a rename operation on the current selection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview2-dorename
     */
    DoRename() {
        result := ComCall(41, this, "HRESULT")
        return result
    }
}
