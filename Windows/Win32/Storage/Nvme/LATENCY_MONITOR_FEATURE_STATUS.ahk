#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct LATENCY_MONITOR_FEATURE_STATUS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - FeatureEnabled
     * - ActiveLatencyMode
     * - ActiveMeasuredLatency
     * - Reserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    FeatureEnabled {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    ActiveLatencyMode {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ActiveMeasuredLatency {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
