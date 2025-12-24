#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method through which a client can provide an owner window to a Windows Runtime object used in a desktop application.
 * @remarks
 * 
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Implement this interface if your object needs to be provided with an owner window, generally to display UI. Most third-party applications will not need to implement this interface.
 * 
 * <h3><a id="When_to_use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to use</h3>
 * Use this interface if you will provide a window to an object. A common scenario in which this interface is used is a Windows Store desktop browser.
 * 
 * This interface is implemented by the following objects. Note that this is necessarily an incomplete list; refer to an individual object's documentation to determine whether that object implements this interface.
 * 
 *                 
 * 
 * <ul>
 * <li><a href="https://docs.microsoft.com/uwp/api/Windows.Devices.Enumeration.DevicePicker">Windows.Devices.Enumeration.DevicePicker</a></li>
 * <li><a href="https://docs.microsoft.com/uwp/api/Windows.UI.Popups.PopupMenu">Windows.UI.Popups.PopupMenu</a></li>
 * <li><a href="https://docs.microsoft.com/uwp/api/Windows.UI.Popups.MessageDialog">Windows.UI.Popups.MessageDialog</a></li>
 * <li><a href="https://docs.microsoft.com/uwp/api/Windows.Services.Store.StoreContext">Windows.Services.Store.StoreContext</a></li>
 * <li><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.Pickers.FileOpenPicker">Windows.Storage.Pickers.FileOpenPicker</a></li>
 * <li><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.Pickers.FileSavePicker">Windows.Storage.Pickers.FileSavePicker</a></li>
 * <li><a href="https://docs.microsoft.com/uwp/api/Windows.Storage.Pickers.FolderPicker">Windows.Storage.Pickers.FolderPicker</a></li>
 * <li><a href="https://docs.microsoft.com/windows/desktop/shell/dataobject">CLSID_DragDropHelper</a></li>
 * </ul>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iinitializewithwindow
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IInitializeWithWindow extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitializeWithWindow
     * @type {Guid}
     */
    static IID => Guid("{3e68d4bd-7135-4d10-8018-9fb6d9f33fa1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

    /**
     * Specifies an owner window to be used by a Windows Runtime object that is used in a desktop app.
     * @param {HWND} hwnd The handle of the window to be used as the owner window.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iinitializewithwindow-initialize
     */
    Initialize(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(3, this, "ptr", hwnd, "HRESULT")
        return result
    }
}
