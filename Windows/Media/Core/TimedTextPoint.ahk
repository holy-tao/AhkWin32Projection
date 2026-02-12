#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents 2D coordinate that is used to convey the values of timed text style properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextpoint
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextPoint extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The X coordinate of the point.
     * @type {Float}
     */
    X {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The Y coordinate of the point.
     * @type {Float}
     */
    Y {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * The units of the coordinates, either pixels or percentage.
     * @type {Integer}
     */
    Unit {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
