#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPV4_OPTION_HEADER.ahk" { IPV4_OPTION_HEADER }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV4_TIMESTAMP_OPTION {
    #StructPack 1

    OptionHeader : IPV4_OPTION_HEADER

    Pointer : Int8

    FlagsOverflow : Int8


    /**
     * @type {Integer}
     */
    Flags {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Overflow {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 3 })
        this.DeleteProp("__New")
    }
}
