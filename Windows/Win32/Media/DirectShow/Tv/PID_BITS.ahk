#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct PID_BITS {
    #StructPack 2

    /**
     * This bitfield backs the following members:
     * - Reserved
     * - ProgramId
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    ProgramId {
        get => (this._bitfield >> 3) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 3) | (this._bitfield & ~(0x1FFF << 3))
    }
}
