#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct INTEL_CACHE_INFO_EAX {
    #StructPack 4

    Ulong : UInt32


    /**
     * @type {Integer}
     */
    Type {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    Level {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Integer}
     */
    SelfInitializing {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    FullyAssociative {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    ThreadsSharing {
        get => (this._bitfield >> 14) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 14) | (this._bitfield & ~(0xFFF << 14))
    }

    /**
     * @type {Integer}
     */
    ProcessorCores {
        get => (this._bitfield >> 26) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 26) | (this._bitfield & ~(0x3F << 26))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
