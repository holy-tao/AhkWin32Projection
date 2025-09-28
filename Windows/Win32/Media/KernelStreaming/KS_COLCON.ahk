#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_COLCON extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - emph1col
     * - emph2col
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    emph1col {
        get => (this._bitfield1 >> 0) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 0) | (this._bitfield1 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    emph2col {
        get => (this._bitfield1 >> 4) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 4) | (this._bitfield1 & ~(0xF << 4))
    }

    /**
     * This bitfield backs the following members:
     * - backcol
     * - patcol
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    backcol {
        get => (this._bitfield2 >> 0) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 0) | (this._bitfield2 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    patcol {
        get => (this._bitfield2 >> 4) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 4) | (this._bitfield2 & ~(0xF << 4))
    }

    /**
     * This bitfield backs the following members:
     * - emph1con
     * - emph2con
     * @type {Integer}
     */
    _bitfield3 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    emph1con {
        get => (this._bitfield3 >> 0) & 0xF
        set => this._bitfield3 := ((value & 0xF) << 0) | (this._bitfield3 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    emph2con {
        get => (this._bitfield3 >> 4) & 0xF
        set => this._bitfield3 := ((value & 0xF) << 4) | (this._bitfield3 & ~(0xF << 4))
    }

    /**
     * This bitfield backs the following members:
     * - backcon
     * - patcon
     * @type {Integer}
     */
    _bitfield4 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    backcon {
        get => (this._bitfield4 >> 0) & 0xF
        set => this._bitfield4 := ((value & 0xF) << 0) | (this._bitfield4 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    patcon {
        get => (this._bitfield4 >> 4) & 0xF
        set => this._bitfield4 := ((value & 0xF) << 4) | (this._bitfield4 & ~(0xF << 4))
    }
}
