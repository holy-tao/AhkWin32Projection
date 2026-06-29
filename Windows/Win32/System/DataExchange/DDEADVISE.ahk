#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags that specify how a DDE server application should send data to a client application during an advise loop. A client passes a handle to a DDEADVISE structure to a server as part of a WM_DDE_ADVISE message.
 * @see https://learn.microsoft.com/windows/win32/api/dde/ns-dde-ddeadvise
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct DDEADVISE {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - reserved
     * - fDeferUpd
     * - fAckReq
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 0) & 0x3FFF
        set => this._bitfield := ((value & 0x3FFF) << 0) | (this._bitfield & ~(0x3FFF << 0))
    }

    /**
     * @type {Integer}
     */
    fDeferUpd {
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
     * The client application's preferred data format. The format must be a standard or registered clipboard format. The following standard clipboard formats can be used:
     */
    cfFormat : Int16

}
