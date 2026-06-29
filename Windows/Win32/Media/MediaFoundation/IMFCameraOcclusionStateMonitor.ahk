#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Monitors the occlusion state of a camera device.
 * @remarks
 * Many devices provide mechanisms, such as a mechanical shutter, that allow the user to occlude the camera device for privacy. Other devices may occlude the camera in certain postures. This interface allows applications to receive notifications when the occlusion state of the camera changes so they can disable or modify their camera capture behavior when the camera is occluded. Note that some devices may have a mechanical camera shutter without a mechanism for sensing or reporting the state of the shutter, and therefore the camera occlusion APIs are unable to provide occlusion information on these devices. Also, some devices may not have a dedicated camera shutter but will still update the occlusion status of the camera based on whether the device lid is open or closed.
 * 
 * Create an instance of this interface by calling [MFCreateCameraOcclusionStateMonitor](nf-mfidl-mfcreatecameraocclusionstatemonitor.md), passing in an implementation of [IMFCameraOcclusionStateReportCallback](nn-mfidl-imfcameraocclusionstatereportcallback.md). After the monitor is started, the [IMFCameraOcclusionStateReportCallback::OnOcclusionStateReport](nf-mfidl-imfcameraocclusionstatereportcallback-onocclusionstatereport.md) callback is passed an instance of [IMFCameraOcclusionStateReport](nn-mfidl-imfcameraocclusionstatereport.md) on which you can call [GetOcclusionState](nf-mfidl-imfcameraocclusionstatereport-getocclusionstate.md) to get the new camera occlusion state.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameraocclusionstatemonitor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCameraOcclusionStateMonitor extends IUnknown {
    /**
     * The interface identifier for IMFCameraOcclusionStateMonitor
     * @type {Guid}
     */
    static IID := Guid("{cc692f46-c697-47e2-a72d-7b064617749b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCameraOcclusionStateMonitor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Start              : IntPtr
        Stop               : IntPtr
        GetSupportedStates : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCameraOcclusionStateMonitor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Starts the camera occlusion state monitor.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-start
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Stops the camera occlusion state monitor.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-stop
     */
    Stop() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Gets the occlusion states supported by the current device.
     * @remarks
     * To get the current occlusion state, call the [IMFCameraOcclusionStateReport::GetOcclusionState](nf-mfidl-imfcameraocclusionstatereport-getocclusionstate.md) method on the [IMFCameraOcclusionStateReport](nn-mfidl-imfcameraocclusionstatereport.md) passed to the [IMFCameraOcclusionStateReportCallback::OnOcclusionStateReport](nf-mfidl-imfcameraocclusionstatereportcallback-onocclusionstatereport.md) callback.
     * @returns {Integer} A **DWORD** containing a bitwise OR combination of values from the [MFCameraOcclusionState](ne-mfidl-mfcameraocclusionstate.md) enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-getsupportedstates
     */
    GetSupportedStates() {
        result := ComCall(5, this, UInt32)
        return result
    }

    Query(iid) {
        if (IMFCameraOcclusionStateMonitor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.GetSupportedStates := CallbackCreate(GetMethod(implObj, "GetSupportedStates"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.GetSupportedStates)
    }
}
