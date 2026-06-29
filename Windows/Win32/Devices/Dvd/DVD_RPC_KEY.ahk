#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_RPC_KEY {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - UserResetsAvailable
     * - ManufacturerResetsAvailable
     * - TypeCode
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    UserResetsAvailable {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    ManufacturerResetsAvailable {
        get => (this._bitfield >> 3) & 0x7
        set => this._bitfield := ((value & 0x7) << 3) | (this._bitfield & ~(0x7 << 3))
    }

    /**
     * @type {Integer}
     */
    TypeCode {
        get => (this._bitfield >> 6) & 0x3
        set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
    }
    RegionMask : Int8

    RpcScheme : Int8

    Reserved02 : Int8

}
