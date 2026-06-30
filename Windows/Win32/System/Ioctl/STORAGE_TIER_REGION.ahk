#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_TIER_REGION extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Guid}
     */
    TierId {
        get {
            if(!this.HasProp("__TierId"))
                this.__TierId := Guid(0, this)
            return this.__TierId
        }
    }

    /**
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
