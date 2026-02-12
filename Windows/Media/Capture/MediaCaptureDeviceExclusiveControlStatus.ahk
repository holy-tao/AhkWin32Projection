#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the exclusive control status of the media capture device. Exclusive control is required to modify the settings of the capture device, but is not required to obtain media frames from the device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturedeviceexclusivecontrolstatus
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureDeviceExclusiveControlStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ExclusiveControlAvailable => 0

    /**
     * @type {Integer (Int32)}
     */
    static SharedReadOnlyAvailable => 1
}
