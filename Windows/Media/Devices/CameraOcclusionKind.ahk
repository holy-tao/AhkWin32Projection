#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of occlusion that is blocking a camera.
 * @remarks
 * A device may not support any or all occlusion types. If an occlusion type is unsupported, [CameraOcclusionState.IsOcclusionKind](cameraocclusionstate_isocclusionkind_495098314.md) will never return true for that occlusion type. Determine if an occlusion kind is supported by the camera device by calling [IsOcclusionKindSupported](cameraocclusioninfo_isocclusionkindsupported_1486521484.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.cameraocclusionkind
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class CameraOcclusionKind extends Win32Enum{

    /**
     * The camera is occluded by the lid of the device.
     * @type {Integer (Int32)}
     */
    static Lid => 0

    /**
     * The camera is occluded by camera hardware.
     * @type {Integer (Int32)}
     */
    static CameraHardware => 1
}
