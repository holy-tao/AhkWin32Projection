#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that control the taskbar. It allows you to dynamically add, remove, and activate items on the taskbar.
 * @remarks
 * You do not implement <b>ITaskbarList</b>; it is implemented by the Shell.
 * 
 * Use <b>ITaskbarList</b> to add items to the taskbar, remove items from the taskbar, and activate items on the taskbar.
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/shell/taskbar">Modifying Contents of the Taskbar</a> for more information about using this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-itaskbarlist
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
     * Initializes the taskbar list object. This method must be called before any other ITaskbarList methods can be called.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. If the method fails, no other methods can be called. The calling application should release the interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-itaskbarlist-hrinit
     */
    HrInit() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an item to the taskbar.
     * @remarks
     * Any type of window can be added to the taskbar, but it is recommended that the window at least have the <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_CAPTION</a> style.
     * 
     * Any window added with this method must be removed with the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-deletetab">DeleteTab</a> method when the added window is destroyed.
     * @param {HWND} hwnd_ Type: <b>HWND</b>
     * 
     * A handle to the window to be added to the taskbar.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-itaskbarlist-addtab
     */
    AddTab(hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(4, this, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes an item from the taskbar.
     * @param {HWND} hwnd_ Type: <b>HWND</b>
     * 
     * A handle to the window to be deleted from the taskbar.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-itaskbarlist-deletetab
     */
    DeleteTab(hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(5, this, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Activates an item on the taskbar. The window is not actually activated; the window's item on the taskbar is merely displayed as active.
     * @param {HWND} hwnd_ Type: <b>HWND</b>
     * 
     * A handle to the window on the taskbar to be displayed as active.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-itaskbarlist-activatetab
     */
    ActivateTab(hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(6, this, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Marks a taskbar item as active but does not visually activate it.
     * @remarks
     * <b>SetActiveAlt</b> marks the item associated with <i>hwnd</i> as the currently active item for the window's process without changing the pressed state of any item. Any user action that would activate a different tab in that process will activate the tab associated with <i>hwnd</i> instead. The active state of the window's item is not guaranteed to be preserved when the process associated with <i>hwnd</i> is not active. To ensure that a given tab is always active, call <b>SetActiveAlt</b> whenever any of your windows are activated. Calling <b>SetActiveAlt</b> with a <b>NULL</b> <i>hwnd</i> clears this state.
     * @param {HWND} hwnd_ Type: <b>HWND</b>
     * 
     * A handle to the window to be marked as active.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-itaskbarlist-setactivealt
     */
    SetActiveAlt(hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(7, this, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
