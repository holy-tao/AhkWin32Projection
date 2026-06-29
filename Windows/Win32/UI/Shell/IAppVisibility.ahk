#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MONITOR_APP_VISIBILITY.ahk" { MONITOR_APP_VISIBILITY }
#Import ".\IAppVisibilityEvents.ahk" { IAppVisibilityEvents }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * Provides functionality to determine whether the display is showing Universal Windows Platform apps.
 * @remarks
 * Use the <b>IAppVisibility</b> interface to determine when a display is showing Universal Windows Platform apps. This is useful for accessibility tools and other applications.
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iappvisibility-islaunchervisible">IsLauncherVisible</a>  method to determine when  the Start screen is visible.
 * 
 * Don't implement the <b>IAppVisibility</b> interface. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function with <b>CLSID_AppVisibility</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iappvisibility
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IAppVisibility extends IUnknown {
    /**
     * The interface identifier for IAppVisibility
     * @type {Guid}
     */
    static IID := Guid("{2246ea2d-caea-4444-a3c4-6de827e44313}")

    /**
     * The class identifier for AppVisibility
     * @type {Guid}
     */
    static CLSID := Guid("{7e5fe3d9-985f-4908-91f9-ee19f9fd1514}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppVisibility interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAppVisibilityOnMonitor : IntPtr
        IsLauncherVisible         : IntPtr
        Advise                    : IntPtr
        Unadvise                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppVisibility.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries the current mode of the specified monitor.
     * @param {HMONITOR} _hMonitor The monitor to query.
     * @returns {MONITOR_APP_VISIBILITY} The current mode of <i>hMonitor</i>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iappvisibility-getappvisibilityonmonitor
     */
    GetAppVisibilityOnMonitor(_hMonitor) {
        result := ComCall(3, this, HMONITOR, _hMonitor, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * Gets a value that indicates whether the Start screen is displayed.
     * @returns {BOOL} <b>TRUE</b> if the Start screen is displayed; otherwise, <b>FALSE.</b>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iappvisibility-islaunchervisible
     */
    IsLauncherVisible() {
        result := ComCall(4, this, BOOL.Ptr, &pfVisible := 0, "HRESULT")
        return pfVisible
    }

    /**
     * Registers an advise sink object to receive notification of changes to the display.
     * @param {IAppVisibilityEvents} pCallback The client's advise sink that receives outgoing calls from the connection point.
     * @returns {Integer} A token that uniquely identifies this connection. Use this token to delete the connection by passing it to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iappvisibility-unadvise">Unadvise</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iappvisibility-advise
     */
    Advise(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Cancels a connection that was previously established by using Advise.
     * @param {Integer} dwCookie A token that uniquely identifies the connection to cancel, which is provided by a previous call to to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iappvisibility-advise">Advise</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iappvisibility-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(6, this, "uint", dwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppVisibility.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAppVisibilityOnMonitor := CallbackCreate(GetMethod(implObj, "GetAppVisibilityOnMonitor"), flags, 3)
        this.vtbl.IsLauncherVisible := CallbackCreate(GetMethod(implObj, "IsLauncherVisible"), flags, 2)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 3)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAppVisibilityOnMonitor)
        CallbackFree(this.vtbl.IsLauncherVisible)
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.Unadvise)
    }
}
