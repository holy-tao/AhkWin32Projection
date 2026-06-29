#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR.ahk" { IN_ADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IGMP_HEADER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Type
     * - Version
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    Type {
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
    Reserved : Int8

    Checksum : UInt16

    MulticastAddress : IN_ADDR

    static __New() {
        DefineProp(this.Prototype, 'VersionType', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'MaxRespTime', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'Code', { type: Int8, offset: 1 })
        this.DeleteProp("__New")
    }
}
