#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * Defines the attributes of cells in a table row.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-tablecellparms
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct TABLECELLPARMS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The width of a cell (\cellx).
     */
    dxWidth : Int32

    /**
     * This bitfield backs the following members:
     * - nVertAlign
     * - fMergeTop
     * - fMergePrev
     * - fVertical
     * - fMergeStart
     * - fMergeCont
     */
    _bitfield : Int16


    /**
     * @type {Integer}
     */
    nVertAlign {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    fMergeTop {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    fMergePrev {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    fVertical {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    fMergeStart {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
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
     */
    wShading : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Left border width, in twips  (\clbrdrl\brdrwN).
     */
    dxBrdrLeft : Int16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Top border width (\clbrdrt\brdrwN).
     */
    dyBrdrTop : Int16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Right border width (\clbrdrr\brdrwN).
     */
    dxBrdrRight : Int16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Bottom border width (\clbrdrb\brdrwN).
     */
    dyBrdrBottom : Int16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Left border color (\clbrdrl\brdrcf).
     */
    crBrdrLeft : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Top border color (\clbrdrt\brdrcf).
     */
    crBrdrTop : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Right border color (\clbrdrr\brdrcf).
     */
    crBrdrRight : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Bottom border color (\clbrdrb\brdrcf).
     */
    crBrdrBottom : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Background color (\clcbpat).
     */
    crBackPat : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * Foreground color (\clcfpat).
     */
    crForePat : COLORREF

}
