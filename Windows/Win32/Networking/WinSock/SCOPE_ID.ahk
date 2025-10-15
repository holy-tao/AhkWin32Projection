#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SCOPE_ID extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Zone
     * - Level
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Zone {
        get => (this._bitfield >> 0) & 0xFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Level {
        get => (this._bitfield >> 28) & 0xF
        set => this._bitfield := ((value & 0xF) << 28) | (this._bitfield & ~(0xF << 28))
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
