#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the options that transforms may set on input textures.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/ns-d2d1effectauthor-d2d1_input_description
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_INPUT_DESCRIPTION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The type of filter to apply to the input texture.
     * @type {Integer}
     */
    filter {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The mip level to retrieve from the upstream transform, if specified.
     * @type {Integer}
     */
    levelOfDetailCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
