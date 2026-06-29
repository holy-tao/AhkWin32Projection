#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ICMP_HEADER.ahk" { ICMP_HEADER }
#Import ".\IN6_ADDR.ahk" { IN6_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct MLDV2_QUERY_HEADER {
    #StructPack 2

    IcmpHeader : ICMP_HEADER

    MaxRespCode : UInt16


    /**
     * @type {Integer}
     */
    MaxRespCodeMantissaHi {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    MaxRespCodeExponent {
        get => (this._bitfield >> 4) & 0x7
        set => this._bitfield := ((value & 0x7) << 4) | (this._bitfield & ~(0x7 << 4))
    }

    /**
     * @type {Integer}
     */
    MaxRespCodeType {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    MaxRespCodeMantissaLo {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }
    Reserved : UInt16

    MulticastAddress : IN6_ADDR

    /**
     * This bitfield backs the following members:
     * - QuerierRobustnessVariable
     * - SuppressRouterSideProcessing
     * - QueryReserved
     */
    _bitfield1 : Int8


    /**
     * @type {Integer}
     */
    QuerierRobustnessVariable {
        get => (this._bitfield1 >> 0) & 0x7
        set => this._bitfield1 := ((value & 0x7) << 0) | (this._bitfield1 & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    SuppressRouterSideProcessing {
        get => (this._bitfield1 >> 3) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 3) | (this._bitfield1 & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    QueryReserved {
        get => (this._bitfield1 >> 4) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 4) | (this._bitfield1 & ~(0xF << 4))
    }
    QueriersQueryInterfaceCode : Int8


    /**
     * @type {Integer}
     */
    QQCMantissa {
        get => (this._bitfield2 >> 0) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 0) | (this._bitfield2 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    QQCExponent {
        get => (this._bitfield2 >> 4) & 0x7
        set => this._bitfield2 := ((value & 0x7) << 4) | (this._bitfield2 & ~(0x7 << 4))
    }

    /**
     * @type {Integer}
     */
    QQCType {
        get => (this._bitfield2 >> 7) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 7) | (this._bitfield2 & ~(0x1 << 7))
    }
    SourceCount : UInt16

    static __New() {
        DefineProp(this.Prototype, '_bitfield', { type: Int16, offset: 4 })
        DefineProp(this.Prototype, '_bitfield2', { type: Int8, offset: 25 })
        this.DeleteProp("__New")
    }
}
