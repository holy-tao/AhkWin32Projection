#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that enable an application to interact with groups of windows that form virtual workspaces.
 * @remarks
 * The user can group a collection of windows together to create a virtual desktop. Every window is considered to be part of a virtual desktop. When one virtual desktop is hidden, all of the windows associated with it are also hidden. This enables the user to create multiple working environments and to be able to switch between them. Similarly, when a virtual desktop is selected to be active, the windows associated with that virtual desktop are displayed on the screen.
 * 
 * To support this concept, applications should avoid automatically switching the user from one virtual desktop to another. Only the user should instigate that change. In order to support this, newly created windows should appear on the currently active virtual desktop. In addition, if an application can reuse currently active windows, it should only reuse windows if they are on the currently active virtual desktop. Otherwise, a new window should be created.
 * 
 * <img alt="Virtual desktop visualization" src="./images/VirtualDesktops.png"/>
 * In the above image, the user has two virtual desktops and <b>VD2</b> is the currently active virtual desktop. If the user clicks a link in an outlook message, there's a URI activation that should open the link in an Internet Explorer window. If the user has configured IE to open links in the current window, it would normally use the currently open window. However, in this case, IE is on an inactive virtual desktop. In this scenario, IE should create a new window in the currently active virtual desktop.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ivirtualdesktopmanager
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IVirtualDesktopManager extends IUnknown {
    /**
     * The interface identifier for IVirtualDesktopManager
     * @type {Guid}
     */
    static IID := Guid("{a5cd92ff-29be-454c-8d04-d82879fb3f1b}")

    /**
     * The class identifier for VirtualDesktopManager
     * @type {Guid}
     */
    static CLSID := Guid("{aa509086-5ca9-4c25-8f95-589d3c07b48a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVirtualDesktopManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsWindowOnCurrentVirtualDesktop : IntPtr
        GetWindowDesktopId              : IntPtr
        MoveWindowToDesktop             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVirtualDesktopManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates whether the provided window is on the currently active virtual desktop.
     * @param {HWND} topLevelWindow The window of interest.
     * @returns {BOOL} <b>True</b> if the <i>topLevelWindow</i> is on the currently active virtual desktop, otherwise <b>false</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ivirtualdesktopmanager-iswindowoncurrentvirtualdesktop
     */
    IsWindowOnCurrentVirtualDesktop(topLevelWindow) {
        result := ComCall(3, this, HWND, topLevelWindow, BOOL.Ptr, &onCurrentDesktop := 0, "HRESULT")
        return onCurrentDesktop
    }

    /**
     * Gets the identifier for the virtual desktop hosting the provided top-level window.
     * @param {HWND} topLevelWindow The top level window for the virtual desktop you are interested in.
     * @returns {Guid} The identifier for the virtual desktop hosting the <i>topLevelWindow</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ivirtualdesktopmanager-getwindowdesktopid
     */
    GetWindowDesktopId(topLevelWindow) {
        desktopId := Guid()
        result := ComCall(4, this, HWND, topLevelWindow, Guid.Ptr, desktopId, "HRESULT")
        return desktopId
    }

    /**
     * Moves a window to the specified virtual desktop.
     * @param {HWND} topLevelWindow The window to move.
     * @param {Pointer<Guid>} desktopId The identifier of the virtual desktop to move the [GetWindowDesktopId](./nf-shobjidl_core-ivirtualdesktopmanager-getwindowdesktopid.md) to get a window's identifier.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ivirtualdesktopmanager-movewindowtodesktop
     */
    MoveWindowToDesktop(topLevelWindow, desktopId) {
        result := ComCall(5, this, HWND, topLevelWindow, Guid.Ptr, desktopId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVirtualDesktopManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsWindowOnCurrentVirtualDesktop := CallbackCreate(GetMethod(implObj, "IsWindowOnCurrentVirtualDesktop"), flags, 3)
        this.vtbl.GetWindowDesktopId := CallbackCreate(GetMethod(implObj, "GetWindowDesktopId"), flags, 3)
        this.vtbl.MoveWindowToDesktop := CallbackCreate(GetMethod(implObj, "MoveWindowToDesktop"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsWindowOnCurrentVirtualDesktop)
        CallbackFree(this.vtbl.GetWindowDesktopId)
        CallbackFree(this.vtbl.MoveWindowToDesktop)
    }
}
