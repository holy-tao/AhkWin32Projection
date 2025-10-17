#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IN_ADDR.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IGMP_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Type
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

    /**
     * @type {Integer}
     */
    VersionType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    MaxRespTime {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Code {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
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
}
