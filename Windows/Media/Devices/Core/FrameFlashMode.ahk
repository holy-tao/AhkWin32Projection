#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the flash mode for a frame in a variable photo sequence.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.frameflashmode
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameFlashMode extends Win32Enum{

    /**
     * The flash is disabled.
     * @type {Integer (Int32)}
     */
    static Disable => 0

    /**
     * The flash is enabled.
     * @type {Integer (Int32)}
     */
    static Enable => 1

    /**
     * The flash uses the global flash mode.
     * @type {Integer (Int32)}
     */
    static Global => 2
}
