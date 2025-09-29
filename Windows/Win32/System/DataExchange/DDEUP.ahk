#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DDEUP extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - unused
     * - fAck
     * - fRelease
     * - fReserved
     * - fAckReq
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    unused {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    fAck {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    fRelease {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    fAckReq {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    cfFormat {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    rgb{
        get {
            if(!this.HasProp("__rgbProxyArray"))
                this.__rgbProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__rgbProxyArray
        }
    }
}
