#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by applications to receive camera occlusion state change notifications.
 * @remarks
 * Register the callback interface when you create the camera occlusion state monitor with a call to [MFCreateCameraOcclusionStateMonitor](nf-mfidl-mfcreatecameraocclusionstatemonitor.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameraocclusionstatereportcallback
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraOcclusionStateReportCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraOcclusionStateReportCallback
     * @type {Guid}
     */
    static IID => Guid("{6e5841c7-3889-4019-9035-783fb19b5948}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnOcclusionStateReport"]

    /**
     * Called by the system when the camera occlusion state changes.
     * @remarks
     * To avoid any possible circular locking situation do not call any IMFCameraOcclusionStateMonitor object methods from this callback function.
     * 
     * Register the callback interface by calling [MFCreateCameraOcclusionStateMonitor](nf-mfidl-mfcreatecameraocclusionstatemonitor.md).
     * @param {IMFCameraOcclusionStateReport} occlusionStateReport An [IMFCameraOcclusionStateReport](nn-mfidl-imfcameraocclusionstatereport.md) that can be used to obtain the new camera occlusion state.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameraocclusionstatereportcallback-onocclusionstatereport
     */
    OnOcclusionStateReport(occlusionStateReport) {
        result := ComCall(3, this, "ptr", occlusionStateReport, "HRESULT")
        return result
    }
}
