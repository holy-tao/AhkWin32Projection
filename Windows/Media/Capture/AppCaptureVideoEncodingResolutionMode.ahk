#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the app capture video encoding resolution mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturevideoencodingresolutionmode
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureVideoEncodingResolutionMode extends Win32Enum{

    /**
     * Custom resolution.
     * @type {Integer (Int32)}
     */
    static Custom => 0

    /**
     * High resolution.
     * @type {Integer (Int32)}
     */
    static High => 1

    /**
     * Standard resolution.
     * @type {Integer (Int32)}
     */
    static Standard => 2
}
