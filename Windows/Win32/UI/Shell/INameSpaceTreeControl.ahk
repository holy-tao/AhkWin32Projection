#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItemArray.ahk
#Include .\IShellItem.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used to view and manipulate nodes in a tree of Shell items.
 * @remarks
 * 
 * To implement this interface use class ID CLSID_NameSpaceTreeControl.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-inamespacetreecontrol
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class INameSpaceTreeControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INameSpaceTreeControl
     * @type {Guid}
     */
    static IID => Guid("{028212a3-b627-47e9-8856-c14265554e4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "TreeAdvise", "TreeUnadvise", "AppendRoot", "InsertRoot", "RemoveRoot", "RemoveAllRoots", "GetRootItems", "SetItemState", "GetItemState", "GetSelectedItems", "GetItemCustomState", "SetItemCustomState", "EnsureItemVisible", "SetTheme", "GetNextItem", "HitTest", "GetItemRect", "CollapseAll"]

    /**
     * Initializes an INameSpaceTreeControl object.
     * @param {HWND} hwndParent Type: <b>HWND</b>
     * 
     * The handle of the parent window.
     * @param {Pointer<RECT>} prc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the size and position of the control in the client window.
     * @param {Integer} nsctsFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle">NSTCSTYLE</a></b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-initialize
     */
    Initialize(hwndParent, prc, nsctsFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", prc, "uint", nsctsFlags, "HRESULT")
        return result
    }

    /**
     * Enables a client to register with the control.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the client IUnknown that registers with the control.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to the cookie that is passed back for registration.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-treeadvise
     */
    TreeAdvise(punk) {
        result := ComCall(4, this, "ptr", punk, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Enables a client to unregister with the control.
     * @param {Integer} dwCookie Type: <b>DWORD*</b>
     * 
     * A pointer to the cookie that is to be unregistered.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-treeunadvise
     */
    TreeUnadvise(dwCookie) {
        result := ComCall(5, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Appends a Shell item to the list of roots in a tree.
     * @param {IShellItem} psiRoot Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to the Shell item that is being appended.
     * @param {Integer} grfEnumFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a></b>
     * 
     * Enumerates the qualities of the root and all of its children. One or more of the values of type <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a>. These flags can be combined using a bitwise OR.
     * @param {Integer} grfRootStyle Type: <b>NSTCROOTSTYLE</b>
     * @param {IShellItemFilter} pif Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter">IShellItemFilter</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter">IShellItemFilter</a> that enables you to filter which items in the tree are displayed. If supplied, every item is customizable with a <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a> flag. This value can be <b>NULL</b> if no filter is required.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-appendroot
     */
    AppendRoot(psiRoot, grfEnumFlags, grfRootStyle, pif) {
        result := ComCall(6, this, "ptr", psiRoot, "uint", grfEnumFlags, "uint", grfRootStyle, "ptr", pif, "HRESULT")
        return result
    }

    /**
     * Inserts a Shell item on a root item in a tree.
     * @param {Integer} iIndex Type: <b>int</b>
     * 
     * The index at which to insert the root.
     * @param {IShellItem} psiRoot Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the Shell item that is being inserted.
     * @param {Integer} grfEnumFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a></b>
     * 
     * Enumerates the qualities of the root and all of its children. One of the values of type <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a>.
     * @param {Integer} grfRootStyle Type: <b>NSTCROOTSTYLE</b>
     * @param {IShellItemFilter} pif Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter">IShellItemFilter</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter">IShellItemFilter</a> that enables you to filter which items in the tree are displayed. If supplied, every item is customizable with a <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf">SHCONTF</a> flag. This value can be <b>NULL</b> if no filter is required.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-insertroot
     */
    InsertRoot(iIndex, psiRoot, grfEnumFlags, grfRootStyle, pif) {
        result := ComCall(7, this, "int", iIndex, "ptr", psiRoot, "uint", grfEnumFlags, "uint", grfRootStyle, "ptr", pif, "HRESULT")
        return result
    }

    /**
     * Removes a root and its children from a tree.
     * @param {IShellItem} psiRoot Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the root that is to be removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-removeroot
     */
    RemoveRoot(psiRoot) {
        result := ComCall(8, this, "ptr", psiRoot, "HRESULT")
        return result
    }

    /**
     * Removes all roots and their children from a tree.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-removeallroots
     */
    RemoveAllRoots() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Gets an array of the root items.
     * @returns {IShellItemArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>**</b>
     * 
     * A pointer to an array of root items.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getrootitems
     */
    GetRootItems() {
        result := ComCall(10, this, "ptr*", &ppsiaRootItems := 0, "HRESULT")
        return IShellItemArray(ppsiaRootItems)
    }

    /**
     * Sets state information for a Shell item.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the Shell item for which to set the state.
     * @param {Integer} nstcisMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a></b>
     * 
     * Specifies which information is being set, in the form of a bitmap. One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a> constants.
     * @param {Integer} nstcisFlags Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a></b>
     * 
     * A bitmap that contains the values to set for the flags specified in <i>nstcisMask</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-setitemstate
     */
    SetItemState(psi, nstcisMask, nstcisFlags) {
        result := ComCall(11, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisFlags, "HRESULT")
        return result
    }

    /**
     * Gets state information about a Shell item.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the Shell item from which to retrieve the state.
     * @param {Integer} nstcisMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a></b>
     * 
     * Specifies which information is being requested, in the form of a bitmap. One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a> constants.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a>*</b>
     * 
     * When this method returns, points to a bitmap that contains the values requested in <i>nstcisMask</i>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemstate
     */
    GetItemState(psi, nstcisMask) {
        result := ComCall(12, this, "ptr", psi, "uint", nstcisMask, "uint*", &pnstcisFlags := 0, "HRESULT")
        return pnstcisFlags
    }

    /**
     * Gets an array of selected Shell items.
     * @returns {IShellItemArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>**</b>
     * 
     * A pointer to an array of selected Shell items.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getselecteditems
     */
    GetSelectedItems() {
        result := ComCall(13, this, "ptr*", &psiaItems := 0, "HRESULT")
        return IShellItemArray(psiaItems)
    }

    /**
     * Gets the state of the checkbox associated with a given Shell item.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the Shell item for which checkbox state is being retrieved.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to the state of the checkbox for the Shell item.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemcustomstate
     */
    GetItemCustomState(psi) {
        result := ComCall(14, this, "ptr", psi, "int*", &piStateNumber := 0, "HRESULT")
        return piStateNumber
    }

    /**
     * Sets the state of the checkbox associated with the Shell item.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the Shell item for which checkbox state
     *                 is being set.
     * @param {Integer} iStateNumber Type: <b>int</b>
     * 
     * The desired state of the checkbox for the Shell item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-setitemcustomstate
     */
    SetItemCustomState(psi, iStateNumber) {
        result := ComCall(15, this, "ptr", psi, "int", iStateNumber, "HRESULT")
        return result
    }

    /**
     * Ensures that the given item is visible.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the Shell item for which the visibility is being ensured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-ensureitemvisible
     */
    EnsureItemVisible(psi) {
        result := ComCall(16, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * Sets the desktop theme for the current window only.
     * @param {PWSTR} pszTheme Type: <b>LPCWSTR</b>
     * 
     * The name of the desktop theme to which the current window is being set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-settheme
     */
    SetTheme(pszTheme) {
        pszTheme := pszTheme is String ? StrPtr(pszTheme) : pszTheme

        result := ComCall(17, this, "ptr", pszTheme, "HRESULT")
        return result
    }

    /**
     * Retrieves the next item in the tree according to which method is requested.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * The Shell item for which the next item is being retrieved. This value can be <b>NULL</b>.
     * @param {Integer} nstcgi Type: <b>NSTCGNI</b>
     * 
     * The type of the next item. This value can be one of the following flags:
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that fits the criteria for the next item that was requested.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getnextitem
     */
    GetNextItem(psi, nstcgi) {
        result := ComCall(18, this, "ptr", psi, "int", nstcgi, "ptr*", &ppsiNext := 0, "HRESULT")
        return IShellItem(ppsiNext)
    }

    /**
     * Retrieves the item that a given point is in, if any.
     * @param {Pointer<POINT>} ppt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * A pointer to the point to be tested.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to the item in which the point exists, or <b>NULL</b> if the point does not exist in an item.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-hittest
     */
    HitTest(ppt) {
        result := ComCall(19, this, "ptr", ppt, "ptr*", &ppsiOut := 0, "HRESULT")
        return IShellItem(ppsiOut)
    }

    /**
     * Gets the RECT structure that describes the size and position of a given item.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the item for which the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure is being retrieved.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the size and position of the item.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemrect
     */
    GetItemRect(psi) {
        prect := RECT()
        result := ComCall(20, this, "ptr", psi, "ptr", prect, "HRESULT")
        return prect
    }

    /**
     * Collapses all of the items in the given tree.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-collapseall
     */
    CollapseAll() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
