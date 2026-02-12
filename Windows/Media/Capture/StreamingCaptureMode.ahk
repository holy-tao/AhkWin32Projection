#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the streaming mode for a media capture device.
 * @remarks
 * For more information on configuring the [MediaCapture](mediacapture.md) object, see [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.streamingcapturemode
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class StreamingCaptureMode extends Win32Enum{

    /**
     * Capture audio and video.
     * @type {Integer (Int32)}
     */
    static AudioAndVideo => 0

    /**
     * Capture audio only.
     * @type {Integer (Int32)}
     */
    static Audio => 1

    /**
     * Capture video only.
     * @type {Integer (Int32)}
     */
    static Video => 2
}
