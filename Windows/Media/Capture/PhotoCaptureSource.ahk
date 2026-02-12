#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies which stream on a video camera is used to capture photos.
 * @remarks
 * Some video cameras have a separate photo stream that can capture still images at higher resolution than the video stream. For more information on configuring the [MediaCapture](mediacapture.md) object, see [MediaCaptureInitializationSettings](mediacaptureinitializationsettings.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.photocapturesource
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class PhotoCaptureSource extends Win32Enum{

    /**
     * Automatically select the stream.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Use the video stream.
     * @type {Integer (Int32)}
     */
    static VideoPreview => 1

    /**
     * Use the photo stream.
     * @type {Integer (Int32)}
     */
    static Photo => 2
}
