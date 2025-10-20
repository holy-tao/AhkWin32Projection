#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IShellMenuCallback>} psmc 
     * @param {Integer} uId 
     * @param {Integer} uIdAncestor 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(psmc, uId, uIdAncestor, dwFlags) {
        result := ComCall(3, this, "ptr", psmc, "uint", uId, "uint", uIdAncestor, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves information about a specified menu.
     * @param {Pointer<IShellMenuCallback>} ppsmc 
     * @param {Pointer<UInt32>} puId 
     * @param {Pointer<UInt32>} puIdAncestor 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero. 
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmenuinfo
     */
    GetMenuInfo(ppsmc, puId, puIdAncestor, pdwFlags) {
        result := ComCall(4, this, "ptr", ppsmc, "uint*", puId, "uint*", puIdAncestor, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellFolder>} psf 
     * @param {Pointer<ITEMIDLIST>} pidlFolder 
     * @param {HKEY} hKey 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetShellFolder(psf, pidlFolder, hKey, dwFlags) {
        hKey := hKey is Win32Handle ? NumGet(hKey, "ptr") : hKey

        result := ComCall(5, this, "ptr", psf, "ptr", pidlFolder, "ptr", hKey, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @param {Pointer<ITEMIDLIST>} ppidl 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetShellFolder(pdwFlags, ppidl, riid, ppv) {
        result := ComCall(6, this, "uint*", pdwFlags, "ptr", ppidl, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Assigns a new menu to the specified window.
     * @param {HMENU} hmenu 
     * @param {HWND} hwnd 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setmenu
     */
    SetMenu(hmenu, hwnd, dwFlags) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(7, this, "ptr", hmenu, "ptr", hwnd, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a handle to the menu assigned to the specified window.
     * @param {Pointer<HMENU>} phmenu 
     * @param {Pointer<HWND>} phwnd 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} Type: <b>HMENU</b>
     * 
     * The return value is a handle to the menu. If the specified window has no menu, the return value is <b>NULL</b>. If the window is a child window, the return value is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getmenu
     */
    GetMenu(phmenu, phwnd, pdwFlags) {
        result := ComCall(8, this, "ptr", phmenu, "ptr", phwnd, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SMDATA>} psmd 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    InvalidateItem(psmd, dwFlags) {
        result := ComCall(9, this, "ptr", psmd, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SMDATA>} psmd 
     * @returns {HRESULT} 
     */
    GetState(psmd) {
        result := ComCall(10, this, "ptr", psmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetMenuToolbar(punk, dwFlags) {
        result := ComCall(11, this, "ptr", punk, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
