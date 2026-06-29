#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_OPTION_PREF64 {
    #StructPack 2

    nd_opt_p64_type : Int8

    nd_opt_p64_len : Int8

    nd_opt_p64_lifetime_plc : UInt16


    /**
     * @type {Integer}
     */
    nd_opt_p64_prefix_length_code {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    nd_opt_p64_scaled_lifetime {
        get => (this._bitfield >> 3) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 3) | (this._bitfield & ~(0x1FFF << 3))
    }
    nd_opt_p64_prefix : Int8[12]

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int16, offset: 2 })
        this.DeleteProp("__New")
    }
}
