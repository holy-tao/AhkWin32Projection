#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the attributes of rows in a table.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-tablerowparms
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class TABLEROWPARMS extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The count of bytes in this structure.
     * @type {Integer}
     */
    cbRow {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The count of bytes in <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-tablecellparms">TABLECELLPARMS</a>.
     * @type {Integer}
     */
    cbCell {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The count of cells in a row, up to the maximum specified by MAX_TABLE_CELLS.
     * @type {Integer}
     */
    cCell {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The count of rows.
     * @type {Integer}
     */
    cRow {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The size of the left and right margins in a cell (\trgaph).
     * @type {Integer}
     */
    dxCellMargin {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The amount of left indentation, or right indentation if the <b>fRTL</b> member is <b>TRUE</b> (similar to \trleft).
     * @type {Integer}
     */
    dxIndent {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The height of a row (\trrh).
     * @type {Integer}
     */
    dyHeight {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The character position that indicates where to insert table. A value of –1 indicates the character position of the selection.
     * @type {Integer}
     */
    cpStartRow {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The table nesting level (<a href="https://docs.microsoft.com/windows/desktop/Controls/em-gettableparms">EM_GETTABLEPARMS</a> only).
     * @type {Integer}
     */
    bTableLevel {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The index of the cell to insert or delete (<a href="https://docs.microsoft.com/windows/desktop/Controls/em-settableparms">EM_SETTABLEPARMS</a> only).
     * @type {Integer}
     */
    iCell {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }
}
