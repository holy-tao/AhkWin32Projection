#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct DSSD_POWER_STATE_DESCRIPTOR {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - NvmePowerState
     * - Reserved
     * - ValidDSSDPowerState
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    NvmePowerState {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    ValidDSSDPowerState {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
}
