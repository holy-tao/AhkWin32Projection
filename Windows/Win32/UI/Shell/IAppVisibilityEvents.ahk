#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MONITOR_APP_VISIBILITY.ahk" { MONITOR_APP_VISIBILITY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * Enables applications to receive notifications of state changes in a display and of changes in Start screen visibility.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iappvisibilityevents
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IAppVisibilityEvents extends IUnknown {
    /**
     * The interface identifier for IAppVisibilityEvents
     * @type {Guid}
     */
    static IID := Guid("{6584ce6b-7d82-49c2-89c9-c6bc02ba8c38}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppVisibilityEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AppVisibilityOnMonitorChanged : IntPtr
        LauncherVisibilityChange      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppVisibilityEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies a client that the mode of a display has changed.
     * @param {HMONITOR} _hMonitor The display that has a changing mode.
     * @param {MONITOR_APP_VISIBILITY} previousMode The previous mode of <i>hMonitor</i>, which may be <b>MAV_UNKNOWN</b>  if the client was unaware of the display previously.
     * @param {MONITOR_APP_VISIBILITY} currentMode The current mode of <i>hMonitor</i>, which will not be <b>MAV_UNKNOWN</b>.
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iappvisibilityevents-appvisibilityonmonitorchanged
     */
    AppVisibilityOnMonitorChanged(_hMonitor, previousMode, currentMode) {
        result := ComCall(3, this, HMONITOR, _hMonitor, MONITOR_APP_VISIBILITY, previousMode, MONITOR_APP_VISIBILITY, currentMode, "HRESULT")
        return result
    }

    /**
     * Notifies a client that visibility of the Start screen has changed.
     * @param {BOOL} currentVisibleState <b>TRUE</b> if the Start screen is displayed; otherwise, <b>FALSE.</b>
     * @returns {HRESULT} The return value is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iappvisibilityevents-launchervisibilitychange
     */
    LauncherVisibilityChange(currentVisibleState) {
        result := ComCall(4, this, BOOL, currentVisibleState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppVisibilityEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AppVisibilityOnMonitorChanged := CallbackCreate(GetMethod(implObj, "AppVisibilityOnMonitorChanged"), flags, 4)
        this.vtbl.LauncherVisibilityChange := CallbackCreate(GetMethod(implObj, "LauncherVisibilityChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AppVisibilityOnMonitorChanged)
        CallbackFree(this.vtbl.LauncherVisibilityChange)
    }
}
