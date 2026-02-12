#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the advanced photo capture modes.
 * @remarks
 * > [!NOTE]
 * > Using the camera flash during advanced photo capture is not supported.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.advancedphotomode
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class AdvancedPhotoMode extends Win32Enum{

    /**
     * The system dynamically determines the advanced photo capture mode.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Standard capture mode.
     * @type {Integer (Int32)}
     */
    static Standard => 1

    /**
     * High Dynamic Range (HDR) capture mode.
     * @type {Integer (Int32)}
     */
    static Hdr => 2

    /**
     * Low light capture mode.
     * @type {Integer (Int32)}
     */
    static LowLight => 3
}
