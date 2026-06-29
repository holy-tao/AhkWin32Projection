#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV6_HEADER {
    #StructPack 4

    VersionClassFlow : UInt32


    /**
     * @type {Integer}
     */
    Anonymous1 {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    Version {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    Anonymous2 {
        get => (this._bitfield >> 8) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 8) | (this._bitfield & ~(0xFFFFFF << 8))
    }
    PayloadLength : UInt16

    NextHeader : Int8

    HopLimit : Int8

    SourceAddress : IN6_ADDR

    DestinationAddress : IN6_ADDR

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 0 })
        this.DeleteProp("__New")
    }
}
