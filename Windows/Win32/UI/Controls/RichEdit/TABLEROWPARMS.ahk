#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the attributes of rows in a table.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-tablerowparms
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct TABLEROWPARMS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The count of bytes in this structure.
     */
    cbRow : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The count of bytes in <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-tablecellparms">TABLECELLPARMS</a>.
     */
    cbCell : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The count of cells in a row, up to the maximum specified by MAX_TABLE_CELLS.
     */
    cCell : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The count of rows.
     */
    cRow : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The size of the left and right margins in a cell (\trgaph).
     */
    dxCellMargin : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The amount of left indentation, or right indentation if the <b>fRTL</b> member is <b>TRUE</b> (similar to \trleft).
     */
    dxIndent : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The height of a row (\trrh).
     */
    dyHeight : Int32

    /**
     * This bitfield backs the following members:
     * - nAlignment
     * - fRTL
     * - fKeep
     * - fKeepFollow
     * - fWrap
     * - fIdentCells
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    nAlignment {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    fRTL {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    fKeep {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    fKeepFollow {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    fWrap {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    fIdentCells {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }
    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The character position that indicates where to insert table. A value of –1 indicates the character position of the selection.
     */
    cpStartRow : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The table nesting level (<a href="https://docs.microsoft.com/windows/desktop/Controls/em-gettableparms">EM_GETTABLEPARMS</a> only).
     */
    bTableLevel : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The index of the cell to insert or delete (<a href="https://docs.microsoft.com/windows/desktop/Controls/em-settableparms">EM_SETTABLEPARMS</a> only).
     */
    iCell : Int8

}
