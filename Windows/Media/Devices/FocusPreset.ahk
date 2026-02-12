#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the values for the possible focus presets.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuspreset
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class FocusPreset extends Win32Enum{

    /**
     * Indicates that focus is automatically set by the capture.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Indicates that focus is manually set.
     * @type {Integer (Int32)}
     */
    static Manual => 1

    /**
     * Indicates that the capture device uses a close autofocus range.
     * @type {Integer (Int32)}
     */
    static AutoMacro => 2

    /**
     * Indicates that the capture device uses a normal autofocus range.
     * @type {Integer (Int32)}
     */
    static AutoNormal => 3

    /**
     * Indicates that the capture device uses an infinite autofocus range.
     * @type {Integer (Int32)}
     */
    static AutoInfinity => 4

    /**
     * Indicates that the capture device uses a hyperfocal autofocus range.
     * @type {Integer (Int32)}
     */
    static AutoHyperfocal => 5
}
