#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Determines the highest resolution the user can select for capturing video.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.cameracaptureuimaxvideoresolution
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class CameraCaptureUIMaxVideoResolution extends Win32Enum{

    /**
     * The user can select any resolution.
     * @type {Integer (Int32)}
     */
    static HighestAvailable => 0

    /**
     * The user can select resolutions up to low definition resolutions.
     * @type {Integer (Int32)}
     */
    static LowDefinition => 1

    /**
     * The user can select resolutions up to standard definition resolutions.
     * @type {Integer (Int32)}
     */
    static StandardDefinition => 2

    /**
     * The user can select resolutions up to high definition resolutions.
     * @type {Integer (Int32)}
     */
    static HighDefinition => 3
}
