#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that control the taskbar. It allows you to dynamically add, remove, and activate items on the taskbar.
 * @remarks
 * 
  * You do not implement <b>ITaskbarList</b>; it is implemented by the Shell.
  * 
  * Use <b>ITaskbarList</b> to add items to the taskbar, remove items from the taskbar, and activate items on the taskbar.
  * 
  * See <a href="https://docs.microsoft.com/windows/desktop/shell/taskbar">Modifying Contents of the Taskbar</a> for more information about using this interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-itaskbarlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITaskbarList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskbarList
     * @type {Guid}
     */
    static IID => Guid("{56fdf342-fd6d-11d0-958a-006097c9a090}")

    /**
     * The class identifier for TaskbarList
     * @type {Guid}
     */
    static CLSID => Guid("{56fdf344-fd6d-11d0-958a-006097c9a090}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HrInit", "AddTab", "DeleteTab", "ActivateTab", "SetActiveAlt"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-hrinit
     */
    HrInit() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-addtab
     */
    AddTab(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-deletetab
     */
    DeleteTab(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(5, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-activatetab
     */
    ActivateTab(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-setactivealt
     */
    SetActiveAlt(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(7, this, "ptr", hwnd, "HRESULT")
        return result
    }
}
