#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDXGIDebug.ahk" { IDXGIDebug }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Controls debug settings for Microsoft DirectX Graphics Infrastructure (DXGI). You can use the IDXGIDebug1 interface in Windows Store apps.
 * @remarks
 * Call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-dxgigetdebuginterface1">DXGIGetDebugInterface1</a> function to obtain the <b>IDXGIDebug1</b> interface.
 * 
 * The <b>IDXGIDebug1</b> interface can be used only if the debug layer is turned on. For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-layers">Debug Layer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nn-dxgidebug-idxgidebug1
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIDebug1 extends IDXGIDebug {
    /**
     * The interface identifier for IDXGIDebug1
     * @type {Guid}
     */
    static IID := Guid("{c5a05f0c-16f2-4adf-9f4d-a8c4d58ac550}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIDebug1 interfaces
    */
    struct Vtbl extends IDXGIDebug.Vtbl {
        EnableLeakTrackingForThread    : IntPtr
        DisableLeakTrackingForThread   : IntPtr
        IsLeakTrackingEnabledForThread : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIDebug1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Starts tracking leaks for the current thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgidebug1-enableleaktrackingforthread
     */
    EnableLeakTrackingForThread() {
        ComCall(4, this)
    }

    /**
     * Stops tracking leaks for the current thread.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgidebug1-disableleaktrackingforthread
     */
    DisableLeakTrackingForThread() {
        ComCall(5, this)
    }

    /**
     * Gets a value indicating whether leak tracking is turned on for the current thread.
     * @returns {BOOL} <b>TRUE</b> if leak tracking is turned on for the current thread; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgidebug/nf-dxgidebug-idxgidebug1-isleaktrackingenabledforthread
     */
    IsLeakTrackingEnabledForThread() {
        result := ComCall(6, this, BOOL)
        return result
    }

    Query(iid) {
        if (IDXGIDebug1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableLeakTrackingForThread := CallbackCreate(GetMethod(implObj, "EnableLeakTrackingForThread"), flags, 1)
        this.vtbl.DisableLeakTrackingForThread := CallbackCreate(GetMethod(implObj, "DisableLeakTrackingForThread"), flags, 1)
        this.vtbl.IsLeakTrackingEnabledForThread := CallbackCreate(GetMethod(implObj, "IsLeakTrackingEnabledForThread"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableLeakTrackingForThread)
        CallbackFree(this.vtbl.DisableLeakTrackingForThread)
        CallbackFree(this.vtbl.IsLeakTrackingEnabledForThread)
    }
}
