#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the video encoding frame rate mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturevideoencodingframeratemode
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureVideoEncodingFrameRateMode extends Win32Enum{

    /**
     * Video is encoded with the standard frame rate.
     * @type {Integer (Int32)}
     */
    static Standard => 0

    /**
     * Video is encoded with a high frame rate.
     * @type {Integer (Int32)}
     */
    static High => 1
}
