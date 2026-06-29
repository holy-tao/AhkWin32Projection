#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIXBUS_COMMAND {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - Command
     * - PCIXCommand
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    Command {
        get => (this._bitfield >> 0) & 0xFFFFFFFFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFFFFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFFFFFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    PCIXCommand {
        get => (this._bitfield >> 56) & 0x1
        set => this._bitfield := ((value & 0x1) << 56) | (this._bitfield & ~(0x1 << 56))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsULONGLONG', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
