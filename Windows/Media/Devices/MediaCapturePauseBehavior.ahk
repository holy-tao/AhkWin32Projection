#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the behavior when media capture is paused with a call to [PauseAsync](../windows.media.capture/lowlagmediarecording_pauseasync_622665789.md) or [PauseRecordAsync](../windows.media.capture/mediacapture_pauserecordasync_1650376226.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediacapturepausebehavior
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class MediaCapturePauseBehavior extends Win32Enum{

    /**
     * The calling app keeps control of the hardware resources, such as the camera, while capturing is paused.
     * @type {Integer (Int32)}
     */
    static RetainHardwareResources => 0

    /**
     * The hardware resources are released while capturing is paused.
     * @type {Integer (Int32)}
     */
    static ReleaseHardwareResources => 1
}
