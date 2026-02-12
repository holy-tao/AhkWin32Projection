#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the thermal status of a media capture device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturethermalstatus
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureThermalStatus extends Win32Enum{

    /**
     * The thermal state is normal.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The capture device is overheated. You should stop the current capture session and save any captured media.
     * @type {Integer (Int32)}
     */
    static Overheated => 1
}
