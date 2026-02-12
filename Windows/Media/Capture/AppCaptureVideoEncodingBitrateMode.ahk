#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the app capture video encoding bitrate mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturevideoencodingbitratemode
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureVideoEncodingBitrateMode extends Win32Enum{

    /**
     * Custom bitrate.
     * @type {Integer (Int32)}
     */
    static Custom => 0

    /**
     * High bitrate.
     * @type {Integer (Int32)}
     */
    static High => 1

    /**
     * Standard bitrate.
     * @type {Integer (Int32)}
     */
    static Standard => 2
}
