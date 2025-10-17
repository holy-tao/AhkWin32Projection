#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class PID_BITS extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - Reserved
     * - ProgramId
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ProgramId {
        get => (this._bitfield >> 3) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 3) | (this._bitfield & ~(0x1FFF << 3))
    }
}
