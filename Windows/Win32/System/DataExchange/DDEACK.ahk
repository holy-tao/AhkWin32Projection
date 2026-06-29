#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains status flags that a DDE application passes to its partner as part of the WM_DDE_ACK message.
 * @see https://learn.microsoft.com/windows/win32/api/dde/ns-dde-ddeack
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct DDEACK {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - bAppReturnCode
     * - reserved
     * - fBusy
     * - fAck
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    bAppReturnCode {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 8) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 8) | (this._bitfield & ~(0x3F << 8))
    }

    /**
     * @type {Integer}
     */
    fBusy {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * @type {Integer}
     */
    fAck {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }
}
