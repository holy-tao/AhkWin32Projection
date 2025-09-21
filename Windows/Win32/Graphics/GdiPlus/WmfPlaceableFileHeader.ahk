#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PWMFRect16.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class WmfPlaceableFileHeader extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Key {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Hmf {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * @type {PWMFRect16}
     */
    BoundingBox{
        get {
            if(!this.HasProp("__BoundingBox"))
                this.__BoundingBox := PWMFRect16(this.ptr + 8)
            return this.__BoundingBox
        }
    }

    /**
     * @type {Integer}
     */
    Inch {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Checksum {
        get => NumGet(this, 24, "short")
        set => NumPut("short", value, this, 24)
    }
}
