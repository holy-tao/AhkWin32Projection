#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_TLS_DIRECTORY32 {
    #StructPack 4

    StartAddressOfRawData : UInt32

    EndAddressOfRawData : UInt32

    AddressOfIndex : UInt32

    AddressOfCallBacks : UInt32

    SizeOfZeroFill : UInt32

    Characteristics : UInt32


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 0) | (this._bitfield & ~(0xFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Alignment {
        get => (this._bitfield >> 20) & 0xF
        set => this._bitfield := ((value & 0xF) << 20) | (this._bitfield & ~(0xF << 20))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 20 })
        this.DeleteProp("__New")
    }
}
