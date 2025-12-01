#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DISPLAYCONFIG_2DREGION structure represents a point or an offset in a two-dimensional space.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_2dregion
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_2DREGION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The horizontal component of the point or offset.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The vertical component of the point or offset.
     * @type {Integer}
     */
    cy {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
