#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMAGE_COR_ILMETHOD_FAT {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Flags
     * - Size
     * - MaxStack
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Flags {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Size {
        get => (this._bitfield >> 12) & 0xF
        set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
    }

    /**
     * @type {Integer}
     */
    MaxStack {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    CodeSize : UInt32

    LocalVarSigTok : UInt32

}
