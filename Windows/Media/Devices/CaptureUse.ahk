#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the values for the primary use of the capture device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.captureuse
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class CaptureUse extends Win32Enum{

    /**
     * The capture device does not have a primary use.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The capture device is used primarily for photos.
     * @type {Integer (Int32)}
     */
    static Photo => 1

    /**
     * The capture device is used primarily for video.
     * @type {Integer (Int32)}
     */
    static Video => 2
}
