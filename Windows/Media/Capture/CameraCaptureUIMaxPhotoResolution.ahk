#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Determines the highest resolution the user can select for capturing photos.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuimaxphotoresolution
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CameraCaptureUIMaxPhotoResolution extends Win32Enum{

    /**
     * The user can select any resolution.
     * @type {Integer (Int32)}
     */
    static HighestAvailable => 0

    /**
     * The user can select resolutions up to 320 X 240, or a similar 16:9 resolution.
     * @type {Integer (Int32)}
     */
    static VerySmallQvga => 1

    /**
     * The user can select resolutions up to 320 X 240, or a similar 16:9 resolution.
     * @type {Integer (Int32)}
     */
    static SmallVga => 2

    /**
     * The user can select resolutions up to 1024 X 768, or a similar 16:9 resolution.
     * @type {Integer (Int32)}
     */
    static MediumXga => 3

    /**
     * The user can select resolutions up to 1920 X 1080, or a similar 4:3 resolution.
     * @type {Integer (Int32)}
     */
    static Large3M => 4

    /**
     * The user can select resolutions up to 5 MP.
     * @type {Integer (Int32)}
     */
    static VeryLarge5M => 5
}
