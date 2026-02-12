#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the camera occlusion state associated with a state change detected by an IMFCameraOcclusionStateMonitor.
 * @remarks
 * An instance of this class is passed into [IMFCameraOcclusionStateReportCallback::OnOcclusionStateReport](nf-mfidl-imfcameraocclusionstatereportcallback-onocclusionstatereport.md) callback. Register the callback interface when you create the camera occlusion state monitor with a call to [MFCreateCameraOcclusionStateMonitor](nf-mfidl-mfcreatecameraocclusionstatemonitor.md).
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfcameraocclusionstatereport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraOcclusionStateReport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraOcclusionStateReport
     * @type {Guid}
     */
    static IID => Guid("{1640b2cf-74da-4462-a43b-b76d3bdc1434}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOcclusionState"]

    /**
     * The IMFCameraOcclusionStateReport::GetOcclusionState function gets the camera occlusion state associated with the occlusion state report.
     * @returns {Integer} A **DWORD** output parameter containing a value from the [MFCameraOcclusionState](ne-mfidl-mfcameraocclusionstate.md) enumeration.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfcameraocclusionstatereport-getocclusionstate
     */
    GetOcclusionState() {
        result := ComCall(3, this, "uint*", &occlusionState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return occlusionState
    }
}
