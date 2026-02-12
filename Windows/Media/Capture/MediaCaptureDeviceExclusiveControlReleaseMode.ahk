#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the condition under which exclusive access to the camera is released.
 * @remarks
 * Obtain exclusive access to a camera by calling [TryAcquireExclusiveControl](/uwp/api/windows.media.devices.videodevicecontroller.tryacquireexclusivecontrol).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturedeviceexclusivecontrolreleasemode
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureDeviceExclusiveControlReleaseMode extends Win32Enum{

    /**
     * Exclusive control is released when the associated camera object is disposed.
     * @type {Integer (Int32)}
     */
    static OnDispose => 0

    /**
     * Exclusive control is released when all streams from the associated camera are stopped.
     * @type {Integer (Int32)}
     */
    static OnAllStreamsStopped => 1
}
