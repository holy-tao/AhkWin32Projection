#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains the x and y offsets of the combining glyph.
 * @remarks
 * 
 * The members of this structure are named as they are so that they are not confused with the "dx" and "dy" designators for physical units in Uniscribe functions and structures.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//usp10/ns-usp10-goffset
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class GOFFSET extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * x offset, in logical units, for the combining glyph.
     * @type {Integer}
     */
    du {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * y offset, in logical units, for the combining glyph.
     * @type {Integer}
     */
    dv {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
