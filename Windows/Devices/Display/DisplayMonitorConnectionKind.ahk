#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify an abstract method in which a display is connected (not specific to a physical protocol).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.displaymonitorconnectionkind
 * @namespace Windows.Devices.Display
 * @version WindowsRuntime 1.4
 */
class DisplayMonitorConnectionKind extends Win32Enum{

    /**
     * Indicates that the display is connected internally.
     * @type {Integer (Int32)}
     */
    static Internal => 0

    /**
     * Indicates that the display is connected wired.
     * @type {Integer (Int32)}
     */
    static Wired => 1

    /**
     * Indicates that the display is connected wirelessly.
     * @type {Integer (Int32)}
     */
    static Wireless => 2

    /**
     * Indicates that the display is connected virtually.
     * @type {Integer (Int32)}
     */
    static Virtual => 3
}
