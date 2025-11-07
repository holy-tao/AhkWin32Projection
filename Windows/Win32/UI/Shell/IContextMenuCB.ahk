#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that enables the callback of a context menu. For example, to add a shield icon to a menuItem that requires elevation.
 * @remarks
 * 
 * This is the callback interface specified in the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-defcontextmenu">DEFCONTEXTMENU</a> structure passed with the function <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreatedefaultcontextmenu">SHCreateDefaultContextMenu</a>.
 * 
 * This interface enables <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> implementations to manage context menu messages before, after, and during the context menu handling of these messages.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icontextmenucb
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IContextMenuCB extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextMenuCB
     * @type {Guid}
     */
    static IID => Guid("{3409e930-5a39-11d1-83fa-00a0c90dc849}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CallBack"]

    /**
     * 
     * @param {IShellFolder} psf 
     * @param {HWND} hwndOwner 
     * @param {IDataObject} pdtobj 
     * @param {Integer} uMsg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenucb-callback
     */
    CallBack(psf, hwndOwner, pdtobj, uMsg, wParam, lParam) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", psf, "ptr", hwndOwner, "ptr", pdtobj, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }
}
