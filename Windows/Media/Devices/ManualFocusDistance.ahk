#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the options for manual focus distance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.manualfocusdistance
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ManualFocusDistance extends Win32Enum{

    /**
     * Focus to infinity.
     * @type {Integer (Int32)}
     */
    static Infinity => 0

    /**
     * Focus to the hyperfocal distance.
     * @type {Integer (Int32)}
     */
    static Hyperfocal => 1

    /**
     * Focus to the nearest distance.
     * @type {Integer (Int32)}
     */
    static Nearest => 2
}
