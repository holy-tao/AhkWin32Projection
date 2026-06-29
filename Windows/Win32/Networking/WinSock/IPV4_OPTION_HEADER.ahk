#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV4_OPTION_HEADER {
    #StructPack 1

    OptionType : Int8


    /**
     * @type {Integer}
     */
    OptionNumber {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    OptionClass {
        get => (this._bitfield >> 5) & 0x3
        set => this._bitfield := ((value & 0x3) << 5) | (this._bitfield & ~(0x3 << 5))
    }

    /**
     * @type {Integer}
     */
    CopiedFlag {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
    OptionLength : Int8

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
