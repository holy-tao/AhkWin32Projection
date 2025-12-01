#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about a pen flick.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ns-tabflicks-flick_point
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class FLICK_POINT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - x
     * - y
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The x-coordinate where the pen flick took place.
     * @type {Integer}
     */
    x {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * The y-coordinate where the pen flick took place.
     * @type {Integer}
     */
    y {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
}
