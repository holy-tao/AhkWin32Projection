#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the rotation of the video stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.videorotation
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class VideoRotation extends Win32Enum{

    /**
     * The video stream is not rotated.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The video stream is rotated 90 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static Clockwise90Degrees => 1

    /**
     * The video stream is rotated 180 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static Clockwise180Degrees => 2

    /**
     * The video stream is rotated 270 degrees clockwise.
     * @type {Integer (Int32)}
     */
    static Clockwise270Degrees => 3
}
