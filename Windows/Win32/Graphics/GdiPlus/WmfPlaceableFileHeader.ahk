#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PWMFRect16.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class WmfPlaceableFileHeader extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

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
                this.__BoundingBox := PWMFRect16(6, this)
            return this.__BoundingBox
        }
    }

    /**
     * @type {Integer}
     */
    Inch {
        get => NumGet(this, 14, "short")
        set => NumPut("short", value, this, 14)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Checksum {
        get => NumGet(this, 20, "short")
        set => NumPut("short", value, this, 20)
    }
}
