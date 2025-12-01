#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains flags that specify how a DDE server application should send data to a client application during an advise loop. A client passes a handle to a DDEADVISE structure to a server as part of a WM_DDE_ADVISE message.
 * @see https://learn.microsoft.com/windows/win32/api/dde/ns-dde-ddeadvise
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DDEADVISE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - reserved
     * - fDeferUpd
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
     * Reserved.
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 0) & 0x3FFF
        set => this._bitfield := ((value & 0x3FFF) << 0) | (this._bitfield & ~(0x3FFF << 0))
    }

    /**
     * Type: <b>unsigned short</b>
     * 
     * Indicates whether the server should defer sending updated data to the client. If this value is nonzero, the server should send a <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-data">WM_DDE_DATA</a> message with a <b>NULL</b> data handle whenever the data item changes. In response, the client can post a <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-request">WM_DDE_REQUEST</a> message to the server to get a handle to the updated data.
     * @type {Integer}
     */
    fDeferUpd {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * Type: <b>short</b>
     * 
     * Indicates whether the server should set the <b>fAckReq</b> flag in the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-data">WM_DDE_DATA</a> messages it posts to the client. If this value is nonzero, the server should set the <b>fAckReq</b> bit.
     * @type {Integer}
     */
    fAckReq {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * Type: <b>short</b>
     * 
     * The client application's preferred data format. The format must be a standard or registered clipboard format. The following standard clipboard formats can be used:
     * @type {Integer}
     */
    cfFormat {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }
}
