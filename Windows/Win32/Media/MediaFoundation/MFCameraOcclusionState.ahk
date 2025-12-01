#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the occlusion state of a camera.
 * @remarks
 * A value from this enumeration is returned by [IMFCameraOcclusionStateReport::GetOcclusionState](nf-mfidl-imfcameraocclusionstatereport-getocclusionstate.md). To get the occlusion states that are supported on the current device, and therefore may be returned by **GetOcclusionState**, call [IMFCameraOcclusionStateMonitor::GetSupportedStates](nf-mfidl-imfcameraocclusionstatemonitor-getsupportedstates.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfcameraocclusionstate
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCameraOcclusionState extends Win32BitflagEnum{

    /**
     * The camera is not occluded.
     * @type {Integer (Int32)}
     */
    static MFCameraOcclusionState_Open => 0

    /**
     * The camera is occluded by the lid of the device.
     * @type {Integer (Int32)}
     */
    static MFCameraOcclusionState_OccludedByLid => 1

    /**
     * The camera is occluded by camera hardware.
     * @type {Integer (Int32)}
     */
    static MFCameraOcclusionState_OccludedByCameraHardware => 2
}
