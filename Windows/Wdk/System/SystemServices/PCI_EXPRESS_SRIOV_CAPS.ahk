#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_EXPRESS_SRIOV_CAPS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - VFMigrationCapable
     * - Reserved1
     * - VFMigrationInterruptNumber
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VFMigrationCapable {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 1) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 1) | (this._bitfield & ~(0xFFFFF << 1))
    }

    /**
     * @type {Integer}
     */
    VFMigrationInterruptNumber {
        get => (this._bitfield >> 21) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 21) | (this._bitfield & ~(0x7FF << 21))
    }

    /**
     * @type {Integer}
     */
    AsULONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
