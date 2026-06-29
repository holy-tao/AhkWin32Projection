#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PARAFORMAT_NUMBERING.ahk" { PARAFORMAT_NUMBERING }
#Import ".\PARAFORMAT_MASK.ahk" { PARAFORMAT_MASK }
#Import ".\PARAFORMAT_ALIGNMENT.ahk" { PARAFORMAT_ALIGNMENT }

/**
 * Contains information about paragraph formatting attributes in a rich edit control. (PARAFORMAT)
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-paraformat
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct PARAFORMAT {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Structure size, in bytes. The member must be filled before passing to the rich edit control.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwMask : PARAFORMAT_MASK

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Value specifying numbering options. This member can be zero or PFN_BULLET.
     */
    wNumbering : PARAFORMAT_NUMBERING

    wReserved : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Indentation of the first line in the paragraph, in twips. If the paragraph formatting is being set and PFM_OFFSETINDENT is specified, this member is treated as a relative value that is added to the starting indentation of each affected paragraph.
     */
    dxStartIndent : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Size, of the right indentation relative to the right margin, in twips.
     */
    dxRightIndent : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Indentation of the second and subsequent lines of a paragraph relative to the starting indentation, in twips. The first line is indented if this member is negative or outdented if this member is positive.
     */
    dxOffset : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     */
    wAlignment : PARAFORMAT_ALIGNMENT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Number of tab stops.
     */
    cTabCount : Int16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Array of absolute tab stop positions. Each element in the array specifies information about a tab stop. The 24 low-order bits specify the absolute offset, in twips. To use this member, set the PFM_TABSTOPS flag in the 
     * 					<b>dwMask</b> member.
     *                     
     * 
     * <b>Rich Edit 2.0:</b> For compatibility with TOM interfaces, you can use the eight high-order bits to store additional information about each tab stop.
     */
    rgxTabs : UInt32[32]

    static __New() {
        DefineProp(this.Prototype, 'wEffects', { type: UInt16, offset: 10 })
        this.DeleteProp("__New")
    }
}
