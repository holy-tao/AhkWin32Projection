#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_MIRACAST_CHUNK_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - FrameNumber
     * - PartNumber
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FrameNumber {
        get => (this._bitfield >> 0) & 0xFFFFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    PartNumber {
        get => (this._bitfield >> 40) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 40) | (this._bitfield & ~(0xFFFFFF << 40))
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
