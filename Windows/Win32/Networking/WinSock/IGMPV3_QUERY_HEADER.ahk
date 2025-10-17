#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IGMPV3_QUERY_HEADER extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MaxRespCode {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * This bitfield backs the following members:
     * - MaxRespCodeMantissa
     * - MaxRespCodeExponent
     * - MaxRespCodeType
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    MaxRespCodeMantissa {
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
    Checksum {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {IN_ADDR}
     */
    MulticastAddress{
        get {
            if(!this.HasProp("__MulticastAddress"))
                this.__MulticastAddress := IN_ADDR(4, this)
            return this.__MulticastAddress
        }
    }

    /**
     * This bitfield backs the following members:
     * - QuerierRobustnessVariable
     * - SuppressRouterSideProcessing
     * - Reserved
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

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
    QueriersQueryInterfaceCode {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * This bitfield backs the following members:
     * - QQCMantissa
     * - QQCExponent
     * - QQCType
     * @type {Integer}
     */
    _bitfield12 {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    QQCMantissa {
        get => (this._bitfield12 >> 0) & 0xF
        set => this._bitfield12 := ((value & 0xF) << 0) | (this._bitfield12 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    QQCExponent {
        get => (this._bitfield12 >> 4) & 0x7
        set => this._bitfield12 := ((value & 0x7) << 4) | (this._bitfield12 & ~(0x7 << 4))
    }

    /**
     * @type {Integer}
     */
    QQCType {
        get => (this._bitfield12 >> 7) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 7) | (this._bitfield12 & ~(0x1 << 7))
    }

    /**
     * @type {Integer}
     */
    SourceCount {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
