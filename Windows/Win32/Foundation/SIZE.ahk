#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The SIZE structure defines the width and height of a rectangle.
 * @remarks
 * 
  * The rectangle dimensions stored in this structure can correspond to viewport extents, window extents, text extents, bitmap dimensions, or the aspect-ratio filter for some extended functions.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//windef/ns-windef-size
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class SIZE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the rectangle's width. The units depend on which function uses this structure.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the rectangle's height. The units depend on which function uses this structure.
     * @type {Integer}
     */
    cy {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
