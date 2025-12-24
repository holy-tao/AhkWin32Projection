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
     * Gets an address containing a value representing the folder's current view mode.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a memory location at which to store the folder's current view mode. The value at that address is one of the following <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a> values.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-getcurrentviewmode
     */
    GetCurrentViewMode() {
        result := ComCall(3, this, "uint*", &pViewMode := 0, "HRESULT")
        return pViewMode
    }

    /**
     * Sets the selected folder's view mode.
     * @param {Integer} ViewMode Type: <b>UINT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-setcurrentviewmode
     */
    SetCurrentViewMode(ViewMode) {
        result := ComCall(4, this, "uint", ViewMode, "HRESULT")
        return result
    }

    /**
     * Gets the folder object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the desired IID to represent the folder.
     * @returns {Pointer<Void>} Type: <b>VOID**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>. This is typically <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> or a related interface. This can also be an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a> with a single element.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-getfolder
     */
    GetFolder(riid) {
        result := ComCall(5, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets the identifier of a specific item in the folder view, by index.
     * @param {Integer} iItemIndex Type: <b>int</b>
     * 
     * The index of the item in the view.
     * @returns {Pointer<ITEMIDLIST>} Type: <b>PITEMID_CHILD*</b>
     * 
     * The address of a pointer to a PIDL containing the item's identifier information.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-item
     */
    Item(iItemIndex) {
        result := ComCall(6, this, "int", iItemIndex, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }

    /**
     * Gets the number of items in the folder. This can be the number of all items, or a subset such as the number of selected items.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * 
     * Flags from the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svgio">_SVGIO</a> enumeration that limit the count to certain types of items.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Pointer to an integer that receives the number of items (files and folders) displayed in the folder view.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-itemcount
     */
    ItemCount(uFlags) {
        result := ComCall(7, this, "uint", uFlags, "int*", &pcItems := 0, "HRESULT")
        return pcItems
    }

    /**
     * Gets the address of an enumeration object based on the collection of items in the folder view.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svgio">_SVGIO</a> values that limit the enumeration to certain types of items.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the desired IID to represent the folder.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>. This is typically an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumidlist">IEnumIDList</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>. If an error occurs, this value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-items
     */
    Items(uFlags, riid) {
        result := ComCall(8, this, "uint", uFlags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets the index of an item in the folder's view which has been marked by using the SVSI_SELECTIONMARK in IFolderView::SelectItem.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to the index of the marked item.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-getselectionmarkeditem
     */
    GetSelectionMarkedItem() {
        result := ComCall(9, this, "int*", &piItem := 0, "HRESULT")
        return piItem
    }

    /**
     * Gets the index of the item that currently has focus in the folder's view.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to the index of the item.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-getfocuseditem
     */
    GetFocusedItem() {
        result := ComCall(10, this, "int*", &piItem := 0, "HRESULT")
        return piItem
    }

    /**
     * Gets the position of an item in the folder's view.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a> interface.
     * @returns {POINT} Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * A pointer to a structure that receives the position of the item's upper-left corner.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-getitemposition
     */
    GetItemPosition(pidl) {
        ppt := POINT()
        result := ComCall(11, this, "ptr", pidl, "ptr", ppt, "HRESULT")
        return ppt
    }

    /**
     * Gets a POINT structure containing the width (x) and height (y) dimensions, including the surrounding white space, of an item.
     * @param {Pointer<POINT>} ppt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * A pointer to an existing structure to be filled with the current sizing dimensions of the items in the folder's view.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-getspacing
     */
    GetSpacing(ppt) {
        result := ComCall(12, this, "ptr", ppt, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to a POINT structure containing the default width (x) and height (y) measurements of an item, including the surrounding white space.
     * @returns {POINT} Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * Pointer to an existing structure to be filled with the default sizing dimensions of the items in the folder's view.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-getdefaultspacing
     */
    GetDefaultSpacing() {
        ppt := POINT()
        result := ComCall(13, this, "ptr", ppt, "HRESULT")
        return ppt
    }

    /**
     * Gets the current state of the folder's Auto Arrange mode.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the folder is in Auto Arrange mode; S_FALSE if it is not.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-getautoarrange
     */
    GetAutoArrange() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Selects an item in the folder's view.
     * @param {Integer} iItem Type: <b>int</b>
     * 
     * The index of the item to select in the folder's view.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svsif">_SVSIF</a> constants that specify the type of selection to apply.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-selectitem
     */
    SelectItem(iItem, dwFlags) {
        result := ComCall(15, this, "int", iItem, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Allows the selection and positioning of items visible in the folder's view.
     * @param {Integer} cidl Type: <b>UINT</b>
     * 
     * The number of items to select.
     * @param {Pointer<Pointer<ITEMIDLIST>>} apidl Type: <b>PCUITEMID_CHILD_ARRAY*</b>
     * 
     * A pointer to an array of size <i>cidl</i> that contains the PIDLs of the items.
     * @param {Pointer<POINT>} apt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * A pointer to an array of <i>cidl</i> structures containing the locations each corresponding element in <i>apidl</i> should be positioned.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svsif">_SVSIF</a> constants that specifies the type of selection to apply.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ifolderview-selectandpositionitems
     */
    SelectAndPositionItems(cidl, apidl, apt, dwFlags) {
        apidlMarshal := apidl is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, "uint", cidl, apidlMarshal, apidl, "ptr", apt, "uint", dwFlags, "HRESULT")
        return result
    }
}
