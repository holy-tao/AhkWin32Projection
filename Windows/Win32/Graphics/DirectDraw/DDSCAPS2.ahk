#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDSCAPS2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwCaps {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwCaps2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwCaps3 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwCaps4 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwVolumeDepth {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
