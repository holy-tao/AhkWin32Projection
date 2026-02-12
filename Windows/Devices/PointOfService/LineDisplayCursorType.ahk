#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicate the type of cursor a line display is using.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursortype
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayCursorType extends Win32Enum{

    /**
     * No cursor.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A block cursor.
     * @type {Integer (Int32)}
     */
    static Block => 1

    /**
     * A half-block cursor.
     * @type {Integer (Int32)}
     */
    static HalfBlock => 2

    /**
     * An underline cursor.
     * @type {Integer (Int32)}
     */
    static Underline => 3

    /**
     * An inverted cursor.
     * @type {Integer (Int32)}
     */
    static Reverse => 4

    /**
     * Another type of cursor (not part of the UnifiedPOS specification).
     * @type {Integer (Int32)}
     */
    static Other => 5
}
