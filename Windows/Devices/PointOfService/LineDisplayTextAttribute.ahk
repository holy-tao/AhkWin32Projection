#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate whether the line display is reversed or blinking.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaytextattribute
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayTextAttribute extends Win32Enum{

    /**
     * The display not reverse or blinking (ie. normal).
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The display is blinking.
     * @type {Integer (Int32)}
     */
    static Blink => 1

    /**
     * The display is reversed.
     * @type {Integer (Int32)}
     */
    static Reverse => 2

    /**
     * The display is reversed and blinking.
     * @type {Integer (Int32)}
     */
    static ReverseBlink => 3
}
