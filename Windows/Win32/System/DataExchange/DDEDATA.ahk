#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the data, and information about the data, sent as part of a WM_DDE_DATA message.
 * @see https://learn.microsoft.com/windows/win32/api/dde/ns-dde-ddedata
 * @namespace Windows.Win32.System.DataExchange
 */
class DDEDATA extends Win32Struct {
    static sizeof => 6

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - unused
     * - fResponse
     * - fRelease
     * - reserved
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
    fResponse {
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
    reserved {
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
     * Type: <b>short</b>
     * 
     * The format of the data. The format should be a standard or registered clipboard format. The following standard clipboard formats can be used:
     * @type {Integer}
     */
    cfFormat {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * Contains the data. The length and type of data depend on the <b>cfFormat</b> member.
     * @type {Array<Integer>}
     */
    Value {
        get {
            if(!this.HasProp("__ValueProxyArray"))
                this.__ValueProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__ValueProxyArray
        }
    }
}
