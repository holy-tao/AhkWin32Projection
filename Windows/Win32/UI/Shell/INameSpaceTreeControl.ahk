#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\IShellItemFilter.ahk" { IShellItemFilter }
#Import ".\IShellItemArray.ahk" { IShellItemArray }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NSTCGNI.ahk" { NSTCGNI }
#Import ".\IShellItem.ahk" { IShellItem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Exposes methods used to view and manipulate nodes in a tree of Shell items.
 * @remarks
 * To implement this interface use class ID CLSID_NameSpaceTreeControl.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrol
 * @namespace Windows.Win32.UI.Shell
 */
export default struct INameSpaceTreeControl extends IUnknown {
    /**
     * The interface identifier for INameSpaceTreeControl
     * @type {Guid}
     */
    static IID := Guid("{028212a3-b627-47e9-8856-c14265554e4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INameSpaceTreeControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize         : IntPtr
        TreeAdvise         : IntPtr
        TreeUnadvise       : IntPtr
        AppendRoot         : IntPtr
        InsertRoot         : IntPtr
        RemoveRoot         : IntPtr
        RemoveAllRoots     : IntPtr
        GetRootItems       : IntPtr
        SetItemState       : IntPtr
        GetItemState       : IntPtr
        GetSelectedItems   : IntPtr
        GetItemCustomState : IntPtr
        SetItemCustomState : IntPtr
        EnsureItemVisible  : IntPtr
        SetTheme           : IntPtr
        GetNextItem        : IntPtr
        HitTest            : IntPtr
        GetItemRect        : IntPtr
        CollapseAll        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INameSpaceTreeControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-initialize
     */
    Initialize(hwndParent, prc, nsctsFlags) {
        result := ComCall(3, this, HWND, hwndParent, RECT.Ptr, prc, "uint", nsctsFlags, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-treeadvise
     */
    TreeAdvise(punk) {
        result := ComCall(4, this, "ptr", punk, "uint*", &pdwCookie := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-treeunadvise
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-appendroot
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-insertroot
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-removeroot
     */
    RemoveRoot(psiRoot) {
        result := ComCall(8, this, "ptr", psiRoot, "HRESULT")
        return result
    }

    /**
     * Removes all roots and their children from a tree.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-removeallroots
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getrootitems
     */
    GetRootItems() {
        result := ComCall(10, this, "ptr*", &ppsiaRootItems := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-setitemstate
     */
    SetItemState(psi, nstcisMask, nstcisFlags) {
        result := ComCall(11, this, "ptr", psi, "uint", nstcisMask, "uint", nstcisFlags, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemstate
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getselecteditems
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemcustomstate
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-setitemcustomstate
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-ensureitemvisible
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-settheme
     */
    SetTheme(pszTheme) {
        pszTheme := pszTheme is String ? StrPtr(pszTheme) : pszTheme

        result := ComCall(17, this, "ptr", pszTheme, "HRESULT")
        return result
    }

    /**
     * Retrieves the next item in the tree according to which method is requested.
     * @remarks
     * If there is no next item for the type selected, this function returns E_FAIL with <b>NULL</b> for the returned item, <i>ppsiNext</i>.
     * @param {IShellItem} psi Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * The Shell item for which the next item is being retrieved. This value can be <b>NULL</b>.
     * @param {NSTCGNI} nstcgi Type: <b>NSTCGNI</b>
     * 
     * The type of the next item. This value can be one of the following flags:
     * @returns {IShellItem} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>**</b>
     * 
     * The address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> that fits the criteria for the next item that was requested.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getnextitem
     */
    GetNextItem(psi, nstcgi) {
        result := ComCall(18, this, "ptr", psi, NSTCGNI, nstcgi, "ptr*", &ppsiNext := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-hittest
     */
    HitTest(ppt) {
        result := ComCall(19, this, POINT.Ptr, ppt, "ptr*", &ppsiOut := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-getitemrect
     */
    GetItemRect(psi) {
        prect := RECT()
        result := ComCall(20, this, "ptr", psi, RECT.Ptr, prect, "HRESULT")
        return prect
    }

    /**
     * Collapses all of the items in the given tree.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-inamespacetreecontrol-collapseall
     */
    CollapseAll() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (INameSpaceTreeControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.TreeAdvise := CallbackCreate(GetMethod(implObj, "TreeAdvise"), flags, 3)
        this.vtbl.TreeUnadvise := CallbackCreate(GetMethod(implObj, "TreeUnadvise"), flags, 2)
        this.vtbl.AppendRoot := CallbackCreate(GetMethod(implObj, "AppendRoot"), flags, 5)
        this.vtbl.InsertRoot := CallbackCreate(GetMethod(implObj, "InsertRoot"), flags, 6)
        this.vtbl.RemoveRoot := CallbackCreate(GetMethod(implObj, "RemoveRoot"), flags, 2)
        this.vtbl.RemoveAllRoots := CallbackCreate(GetMethod(implObj, "RemoveAllRoots"), flags, 1)
        this.vtbl.GetRootItems := CallbackCreate(GetMethod(implObj, "GetRootItems"), flags, 2)
        this.vtbl.SetItemState := CallbackCreate(GetMethod(implObj, "SetItemState"), flags, 4)
        this.vtbl.GetItemState := CallbackCreate(GetMethod(implObj, "GetItemState"), flags, 4)
        this.vtbl.GetSelectedItems := CallbackCreate(GetMethod(implObj, "GetSelectedItems"), flags, 2)
        this.vtbl.GetItemCustomState := CallbackCreate(GetMethod(implObj, "GetItemCustomState"), flags, 3)
        this.vtbl.SetItemCustomState := CallbackCreate(GetMethod(implObj, "SetItemCustomState"), flags, 3)
        this.vtbl.EnsureItemVisible := CallbackCreate(GetMethod(implObj, "EnsureItemVisible"), flags, 2)
        this.vtbl.SetTheme := CallbackCreate(GetMethod(implObj, "SetTheme"), flags, 2)
        this.vtbl.GetNextItem := CallbackCreate(GetMethod(implObj, "GetNextItem"), flags, 4)
        this.vtbl.HitTest := CallbackCreate(GetMethod(implObj, "HitTest"), flags, 3)
        this.vtbl.GetItemRect := CallbackCreate(GetMethod(implObj, "GetItemRect"), flags, 3)
        this.vtbl.CollapseAll := CallbackCreate(GetMethod(implObj, "CollapseAll"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.TreeAdvise)
        CallbackFree(this.vtbl.TreeUnadvise)
        CallbackFree(this.vtbl.AppendRoot)
        CallbackFree(this.vtbl.InsertRoot)
        CallbackFree(this.vtbl.RemoveRoot)
        CallbackFree(this.vtbl.RemoveAllRoots)
        CallbackFree(this.vtbl.GetRootItems)
        CallbackFree(this.vtbl.SetItemState)
        CallbackFree(this.vtbl.GetItemState)
        CallbackFree(this.vtbl.GetSelectedItems)
        CallbackFree(this.vtbl.GetItemCustomState)
        CallbackFree(this.vtbl.SetItemCustomState)
        CallbackFree(this.vtbl.EnsureItemVisible)
        CallbackFree(this.vtbl.SetTheme)
        CallbackFree(this.vtbl.GetNextItem)
        CallbackFree(this.vtbl.HitTest)
        CallbackFree(this.vtbl.GetItemRect)
        CallbackFree(this.vtbl.CollapseAll)
    }
}
