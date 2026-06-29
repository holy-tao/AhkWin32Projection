#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY {
    #StructPack 4

    BeginAddress : UInt32

    UnwindData : UInt32


    /**
     * @type {Integer}
     */
    Flag {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    FunctionLength {
        get => (this._bitfield >> 2) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 2) | (this._bitfield & ~(0x7FF << 2))
    }

    /**
     * @type {Integer}
     */
    RegF {
        get => (this._bitfield >> 13) & 0x7
        set => this._bitfield := ((value & 0x7) << 13) | (this._bitfield & ~(0x7 << 13))
    }

    /**
     * @type {Integer}
     */
    RegI {
        get => (this._bitfield >> 16) & 0xF
        set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
    }

    /**
     * @type {Integer}
     */
    H {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    CR {
        get => (this._bitfield >> 21) & 0x3
        set => this._bitfield := ((value & 0x3) << 21) | (this._bitfield & ~(0x3 << 21))
    }

    /**
     * @type {Integer}
     */
    FrameSize {
        get => (this._bitfield >> 23) & 0x1FF
        set => this._bitfield := ((value & 0x1FF) << 23) | (this._bitfield & ~(0x1FF << 23))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 4 })
        this.DeleteProp("__New")
    }
}
