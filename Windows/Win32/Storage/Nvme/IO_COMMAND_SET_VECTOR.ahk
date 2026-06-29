#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct IO_COMMAND_SET_VECTOR {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - NVMCommandSet
     * - KVCommandSet
     * - ZNCommandSet
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    NVMCommandSet {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    KVCommandSet {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ZNCommandSet {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }
}
