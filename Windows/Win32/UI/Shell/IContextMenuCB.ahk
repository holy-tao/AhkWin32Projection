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
     * Enables the callback function for a context menu.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface of the object that supports the <b>IContextMenuCB::CallBack</b> interface. The context menu interface is returned on a call to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">GetUIObjectOf</a>.
     * @param {HWND} hwndOwner Type: <b>HWND</b>
     * 
     * A handle to the owner of the context menu. This value can be <b>NULL</b>.
     * @param {IDataObject} pdtobj Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> that contains information about a menu selection. Implement interface <b>IDataObject</b>, or call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shcreatedataobject">SHCreateDataObject</a> for the default implementation.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * A notification from the Shell's default menu implementation. For example, the default menu implementation calls <a href="https://docs.microsoft.com/windows/desktop/shell/registering-control-panel-items">DFM_MERGECONTEXTMENU</a> to allow the implementer of <b>IContextMenuCB::CallBack</b> to remove, add, or disable context menu items in this callback. Use one of the following notifications.
     * 
     *                     
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/registering-control-panel-items">DFM_MERGECONTEXTMENU</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/preview-handler-guidelines">DFM_INVOKECOMMAND</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/miscellaneous-topics-bumper">DFM_GETHELPTEXT</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/navigating-the-shell-namespace-bumper">DFM_GETHELPTEXTW</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/dfm-wm-measureitem">DFM_WM_MEASUREITEM</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/dfm-wm-drawitem">DFM_WM_DRAWITEM</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/samples-automaticjumplist">DFM_WM_INITMENUPOPUP</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/samples-appusermodelidwindowproperty">DFM_VALIDATECMD</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/prophand-content-view">DFM_INVOKECOMMANDEX</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/propsheet-handlers">DFM_MAPCOMMANDNAME</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/library-ovw">DFM_GETDEFSTATICID</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/nse-junction">DFM_GETVERB</a>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/reg-middleware-apps">DFM_MERGECONTEXTMENU_BOTTOM</a>
     * </td>
     * </tr>
     * </table>
     * @param {WPARAM} wParam Type: <b>WPARAM</b>
     * 
     * Data specific to the notification specified in <i>uMsg</i>. See the individual notification page for specific requirements.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Data specific to the notification specified in <i>uMsg</i>. See the individual notification page for specific requirements.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-icontextmenucb-callback
     */
    CallBack(psf, hwndOwner, pdtobj, uMsg, wParam, lParam) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(3, this, "ptr", psf, "ptr", hwndOwner, "ptr", pdtobj, "uint", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }
}
