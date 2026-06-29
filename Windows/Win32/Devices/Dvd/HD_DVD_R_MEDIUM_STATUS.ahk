#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct HD_DVD_R_MEDIUM_STATUS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - ExtendedTestZone
     * - Reserved1
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    ExtendedTestZone {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 1) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 1) | (this._bitfield & ~(0x7F << 1))
    }
    NumberOfRemainingRMDsInRDZ : Int8

    NumberOfRemainingRMDsInCurrentRMZ : Int8[2]

}
