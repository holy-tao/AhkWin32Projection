#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class VLAN_TAG extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Tag {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - VID
     * - CFI
     * - User_Priority
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VID {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    CFI {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * @type {Integer}
     */
    User_Priority {
        get => (this._bitfield >> 13) & 0x7
        set => this._bitfield := ((value & 0x7) << 13) | (this._bitfield & ~(0x7 << 13))
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
