#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the state of microphone capture for app capture.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturemicrophonecapturestate
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureMicrophoneCaptureState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * @type {Integer (Int32)}
     */
    static Started => 1

    /**
     * @type {Integer (Int32)}
     */
    static Failed => 2
}
