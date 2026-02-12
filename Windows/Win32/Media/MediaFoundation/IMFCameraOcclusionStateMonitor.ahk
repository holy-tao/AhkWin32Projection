#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Monitors the occlusion state of a camera device.
 * @remarks
 * Many devices provide mechanisms, such as a mechanical shutter, that allow the user to occlude the camera device for privacy. Other devices may occlude the camera in certain postures. This interface allows applications to receive notifications when the occlusion state of the camera changes so they can disable or modify their camera capture behavior when the camera is occluded. Note that some devices may have a mechanical camera shutter without a mechanism for sensing or reporting the state of the shutter, and therefore the camera occlusion APIs are unable to provide occlusion information on these devices. Also, some devices may not have a dedicated camera shutter but will still update the occlusion status of the camera based on whether the device lid is open or closed.
 * 
 * Create an instance of this interface by calling [MFCreateCameraOcclusionStateMonitor](nf-mfidl-mfcreatecameraocclusionstatemonitor.md), passing in an implementation of [IMFCameraOcclusionStateReportCallback](nn-mfidl-imfcameraocclusionstatereportcallback.md). After the monitor is started, the [IMFCameraOcclusionStateReportCallback::OnOcclusionStateReport](nf-mfidl-imfcameraocclusionstatereportcallback-onocclusionstatereport.md) callback is passed an instance of [IMFCameraOcclusionStateReport](nn-mfidl-imfcameraocclusionstatereport.md) on which you can call [GetOcclusionState](nf-mfidl-imfcameraocclusionstatereport-getocclusionstate.md) to get the new camera occlusion state.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfcameraocclusionstatemonitor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraOcclusionStateMonitor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraOcclusionStateMonitor
     * @type {Guid}
     */
    static IID => Guid("{cc692f46-c697-47e2-a72d-7b064617749b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop", "GetSupportedStates"]

    /**
     * Starts the camera occlusion state monitor.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-start
     */
    Start() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops the camera occlusion state monitor.
     * @returns {HRESULT} Returns an HRESULT value, including but not limited to the following values:
     * 
     * | Error code | Description |
     * |------------|-------------|
     * | S_OK    | Succeeded |
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-stop
     */
    Stop() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the occlusion states supported by the current device.
     * @remarks
     * To get the current occlusion state, call the [IMFCameraOcclusionStateReport::GetOcclusionState](nf-mfidl-imfcameraocclusionstatereport-getocclusionstate.md) method on the [IMFCameraOcclusionStateReport](nn-mfidl-imfcameraocclusionstatereport.md) passed to the [IMFCameraOcclusionStateReportCallback::OnOcclusionStateReport](nf-mfidl-imfcameraocclusionstatereportcallback-onocclusionstatereport.md) callback.
     * @returns {Integer} A **DWORD** containing a bitwise OR combination of values from the [MFCameraOcclusionState](ne-mfidl-mfcameraocclusionstate.md) enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameraocclusionstatemonitor-getsupportedstates
     */
    GetSupportedStates() {
        result := ComCall(5, this, "uint")
        return result
    }
}
