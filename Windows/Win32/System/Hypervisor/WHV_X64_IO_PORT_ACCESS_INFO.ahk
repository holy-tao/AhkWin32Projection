#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_IO_PORT_ACCESS_INFO {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - IsWrite
     * - AccessSize
     * - StringOp
     * - RepPrefix
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    IsWrite {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    AccessSize {
        get => (this._bitfield >> 1) & 0x7
        set => this._bitfield := ((value & 0x7) << 1) | (this._bitfield & ~(0x7 << 1))
    }

    /**
     * @type {Integer}
     */
    StringOp {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    RepPrefix {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUINT32', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
