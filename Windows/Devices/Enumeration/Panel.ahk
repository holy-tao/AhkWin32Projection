#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the location of a panel on a computer. This enumeration is used for indicating the physical location of a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.panel
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class Panel extends Win32Enum{

    /**
     * The location of the panel is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The front panel of the computer.
     * @type {Integer (Int32)}
     */
    static Front => 1

    /**
     * The back panel of the computer.
     * @type {Integer (Int32)}
     */
    static Back => 2

    /**
     * The top panel of the computer.
     * @type {Integer (Int32)}
     */
    static Top => 3

    /**
     * The bottom panel of the computer.
     * @type {Integer (Int32)}
     */
    static Bottom => 4

    /**
     * The left panel of the computer.
     * @type {Integer (Int32)}
     */
    static Left => 5

    /**
     * The right panel of the computer.
     * @type {Integer (Int32)}
     */
    static Right => 6
}
