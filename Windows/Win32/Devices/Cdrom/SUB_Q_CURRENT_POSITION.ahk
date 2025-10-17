#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SUB_Q_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class SUB_Q_CURRENT_POSITION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {SUB_Q_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := SUB_Q_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    FormatCode {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * This bitfield backs the following members:
     * - Control
     * - ADR
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * @type {Integer}
     */
    Control {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    ADR {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    TrackNumber {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    IndexNumber {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Array<Byte>}
     */
    AbsoluteAddress{
        get {
            if(!this.HasProp("__AbsoluteAddressProxyArray"))
                this.__AbsoluteAddressProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "char")
            return this.__AbsoluteAddressProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    TrackRelativeAddress{
        get {
            if(!this.HasProp("__TrackRelativeAddressProxyArray"))
                this.__TrackRelativeAddressProxyArray := Win32FixedArray(this.ptr + 12, 4, Primitive, "char")
            return this.__TrackRelativeAddressProxyArray
        }
    }
}
