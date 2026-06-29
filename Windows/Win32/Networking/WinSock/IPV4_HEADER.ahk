#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR.ahk" { IN_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV4_HEADER {
    #StructPack 4

    VersionAndHeaderLength : Int8


    /**
     * @type {Integer}
     */
    HeaderLength {
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
    TypeOfServiceAndEcnField : Int8


    /**
     * @type {Integer}
     */
    EcnField {
        get => (this._bitfield1 >> 0) & 0x3
        set => this._bitfield1 := ((value & 0x3) << 0) | (this._bitfield1 & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    TypeOfService {
        get => (this._bitfield1 >> 2) & 0x3F
        set => this._bitfield1 := ((value & 0x3F) << 2) | (this._bitfield1 & ~(0x3F << 2))
    }
    TotalLength : UInt16

    Identification : UInt16

    FlagsAndOffset : UInt16


    /**
     * @type {Integer}
     */
    DontUse1 {
        get => (this._bitfield2 >> 0) & 0x1F
        set => this._bitfield2 := ((value & 0x1F) << 0) | (this._bitfield2 & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    MoreFragments {
        get => (this._bitfield2 >> 5) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 5) | (this._bitfield2 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    DontFragment {
        get => (this._bitfield2 >> 6) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 6) | (this._bitfield2 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    DontUse2 {
        get => (this._bitfield2 >> 8) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 8) | (this._bitfield2 & ~(0xFF << 8))
    }
    TimeToLive : Int8

    Protocol : Int8

    HeaderChecksum : UInt16

    SourceAddress : IN_ADDR

    DestinationAddress : IN_ADDR

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, '_bitfield1', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, '_bitfield2', { type: Int16, offset: 6 })
        this.DeleteProp("__New")
    }
}
