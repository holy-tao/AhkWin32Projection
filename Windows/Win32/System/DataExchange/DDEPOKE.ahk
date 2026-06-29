#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the data, and information about the data, sent as part of a WM_DDE_POKE message.
 * @see https://learn.microsoft.com/windows/win32/api/dde/ns-dde-ddepoke
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct DDEPOKE {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - unused
     * - fRelease
     * - fReserved
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    unused {
        get => (this._bitfield >> 0) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 0) | (this._bitfield & ~(0x1FFF << 0))
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
        get => (this._bitfield >> 14) & 0x3
        set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
    }
    /**
     * Type: <b>short</b>
     * 
     * The format of the data. The format should be a standard or registered clipboard format. The following standard clipboard formats can be used:
     */
    cfFormat : Int16

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * Contains the data. The length and type of data depend on the value of the 
     * 					<b>cfFormat</b> member.
     */
    Value : Int8[1]

}
