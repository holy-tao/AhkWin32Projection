#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "Common\ITEMIDLIST.ahk" { ITEMIDLIST }
#Import ".\IShellFolder.ahk" { IShellFolder }
#Import ".\IShellMenuCallback.ahk" { IShellMenuCallback }
#Import ".\SMDATA.ahk" { SMDATA }
#Import "..\WindowsAndMessaging\HMENU.ahk" { HMENU }

/**
 * Exposes methods that interact with Shell menus such as the Start menu, and the Favorites menu.
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with the <i>rclsid</i> parameter set to CLSID_MenuBand and the <i>riid</i> parameter set to IID_IShellMenu. You must first initialize the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-initialize">IShellMenu::Initialize</a>, and then initialize the menu band by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-setshellfolder">IShellMenu::SetShellFolder</a>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellmenu
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellMenu extends IUnknown {
    /**
     * The interface identifier for IShellMenu
     * @type {Guid}
     */
    static IID := Guid("{ee1f7637-e138-11d1-8379-00c04fd918d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellMenu interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize     : IntPtr
        GetMenuInfo    : IntPtr
        SetShellFolder : IntPtr
        GetShellFolder : IntPtr
        SetMenu        : IntPtr
        GetMenu        : IntPtr
        InvalidateItem : IntPtr
        GetState       : IntPtr
        SetMenuToolbar : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellMenu.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a menu band.
     * @param {IShellMenuCallback} psmc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellmenucallback">IShellMenuCallback</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellmenucallback">IShellMenuCallback</a> interface. This interface receives notifications from the menu. This value can be <b>NULL</b>.
     * @param {Integer} uId Type: <b>UINT</b>
     * 
     * The identifier of the selected menu item. Set this parameter to -1 for the menu itself.
     * @param {Integer} uIdAncestor Type: <b>UINT</b>
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that control how the menu operates.
     * 
     * 
     * A combination of the following option values:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_DEFAULT"></a><a id="sminit_default"></a><dl>
     * <dt><b>SMINIT_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No options.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_RESTRICT_DRAGDROP"></a><a id="sminit_restrict_dragdrop"></a><dl>
     * <dt><b>SMINIT_RESTRICT_DRAGDROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not allow drag-and-drop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_TOPLEVEL"></a><a id="sminit_toplevel"></a><dl>
     * <dt><b>SMINIT_TOPLEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is the top band.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_CACHED"></a><a id="sminit_cached"></a><dl>
     * <dt><b>SMINIT_CACHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not destroy the band when the window is closed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * In addition to the values above, one of the following layout options:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_VERTICAL"></a><a id="sminit_vertical"></a><dl>
     * <dt><b>SMINIT_VERTICAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a vertical band.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_HORIZONTAL"></a><a id="sminit_horizontal"></a><dl>
     * <dt><b>SMINIT_HORIZONTAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a horizontal band.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenu-initialize
     */
    Initialize(psmc, uId, uIdAncestor, dwFlags) {
        psmcMarshal := psmc == 0 ? IntPtr : "ptr"

        result := ComCall(3, this, psmcMarshal, psmc, UInt32, uId, UInt32, uIdAncestor, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * Gets information from the IShellMenu::Initialize method.
     * @param {Pointer<IShellMenuCallback>} ppsmc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellmenucallback">IShellMenuCallback</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellmenucallback">IShellMenuCallback</a> interface that you specified when you called <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-initialize">IShellMenu::Initialize</a>. This pointer can be <b>NULL</b>.
     * @param {Pointer<Integer>} puId Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to a <b>UINT</b> value that receives the <i>uID</i> value that you specified when you called <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-initialize">IShellMenu::Initialize</a>. This pointer can be <b>NULL</b>.
     * @param {Pointer<Integer>} puIdAncestor Type: <b>UINT*</b>
     * 
     * When this method returns, contains a pointer to a <b>UINT</b> value that receives the <i>uIdAncestor</i> value that you specified when you called <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-initialize">IShellMenu::Initialize</a>. This pointer can be <b>NULL</b>.
     * @param {Pointer<Integer>} pdwFlags Type: <b>DWORD*</b>
     * 
     * When this method returns, contains a pointer to a <b>DWORD</b> value that receives the <i>dwFlags</i> value that you specified when you called <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-initialize">IShellMenu::Initialize</a>. This pointer can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenu-getmenuinfo
     */
    GetMenuInfo(ppsmc, puId, puIdAncestor, pdwFlags) {
        ppsmcMarshal := ppsmc == 0 ? IntPtr : IShellMenuCallback.Ptr
        puIdMarshal := puId is VarRef ? "uint*" : IntPtr
        puIdMarshal := puId == 0 ? IntPtr : "uint*"
        puIdAncestorMarshal := puIdAncestor is VarRef ? "uint*" : IntPtr
        puIdAncestorMarshal := puIdAncestor == 0 ? IntPtr : "uint*"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : IntPtr
        pdwFlagsMarshal := pdwFlags == 0 ? IntPtr : "uint*"

        result := ComCall(4, this, ppsmcMarshal, ppsmc, puIdMarshal, puId, puIdAncestorMarshal, puIdAncestor, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Specifies the folder for the menu band to browse.
     * @remarks
     * Call this method after you call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-initialize">IShellMenu::Initialize</a>.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface. This pointer can be <b>NULL</b>.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The folder's fully qualified <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a>. This value can be <b>NULL</b>.
     * @param {HKEY} _hKey Type: <b>HKEY</b>
     * 
     * An HKEY with an "Order" value that is used to store the order of the menu. This value can be <b>NULL</b>.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that specify how the menu band operates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenu-setshellfolder
     */
    SetShellFolder(psf, pidlFolder, _hKey, dwFlags) {
        psfMarshal := psf == 0 ? IntPtr : "ptr"
        pidlFolderMarshal := pidlFolder == 0 ? IntPtr : ITEMIDLIST.Ptr
        _hKeyMarshal := _hKey == 0 ? IntPtr : HKEY

        result := ComCall(5, this, psfMarshal, psf, pidlFolderMarshal, pidlFolder, _hKeyMarshal, _hKey, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * Gets the folder that the menu band is set to browse.
     * @param {Pointer<Integer>} pdwFlags Type: <b>DWORD*</b>
     * 
     * When this method returns successfully, contains a pointer to a set of flag values that specify how the menu band operates.
     * 
     * 
     * Can return any of the following flags.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_DEFAULT"></a><a id="sminit_default"></a><dl>
     * <dt><b>SMINIT_DEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No options.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_RESTRICT_DRAGDROP"></a><a id="sminit_restrict_dragdrop"></a><dl>
     * <dt><b>SMINIT_RESTRICT_DRAGDROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not allow drag-and-drop.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_TOPLEVEL"></a><a id="sminit_toplevel"></a><dl>
     * <dt><b>SMINIT_TOPLEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This is the top band.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_CACHED"></a><a id="sminit_cached"></a><dl>
     * <dt><b>SMINIT_CACHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not destroy the band when the window is closed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * Always returns one of the following flags.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_VERTICAL"></a><a id="sminit_vertical"></a><dl>
     * <dt><b>SMINIT_VERTICAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a vertical band.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SMINIT_HORIZONTAL"></a><a id="sminit_horizontal"></a><dl>
     * <dt><b>SMINIT_HORIZONTAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies a horizontal band.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<ITEMIDLIST>>} ppidl Type: <b>PCIDLIST_ABSOLUTE*</b>
     * 
     * When this method returns, contains the address of the folder's fully qualified <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The REFIID for the target folder.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void**</b>
     * 
     * When this method returns successfully, contains the address of a pointer to the Shell folder object referenced by the <i>riid</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenu-getshellfolder
     */
    GetShellFolder(pdwFlags, ppidl, riid, ppv) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : IntPtr
        ppidlMarshal := ppidl is VarRef ? "ptr*" : IntPtr
        ppvMarshal := ppv is VarRef ? "ptr*" : IntPtr

        result := ComCall(6, this, pdwFlagsMarshal, pdwFlags, ppidlMarshal, ppidl, Guid.Ptr, riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * Appends a static menu to the menu band.
     * @param {HMENU} _hmenu Type: <b>HMENU</b>
     * 
     * The handle of the static menu that is to be appended. This value can be <b>NULL</b>.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * The <b>HWND</b> of the owner window. This value can be <b>NULL</b>.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that specify how the menu operates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenu-setmenu
     */
    SetMenu(_hmenu, _hwnd, dwFlags) {
        _hmenuMarshal := _hmenu == 0 ? IntPtr : HMENU
        _hwndMarshal := _hwnd == 0 ? IntPtr : HWND

        result := ComCall(7, this, _hmenuMarshal, _hmenu, _hwndMarshal, _hwnd, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * Gets the menu information set by calling IShellMenu::SetMenu.
     * @param {Pointer<HMENU>} phmenu Type: <b>HMENU*</b>
     * 
     * When this method returns, contains a pointer to an <b>HMENU</b> value that receives the <i>hmenu</i> value that you specified when you called <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-setmenu">IShellMenu::SetMenu</a>. This value can be <b>NULL</b>.
     * @param {Pointer<HWND>} phwnd Type: <b>HWND*</b>
     * 
     * When this method returns, contains a pointer to an <b>HWND</b> value that receives the <i>hwnd</i> value that you specified when you called <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-setmenu">IShellMenu::SetMenu</a>. This value can be <b>NULL</b>.
     * @param {Pointer<Integer>} pdwFlags Type: <b>DWORD*</b>
     * 
     * When this method returns, contains a pointer to a <b>DWORD</b> value that receives the <i>dwFlags</i> value that you specified when you called <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-setmenu">IShellMenu::SetMenu</a>. This value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenu-getmenu
     */
    GetMenu(phmenu, phwnd, pdwFlags) {
        phmenuMarshal := phmenu == 0 ? IntPtr : HMENU.Ptr
        phwndMarshal := phwnd == 0 ? IntPtr : HWND.Ptr
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : IntPtr
        pdwFlagsMarshal := pdwFlags == 0 ? IntPtr : "uint*"

        result := ComCall(8, this, phmenuMarshal, phmenu, phwndMarshal, phwnd, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Redraws an item in a menu band.
     * @param {Pointer<SMDATA>} psmd Type: <b>LPSMDATA</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-smdata">SMDATA</a> structure that identifies the item to be redrawn. Set this value to <b>NULL</b> to redraw the entire menu.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that control how the menu is redrawn. If <i>psmd</i> is <b>NULL</b>, set <i>dwFlags</i> to SMINV_REFRESH. If <i>psmd</i> is set to a valid <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-smdata">SMDATA</a> structure, set <i>dwFlags</i> to SMINV_ID | SMINV_REFRESH.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenu-invalidateitem
     */
    InvalidateItem(psmd, dwFlags) {
        psmdMarshal := psmd == 0 ? IntPtr : SMDATA.Ptr

        result := ComCall(9, this, psmdMarshal, psmd, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * Gets a filled SMDATA structure.
     * @returns {SMDATA} Type: <b>LPSMDATA</b>
     * 
     * When this method returns, contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-smdata">SMDATA</a> structure that contains information about the menu band.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenu-getstate
     */
    GetState() {
        psmd := SMDATA()
        result := ComCall(10, this, SMDATA.Ptr, psmd, "HRESULT")
        return psmd
    }

    /**
     * Adds a menu to the menuband.
     * @param {IUnknown} punk Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to an object that supports <b>CLSID_MenuToolbarBase</b> in its <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that control how the menu operates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellmenu-setmenutoolbar
     */
    SetMenuToolbar(punk, dwFlags) {
        result := ComCall(11, this, "ptr", punk, UInt32, dwFlags, "HRESULT")
        return result
    }

    _Query(iid) {
        if (IShellMenu.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(ObjBindMethod(implObj, "Initialize"), flags, 5)
        this.vtbl.GetMenuInfo := CallbackCreate(ObjBindMethod(implObj, "GetMenuInfo"), flags, 5)
        this.vtbl.SetShellFolder := CallbackCreate(ObjBindMethod(implObj, "SetShellFolder"), flags, 5)
        this.vtbl.GetShellFolder := CallbackCreate(ObjBindMethod(implObj, "GetShellFolder"), flags, 5)
        this.vtbl.SetMenu := CallbackCreate(ObjBindMethod(implObj, "SetMenu"), flags, 4)
        this.vtbl.GetMenu := CallbackCreate(ObjBindMethod(implObj, "GetMenu"), flags, 4)
        this.vtbl.InvalidateItem := CallbackCreate(ObjBindMethod(implObj, "InvalidateItem"), flags, 3)
        this.vtbl.GetState := CallbackCreate(ObjBindMethod(implObj, "GetState"), flags, 2)
        this.vtbl.SetMenuToolbar := CallbackCreate(ObjBindMethod(implObj, "SetMenuToolbar"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetMenuInfo)
        CallbackFree(this.vtbl.SetShellFolder)
        CallbackFree(this.vtbl.GetShellFolder)
        CallbackFree(this.vtbl.SetMenu)
        CallbackFree(this.vtbl.GetMenu)
        CallbackFree(this.vtbl.InvalidateItem)
        CallbackFree(this.vtbl.GetState)
        CallbackFree(this.vtbl.SetMenuToolbar)
    }
}
