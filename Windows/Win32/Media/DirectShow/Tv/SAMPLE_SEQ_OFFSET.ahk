#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class SAMPLE_SEQ_OFFSET extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - Type
     * - Offset
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
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
    Offset {
        get => (this._bitfield >> 4) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 4) | (this._bitfield & ~(0xFFFFF << 4))
    }
}
