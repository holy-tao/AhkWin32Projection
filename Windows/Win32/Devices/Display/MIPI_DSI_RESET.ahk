#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MIPI_DSI_RESET {
    #StructPack 4

    Flags : UInt32

    /**
     * This bitfield backs the following members:
     * - MipiErrors
     * - ResetFailed
     * - NeedModeSet
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    MipiErrors {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    ResetFailed {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    NeedModeSet {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }
    static __New() {
        DefineProp(this.Prototype, 'Results', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
