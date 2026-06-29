#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_CAPABILITIES_REGISTER {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - CapabilityVersion
     * - DeviceType
     * - SlotImplemented
     * - InterruptMessageNumber
     * - Rsvd
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    CapabilityVersion {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    DeviceType {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    SlotImplemented {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    InterruptMessageNumber {
        get => (this._bitfield >> 9) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 9) | (this._bitfield & ~(0x1F << 9))
    }

    /**
     * @type {Integer}
     */
    Rsvd {
        get => (this._bitfield >> 14) & 0x3
        set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUSHORT', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
