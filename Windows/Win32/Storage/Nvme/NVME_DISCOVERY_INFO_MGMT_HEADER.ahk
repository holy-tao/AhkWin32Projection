#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_DISCOVERY_INFO_MGMT_HEADER extends Win32Struct
{
    static sizeof => 1024

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TDL {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    NUMENT {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ENTFMT {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ETYPE {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    PORTLCL {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * This bitfield backs the following members:
     * - NQN
     * - TSAS
     * - TRSVCID
     * - ADRFAM
     * - TRTYPE
     * - PORTID
     * - TRADDR
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    NQN {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    TSAS {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    TRSVCID {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    ADRFAM {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    TRTYPE {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    PORTID {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    TRADDR {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    AsUshort {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Array<Byte>}
     */
    EID{
        get {
            if(!this.HasProp("__EIDProxyArray"))
                this.__EIDProxyArray := Win32FixedArray(this.ptr + 24, 256, Primitive, "char")
            return this.__EIDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ENAME{
        get {
            if(!this.HasProp("__ENAMEProxyArray"))
                this.__ENAMEProxyArray := Win32FixedArray(this.ptr + 280, 256, Primitive, "char")
            return this.__ENAMEProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    EVER{
        get {
            if(!this.HasProp("__EVERProxyArray"))
                this.__EVERProxyArray := Win32FixedArray(this.ptr + 536, 64, Primitive, "char")
            return this.__EVERProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 600, 424, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }
}
