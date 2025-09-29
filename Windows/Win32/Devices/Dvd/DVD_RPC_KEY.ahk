#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_RPC_KEY extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - UserResetsAvailable
     * - ManufacturerResetsAvailable
     * - TypeCode
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    UserResetsAvailable {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    ManufacturerResetsAvailable {
        get => (this._bitfield >> 3) & 0x7
        set => this._bitfield := ((value & 0x7) << 3) | (this._bitfield & ~(0x7 << 3))
    }

    /**
     * @type {Integer}
     */
    TypeCode {
        get => (this._bitfield >> 6) & 0x3
        set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
    }

    /**
     * @type {Integer}
     */
    RegionMask {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    RpcScheme {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Reserved02 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
