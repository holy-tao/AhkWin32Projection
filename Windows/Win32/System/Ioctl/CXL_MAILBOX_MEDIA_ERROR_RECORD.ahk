#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_MEDIA_ERROR_RECORD extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - ErrorSource
     * - Reserved
     * - MediaErrorAddress
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ErrorSource {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    MediaErrorAddress {
        get => (this._bitfield >> 6) & 0x3FFFFFFFFFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFFFFFFFFF) << 6) | (this._bitfield & ~(0x3FFFFFFFFFFFFFF << 6))
    }

    /**
     * @type {Integer}
     */
    MediaErrorLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
