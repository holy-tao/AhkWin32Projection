#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that control the taskbar. It allows you to dynamically add, remove, and activate items on the taskbar.
 * @remarks
 * You do not implement <b>ITaskbarList</b>; it is implemented by the Shell.
 * 
 * Use <b>ITaskbarList</b> to add items to the taskbar, remove items from the taskbar, and activate items on the taskbar.
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/shell/taskbar">Modifying Contents of the Taskbar</a> for more information about using this interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itaskbarlist
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ITaskbarList extends IUnknown {
    /**
     * The interface identifier for ITaskbarList
     * @type {Guid}
     */
    static IID := Guid("{56fdf342-fd6d-11d0-958a-006097c9a090}")

    /**
     * The class identifier for TaskbarList
     * @type {Guid}
     */
    static CLSID := Guid("{56fdf344-fd6d-11d0-958a-006097c9a090}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskbarList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HrInit       : IntPtr
        AddTab       : IntPtr
        DeleteTab    : IntPtr
        ActivateTab  : IntPtr
        SetActiveAlt : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskbarList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the taskbar list object. This method must be called before any other ITaskbarList methods can be called.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise. If the method fails, no other methods can be called. The calling application should release the interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-hrinit
     */
    HrInit() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Adds an item to the taskbar.
     * @remarks
     * Any type of window can be added to the taskbar, but it is recommended that the window at least have the <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">WS_CAPTION</a> style.
     * 
     * Any window added with this method must be removed with the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-deletetab">DeleteTab</a> method when the added window is destroyed.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * A handle to the window to be added to the taskbar.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-addtab
     */
    AddTab(_hwnd) {
        result := ComCall(4, this, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * Deletes an item from the taskbar.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * A handle to the window to be deleted from the taskbar.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-deletetab
     */
    DeleteTab(_hwnd) {
        result := ComCall(5, this, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * Activates an item on the taskbar. The window is not actually activated; the window's item on the taskbar is merely displayed as active.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * A handle to the window on the taskbar to be displayed as active.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-activatetab
     */
    ActivateTab(_hwnd) {
        result := ComCall(6, this, HWND, _hwnd, "HRESULT")
        return result
    }

    /**
     * Marks a taskbar item as active but does not visually activate it.
     * @remarks
     * <b>SetActiveAlt</b> marks the item associated with <i>hwnd</i> as the currently active item for the window's process without changing the pressed state of any item. Any user action that would activate a different tab in that process will activate the tab associated with <i>hwnd</i> instead. The active state of the window's item is not guaranteed to be preserved when the process associated with <i>hwnd</i> is not active. To ensure that a given tab is always active, call <b>SetActiveAlt</b> whenever any of your windows are activated. Calling <b>SetActiveAlt</b> with a <b>NULL</b> <i>hwnd</i> clears this state.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * A handle to the window to be marked as active.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itaskbarlist-setactivealt
     */
    SetActiveAlt(_hwnd) {
        result := ComCall(7, this, HWND, _hwnd, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITaskbarList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HrInit := CallbackCreate(GetMethod(implObj, "HrInit"), flags, 1)
        this.vtbl.AddTab := CallbackCreate(GetMethod(implObj, "AddTab"), flags, 2)
        this.vtbl.DeleteTab := CallbackCreate(GetMethod(implObj, "DeleteTab"), flags, 2)
        this.vtbl.ActivateTab := CallbackCreate(GetMethod(implObj, "ActivateTab"), flags, 2)
        this.vtbl.SetActiveAlt := CallbackCreate(GetMethod(implObj, "SetActiveAlt"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HrInit)
        CallbackFree(this.vtbl.AddTab)
        CallbackFree(this.vtbl.DeleteTab)
        CallbackFree(this.vtbl.ActivateTab)
        CallbackFree(this.vtbl.SetActiveAlt)
    }
}
