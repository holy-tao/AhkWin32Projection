#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PROCESSOR_FAMILY_INFO {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - Stepping
     * - Model
     * - Family
     * - ProcessorType
     * - Reserved1
     * - ExtendedModel
     * - ExtendedFamily
     * - Reserved2
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Stepping {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Model {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    Family {
        get => (this._bitfield >> 8) & 0xF
        set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
    }

    /**
     * @type {Integer}
     */
    ProcessorType {
        get => (this._bitfield >> 12) & 0x3
        set => this._bitfield := ((value & 0x3) << 12) | (this._bitfield & ~(0x3 << 12))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 14) & 0x3
        set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
    }

    /**
     * @type {Integer}
     */
    ExtendedModel {
        get => (this._bitfield >> 16) & 0xF
        set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
    }

    /**
     * @type {Integer}
     */
    ExtendedFamily {
        get => (this._bitfield >> 20) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 20) | (this._bitfield & ~(0xFF << 20))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 28) & 0xF
        set => this._bitfield := ((value & 0xF) << 28) | (this._bitfield & ~(0xF << 28))
    }
    NativeModelId : UInt32

    static __New() {
        DefineProp(this.Prototype, 'AsULONGLONG', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
