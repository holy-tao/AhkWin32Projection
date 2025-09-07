#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class BlurParams extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Float}
     */
    radius {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    expandEdge {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
