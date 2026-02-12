#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents the size of padding around a timed text region.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextpadding
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextPadding extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The padding before the timed text region.
     * @type {Float}
     */
    Before {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The padding after the timed text region.
     * @type {Float}
     */
    After {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * The padding towards the start of the timed text.
     * @type {Float}
     */
    Start {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * The padding towards the end of the timed text.
     * @type {Float}
     */
    End {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * The units in which the other members of the structure are expressed.
     * @type {Integer}
     */
    Unit {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
