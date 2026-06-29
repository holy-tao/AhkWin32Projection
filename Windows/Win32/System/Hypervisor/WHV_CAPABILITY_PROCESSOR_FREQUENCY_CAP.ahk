#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_CAPABILITY_PROCESSOR_FREQUENCY_CAP {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - IsSupported
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    IsSupported {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
    HighestFrequencyMhz : UInt32

    NominalFrequencyMhz : UInt32

    LowestFrequencyMhz : UInt32

    FrequencyStepMhz : UInt32

}
