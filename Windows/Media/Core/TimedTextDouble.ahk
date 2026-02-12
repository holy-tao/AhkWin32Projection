#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents a floating point value that is used to convey the values of timed text style properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextdouble
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextDouble extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The value.
     * @type {Float}
     */
    Value {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The units of the value, either pixels or percentage.
     * @type {Integer}
     */
    Unit {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
