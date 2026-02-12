#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Identifies the access mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iocontrolaccessmode
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class IOControlAccessMode extends Win32Enum{

    /**
     * Any mode.
     * @type {Integer (Int32)}
     */
    static Any => 0

    /**
     * Read mode.
     * @type {Integer (Int32)}
     */
    static Read => 1

    /**
     * Write mode.
     * @type {Integer (Int32)}
     */
    static Write => 2

    /**
     * Read/write mode.
     * @type {Integer (Int32)}
     */
    static ReadWrite => 3
}
