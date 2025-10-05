#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains status flags that a DDE application passes to its partner as part of the WM_DDE_ACK message.
 * @see https://learn.microsoft.com/windows/win32/api/dde/ns-dde-ddeack
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DDEACK extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - bAppReturnCode
     * - reserved
     * - fBusy
     * - fAck
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * An application-defined return code.
     * @type {Integer}
     */
    bAppReturnCode {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 8) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 8) | (this._bitfield & ~(0x3F << 8))
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * Indicates whether the application was busy and unable to respond to the partner's message at the time the message was received. A nonzero value indicates the partner was busy and unable to respond. The <b>fBusy</b> member is defined only when the <b>fAck</b> member is zero.
     * @type {Integer}
     */
    fBusy {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * Indicates whether the application accepted the message from its partner. A nonzero value indicates the partner accepted the message.
     * @type {Integer}
     */
    fAck {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
}
