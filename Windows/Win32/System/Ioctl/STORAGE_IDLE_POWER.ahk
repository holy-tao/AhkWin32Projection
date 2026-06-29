#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_IDLE_POWER {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    /**
     * This bitfield backs the following members:
     * - WakeCapableHint
     * - D3ColdSupported
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    WakeCapableHint {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    D3ColdSupported {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    D3IdleTimeout : UInt32

}
