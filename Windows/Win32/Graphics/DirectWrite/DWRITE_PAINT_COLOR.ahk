#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DWRITE_COLOR_F.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_PAINT_COLOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {DWRITE_COLOR_F}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := DWRITE_COLOR_F(this.ptr + 0)
            return this.__value
        }
    }

    /**
     * @type {Integer}
     */
    paletteEntryIndex {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Float}
     */
    alphaMultiplier {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    colorAttributes {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
