#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SMDATA.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that interact with Shell menus such as the Start menu, and the Favorites menu.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with the <i>rclsid</i> parameter set to CLSID_MenuBand and the <i>riid</i> parameter set to IID_IShellMenu. You must first initialize the interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-initialize">IShellMenu::Initialize</a>, and then initialize the menu band by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellmenu-setshellfolder">IShellMenu::SetShellFolder</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellmenu
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellMenu extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellMenu
     * @type {Guid}
     */
    static IID => Guid("{ee1f7637-e138-11d1-8379-00c04fd918d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetMenuInfo", "SetShellFolder", "GetShellFolder", "SetMenu", "GetMenu", "InvalidateItem", "GetState", "SetMenuToolbar"]

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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellmenu-initialize
     */
    Initialize(psmc, uId, uIdAncestor, dwFlags) {
        result := ComCall(3, this, "ptr", psmc, "uint", uId, "uint", uIdAncestor, "uint", dwFlags, "HRESULT")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellmenu-getmenuinfo
     */
    GetMenuInfo(ppsmc, puId, puIdAncestor, pdwFlags) {
        puIdMarshal := puId is VarRef ? "uint*" : "ptr"
        puIdAncestorMarshal := puIdAncestor is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr*", ppsmc, puIdMarshal, puId, puIdAncestorMarshal, puIdAncestor, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * Specifies the folder for the menu band to browse.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface. This pointer can be <b>NULL</b>.
     * @param {Pointer<ITEMIDLIST>} pidlFolder Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * The folder's fully qualified <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-itemidlist">ITEMIDLIST</a>. This value can be <b>NULL</b>.
     * @param {HKEY} hKey Type: <b>HKEY</b>
     * 
     * An HKEY with an "Order" value that is used to store the order of the menu. This value can be <b>NULL</b>.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that specify how the menu band operates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellmenu-setshellfolder
     */
    SetShellFolder(psf, pidlFolder, hKey, dwFlags) {
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := ComCall(5, this, "ptr", psf, "ptr", pidlFolder, "ptr", hKey, "uint", dwFlags, "HRESULT")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellmenu-getshellfolder
     */
    GetShellFolder(pdwFlags, ppidl, riid, ppv) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        ppidlMarshal := ppidl is VarRef ? "ptr*" : "ptr"
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pdwFlagsMarshal, pdwFlags, ppidlMarshal, ppidl, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * Appends a static menu to the menu band.
     * @param {HMENU} hmenu Type: <b>HMENU</b>
     * 
     * The handle of the static menu that is to be appended. This value can be <b>NULL</b>.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The <b>HWND</b> of the owner window. This value can be <b>NULL</b>.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Flags that specify how the menu operates.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellmenu-setmenu
     */
    SetMenu(hmenu, hwnd, dwFlags) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(7, this, "ptr", hmenu, "ptr", hwnd, "uint", dwFlags, "HRESULT")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellmenu-getmenu
     */
    GetMenu(phmenu, phwnd, pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", phmenu, "ptr", phwnd, pdwFlagsMarshal, pdwFlags, "HRESULT")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellmenu-invalidateitem
     */
    InvalidateItem(psmd, dwFlags) {
        result := ComCall(9, this, "ptr", psmd, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Gets a filled SMDATA structure.
     * @returns {SMDATA} Type: <b>LPSMDATA</b>
     * 
     * When this method returns, contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-smdata">SMDATA</a> structure that contains information about the menu band.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellmenu-getstate
     */
    GetState() {
        psmd := SMDATA()
        result := ComCall(10, this, "ptr", psmd, "HRESULT")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellmenu-setmenutoolbar
     */
    SetMenuToolbar(punk, dwFlags) {
        result := ComCall(11, this, "ptr", punk, "uint", dwFlags, "HRESULT")
        return result
    }
}
