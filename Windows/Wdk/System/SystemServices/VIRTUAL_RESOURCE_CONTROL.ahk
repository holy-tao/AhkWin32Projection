#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class VIRTUAL_RESOURCE_CONTROL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - TcVcMap
     * - RsvdP1
     * - LoadPortArbitrationTable
     * - PortArbitrationSelect
     * - RsvdP2
     * - VcID
     * - RsvdP3
     * - VcEnable
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TcVcMap {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    RsvdP1 {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    LoadPortArbitrationTable {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    PortArbitrationSelect {
        get => (this._bitfield >> 17) & 0x7
        set => this._bitfield := ((value & 0x7) << 17) | (this._bitfield & ~(0x7 << 17))
    }

    /**
     * @type {Integer}
     */
    RsvdP2 {
        get => (this._bitfield >> 20) & 0xF
        set => this._bitfield := ((value & 0xF) << 20) | (this._bitfield & ~(0xF << 20))
    }

    /**
     * @type {Integer}
     */
    VcID {
        get => (this._bitfield >> 24) & 0x7
        set => this._bitfield := ((value & 0x7) << 24) | (this._bitfield & ~(0x7 << 24))
    }

    /**
     * @type {Integer}
     */
    RsvdP3 {
        get => (this._bitfield >> 27) & 0xF
        set => this._bitfield := ((value & 0xF) << 27) | (this._bitfield & ~(0xF << 27))
    }

    /**
     * @type {Integer}
     */
    VcEnable {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }

    /**
     * @type {Integer}
     */
    AsULONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
