#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the attributes of cells in a table row.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-tablecellparms
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class TABLECELLPARMS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The width of a cell (\cellx).
     * @type {Integer}
     */
    dxWidth {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - nVertAlign
     * - fMergeTop
     * - fMergePrev
     * - fVertical
     * - fMergeStart
     * - fMergeCont
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    nVertAlign {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * 
     * @type {Integer}
     */
    fMergeTop {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * 
     * @type {Integer}
     */
    fMergePrev {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * 
     * @type {Integer}
     */
    fVertical {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * 
     * @type {Integer}
     */
    fMergeStart {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * 
     * @type {Integer}
     */
    fMergeCont {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Shading in .01% (\clshdng). This controls the amount of pattern foreground color (<b>crForePat</b>) and pattern background color (<b>crBackPat</b>) that is used to create the cell background color. If <b>wShading</b> is 0, the cell background is <b>crBackPat</b>. If it's 10000, the cell background is <b>crForePat</b>. Values of <b>wShading</b> in between are mixtures of the two pattern colors.
     * @type {Integer}
     */
    wShading {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Left border width, in twips  (\clbrdrl\brdrwN).
     * @type {Integer}
     */
    dxBrdrLeft {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Top border width (\clbrdrt\brdrwN).
     * @type {Integer}
     */
    dyBrdrTop {
        get => NumGet(this, 10, "short")
        set => NumPut("short", value, this, 10)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Right border width (\clbrdrr\brdrwN).
     * @type {Integer}
     */
    dxBrdrRight {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Bottom border width (\clbrdrb\brdrwN).
     * @type {Integer}
     */
    dyBrdrBottom {
        get => NumGet(this, 14, "short")
        set => NumPut("short", value, this, 14)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Left border color (\clbrdrl\brdrcf).
     * @type {COLORREF}
     */
    crBrdrLeft {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Top border color (\clbrdrt\brdrcf).
     * @type {COLORREF}
     */
    crBrdrTop {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Right border color (\clbrdrr\brdrcf).
     * @type {COLORREF}
     */
    crBrdrRight {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Bottom border color (\clbrdrb\brdrcf).
     * @type {COLORREF}
     */
    crBrdrBottom {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Background color (\clcbpat).
     * @type {COLORREF}
     */
    crBackPat {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Foreground color (\clcfpat).
     * @type {COLORREF}
     */
    crForePat {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
