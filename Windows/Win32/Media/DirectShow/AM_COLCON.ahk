#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the color contrast description from the DVD highlight (HLI) structure.
 * @remarks
 * 
 * This structure is contained within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_property_sphli">AM_PROPERTY_SPHLI</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ns-dvdmedia-am_colcon
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_COLCON extends Win32Struct
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
     * Emphasis color 1.
     * @type {Integer}
     */
    emph1col {
        get => (this._bitfield1 >> 0) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 0) | (this._bitfield1 & ~(0xF << 0))
    }

    /**
     * Emphasis color 2.
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
     * Background color.
     * @type {Integer}
     */
    backcol {
        get => (this._bitfield2 >> 0) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 0) | (this._bitfield2 & ~(0xF << 0))
    }

    /**
     * Pattern color.
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
     * Emphasis contrast 1.
     * @type {Integer}
     */
    emph1con {
        get => (this._bitfield3 >> 0) & 0xF
        set => this._bitfield3 := ((value & 0xF) << 0) | (this._bitfield3 & ~(0xF << 0))
    }

    /**
     * Emphasis contrast 2.
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
     * Background contrast.
     * @type {Integer}
     */
    backcon {
        get => (this._bitfield4 >> 0) & 0xF
        set => this._bitfield4 := ((value & 0xF) << 0) | (this._bitfield4 & ~(0xF << 0))
    }

    /**
     * Pattern contrast.
     * @type {Integer}
     */
    patcon {
        get => (this._bitfield4 >> 4) & 0xF
        set => this._bitfield4 := ((value & 0xF) << 4) | (this._bitfield4 & ~(0xF << 4))
    }
}
