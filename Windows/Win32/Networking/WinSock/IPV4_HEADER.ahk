#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IPV4_HEADER extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    VersionAndHeaderLength {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - HeaderLength
     * - Version
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

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

    /**
     * @type {Integer}
     */
    TypeOfServiceAndEcnField {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * This bitfield backs the following members:
     * - EcnField
     * - TypeOfService
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

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

    /**
     * @type {Integer}
     */
    TotalLength {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Identification {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    FlagsAndOffset {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * This bitfield backs the following members:
     * - DontUse1
     * - MoreFragments
     * - DontFragment
     * - Reserved
     * - DontUse2
     * @type {Integer}
     */
    _bitfield12 {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    DontUse1 {
        get => (this._bitfield12 >> 0) & 0x1F
        set => this._bitfield12 := ((value & 0x1F) << 0) | (this._bitfield12 & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    MoreFragments {
        get => (this._bitfield12 >> 5) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 5) | (this._bitfield12 & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    DontFragment {
        get => (this._bitfield12 >> 6) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 6) | (this._bitfield12 & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield12 >> 7) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 7) | (this._bitfield12 & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    DontUse2 {
        get => (this._bitfield12 >> 8) & 0xFF
        set => this._bitfield12 := ((value & 0xFF) << 8) | (this._bitfield12 & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    TimeToLive {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Protocol {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    HeaderChecksum {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {IN_ADDR}
     */
    SourceAddress{
        get {
            if(!this.HasProp("__SourceAddress"))
                this.__SourceAddress := IN_ADDR(this.ptr + 12)
            return this.__SourceAddress
        }
    }

    /**
     * @type {IN_ADDR}
     */
    DestinationAddress{
        get {
            if(!this.HasProp("__DestinationAddress"))
                this.__DestinationAddress := IN_ADDR(this.ptr + 16)
            return this.__DestinationAddress
        }
    }
}
