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
 * To implement this interface use class ID CLSID_NameSpaceTreeControl.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-inamespacetreecontrol
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-initialize
     */
    Initialize(hwndParent, prc, nsctsFlags) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", prc, "uint", nsctsFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables a client to register with the control.
     * @remarks
     * The pointer to the cookie that is passed back is used to unregister the control later with <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-treeunadvise">INameSpaceTreeControl::TreeUnadvise</a>.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the client IUnknown that registers with the control.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to the cookie that is passed back for registration.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-treeadvise
     */
    TreeAdvise(punk) {
        result := ComCall(4, this, "ptr", punk, "uint*", &pdwCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCookie
    }

    /**
     * Enables a client to unregister with the control.
     * @remarks
     * The pointer to the cookie that is passed in is the one that was passed back in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-treeadvise">INameSpaceTreeControl::TreeAdvise</a>.
     * @param {Integer} dwCookie Type: <b>DWORD*</b>
     * 
     * A pointer to the cookie that is to be unregistered.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-treeunadvise
     */
    TreeUnadvise(dwCookie) {
        result := ComCall(5, this, "uint", dwCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-appendroot
     */
    AppendRoot(psiRoot, grfEnumFlags, grfRootStyle, pif) {
        result := ComCall(6, this, "ptr", psiRoot, "uint", grfEnumFlags, "uint", grfRootStyle, "ptr", pif, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-insertroot
     */
    InsertRoot(iIndex, psiRoot, grfEnumFlags, grfRootStyle, pif) {
        result := ComCall(7, this, "int", iIndex, "ptr", psiRoot, "uint", grfEnumFlags, "uint", grfRootStyle, "ptr", pif, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes a root and its children from a tree.
     * @param {IShellItem} psiRoot Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the root that is to be removed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-removeroot
     */
    RemoveRoot(psiRoot) {
        result := ComCall(8, this, "ptr", psiRoot, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all roots and their children from a tree.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-removeallroots
     */
    RemoveAllRoots() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets an array of the root items.
     * @returns {IShellItemArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>**</b>
     * 
     * A pointer to an array of root items.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getrootitems
     */
    GetRootItems() {
        result := ComCall(10, this, "ptr*", &ppsiaRootItems := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IShellItemArray(ppsiaRootItems)
    }

    /**
     * Sets state information for a Shell item.
     * @remarks
     * The <i>nstcisMask</i> value specifies which bits in the value pointed to by <i>pnstcisFlags</i> are to be set. Other bits are ignored. As a simple example, if <i>nstcisMask</i>=NSTCIS_SELECTED, then the first bit in the <i>nstcisFlags</i> value determines whether that flag is set (1) or removed (0).
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-setitemstate
     */
    SetItemState(psi, nstcisMask, nstcisFlags) {
        result := ComCall(11, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets state information about a Shell item.
     * @remarks
     * The <i>nstcisMask</i> value specifies which bits in the value pointed to by <i>pnstcisFlags</i> are requested. As a simple example, if <i>nstcisMask</i>=NSTCIS_SELECTED, then only the first bit in the value pointed to by <i>pnstcisFlags</i> is valid when this method returns. If the first bit in the value pointed to by <i>pnstcisFlags</i> is 1, then the NSTCIS_SELECTED flag is set. If the first bit in the value pointed to by <i>pnstcisFlags</i> is 0, then the NSTCIS_SELECTED flag is not set.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the Shell item from which to retrieve the state.
     * @param {Integer} nstcisMask Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a></b>
     * 
     * Specifies which information is being requested, in the form of a bitmap. One or more of the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a> constants.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate">NSTCITEMSTATE</a>*</b>
     * 
     * When this method returns, points to a bitmap that contains the values requested in <i>nstcisMask</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemstate
     */
    GetItemState(psi, nstcisMask) {
        result := ComCall(12, this, "ptr", psi, "uint", nstcisMask, "uint*", &pnstcisFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnstcisFlags
    }

    /**
     * Gets an array of selected Shell items.
     * @returns {IShellItemArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a>**</b>
     * 
     * A pointer to an array of selected Shell items.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getselecteditems
     */
    GetSelectedItems() {
        result := ComCall(13, this, "ptr*", &psiaItems := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemcustomstate
     */
    GetItemCustomState(psi) {
        result := ComCall(14, this, "ptr", psi, "int*", &piStateNumber := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-setitemcustomstate
     */
    SetItemCustomState(psi, iStateNumber) {
        result := ComCall(15, this, "ptr", psi, "int", iStateNumber, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Ensures that the given item is visible.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * A pointer to the Shell item for which the visibility is being ensured.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-ensureitemvisible
     */
    EnsureItemVisible(psi) {
        result := ComCall(16, this, "ptr", psi, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the desktop theme for the current window only.
     * @param {PWSTR} pszTheme Type: <b>LPCWSTR</b>
     * 
     * The name of the desktop theme to which the current window is being set.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-settheme
     */
    SetTheme(pszTheme) {
        pszTheme := pszTheme is String ? StrPtr(pszTheme) : pszTheme

        result := ComCall(17, this, "ptr", pszTheme, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the next item in the tree according to which method is requested.
     * @remarks
     * If there is no next item for the type selected, this function returns E_FAIL with <b>NULL</b> for the returned item, <i>ppsiNext</i>.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * The Shell item for which the next item is being retrieved. This value can be <b>NULL</b>.
     * @param {Integer} nstcgi Type: <b>NSTCGNI</b>
     * 
     * The type of the next item. This value can be one of the following flags:
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that fits the criteria for the next item that was requested.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getnextitem
     */
    GetNextItem(psi, nstcgi) {
        result := ComCall(18, this, "ptr", psi, "int", nstcgi, "ptr*", &ppsiNext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IShellItem(ppsiNext)
    }

    /**
     * Retrieves the item that a given point is in, if any.
     * @remarks
     * This function returns <b>S_FALSE</b> with a <b>NULL</b> item if the point does not exist in an item.
     * @param {Pointer<POINT>} ppt Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * A pointer to the point to be tested.
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to the item in which the point exists, or <b>NULL</b> if the point does not exist in an item.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-hittest
     */
    HitTest(ppt) {
        result := ComCall(19, this, "ptr", ppt, "ptr*", &ppsiOut := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemrect
     */
    GetItemRect(psi) {
        prect := RECT()
        result := ComCall(20, this, "ptr", psi, "ptr", prect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prect
    }

    /**
     * Collapses all of the items in the given tree.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-collapseall
     */
    CollapseAll() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
