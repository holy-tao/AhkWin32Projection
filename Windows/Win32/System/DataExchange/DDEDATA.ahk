#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the data, and information about the data, sent as part of a WM_DDE_DATA message.
 * @see https://learn.microsoft.com/windows/win32/api/dde/ns-dde-ddedata
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DDEDATA extends Win32Struct
{
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
     * Type: <b>unsigned short</b>
     * 
     * Unused.
     * @type {Integer}
     */
    unused {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * Indicates whether the data was sent in response to a <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-request">WM_DDE_REQUEST</a> message or a <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-advise">WM_DDE_ADVISE</a> message. If this value is nonzero, the data was sent in response to a <b>WM_DDE_REQUEST</b> message.
     * @type {Integer}
     */
    fResponse {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * Indicates whether the application receiving the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-poke">WM_DDE_POKE</a> message should free the data. If this value is nonzero, the application should free the data.
     * @type {Integer}
     */
    fRelease {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * Type: <b>BYTE</b>
     * 
     * Indicates whether the application receiving the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-data">WM_DDE_DATA</a> message should acknowledge receipt of the data by sending a <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-ack">WM_DDE_ACK</a> message. If this value is nonzero, the application should send the acknowledgment.
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
     * @type {Array<Byte>}
     */
    Value{
        get {
            if(!this.HasProp("__ValueProxyArray"))
                this.__ValueProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__ValueProxyArray
        }
    }
}
