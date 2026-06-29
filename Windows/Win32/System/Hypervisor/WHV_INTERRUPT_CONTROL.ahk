#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_INTERRUPT_CONTROL {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - Type
     * - DestinationMode
     * - TriggerMode
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    Type {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    DestinationMode {
        get => (this._bitfield >> 8) & 0xF
        set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
    }

    /**
     * @type {Integer}
     */
    TriggerMode {
        get => (this._bitfield >> 12) & 0xF
        set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
    }
    Destination : UInt32

    Vector : UInt32

}
