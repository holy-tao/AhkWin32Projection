#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_IID_FLAGS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - ConstantIID
     * - Reserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    ConstantIID {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }
}
