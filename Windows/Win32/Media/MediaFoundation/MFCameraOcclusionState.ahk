#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfcameraocclusionstate
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFCameraOcclusionState extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static MFCameraOcclusionState_Open => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFCameraOcclusionState_OccludedByLid => 1

    /**
     * @type {Integer (Int32)}
     */
    static MFCameraOcclusionState_OccludedByCameraHardware => 2
}
