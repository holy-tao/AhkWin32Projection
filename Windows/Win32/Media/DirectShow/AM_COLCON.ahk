#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the color contrast description from the DVD highlight (HLI) structure.
 * @remarks
 * This structure is contained within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_property_sphli">AM_PROPERTY_SPHLI</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_colcon
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_COLCON {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - emph1col
     * - emph2col
     */
    _bitfield1 : Int8


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
     */
    _bitfield2 : Int8


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
     */
    _bitfield3 : Int8


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
     */
    _bitfield4 : Int8


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
