#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PARAFORMAT_SHADING_STYLE.ahk" { PARAFORMAT_SHADING_STYLE }
#Import ".\PARAFORMAT_NUMBERING.ahk" { PARAFORMAT_NUMBERING }
#Import ".\PARAFORMAT_MASK.ahk" { PARAFORMAT_MASK }
#Import ".\PARAFORMAT_NUMBERING_STYLE.ahk" { PARAFORMAT_NUMBERING_STYLE }
#Import ".\PARAFORMAT_ALIGNMENT.ahk" { PARAFORMAT_ALIGNMENT }
#Import ".\PARAFORMAT.ahk" { PARAFORMAT }
#Import ".\PARAFORMAT_BORDERS.ahk" { PARAFORMAT_BORDERS }

/**
 * Contains information about paragraph formatting attributes in a rich edit control. (PARAFORMAT2)
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-paraformat2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct PARAFORMAT2 {
    #StructPack 4

    Base : PARAFORMAT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Size of the spacing above the paragraph, in twips. To use this member, set the PFM_SPACEBEFORE flag in the 
     * 					<b>dwMask</b> member. The value must be greater than or equal to zero.
     */
    dySpaceBefore : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Specifies the size of the spacing below the paragraph, in twips. To use this member, set the PFM_SPACEAFTER flag in the 
     * 					<b>dwMask</b> member. The value must be greater than or equal to zero.
     */
    dySpaceAfter : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Spacing between lines. For a description of how this value is interpreted, see the 
     * 					<b>bLineSpacingRule</b> member. To use this member, set the PFM_LINESPACING flag in the 
     * 					<b>dwMask</b> member.
     */
    dyLineSpacing : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Text style. To use this member, set the PFM_STYLE flag in the 
     * 					<b>dwMask</b> member. This member is included only for compatibility with TOM interfaces and Word; the rich edit control stores the value but does not use it to display the text.
     */
    sStyle : Int16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Type of line spacing. To use this member, set the PFM_LINESPACING flag in the
     */
    bLineSpacingRule : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Reserved; must be zero.
     */
    bOutlineLevel : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Percentage foreground color used in shading. The 
     * 					<b>wShadingStyle</b> member specifies the foreground and background shading colors. A value of 5 indicates a shading color consisting of 5 percent foreground color and 95 percent background color. To use these members, set the PFM_SHADING flag in the 
     * 					<b>dwMask</b> member. This member is included only for compatibility with Word; the rich edit control stores the value but does not use it to display the text.
     */
    wShadingWeight : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Style and colors used for background shading. Bits 0 to 3 contain the shading style, bits 4 to 7 contain the foreground color index, and bits 8 to 11 contain the background color index. To use this member, set the PFM_SHADING flag in the 
     * 					<b>dwMask</b> member. This member is included only for compatibility with Word; the rich edit control stores the value but does not use it to display the text.
     */
    wShadingStyle : PARAFORMAT_SHADING_STYLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Starting number or Unicode value used for numbered paragraphs. Use this member in conjunction with the 
     * 					<b>wNumbering</b> member. This member is included only for compatibility with TOM interfaces; the rich edit control stores the value but does not use it to display the text or bullets. To use this member, set the PFM_NUMBERINGSTART flag in the 
     * 					<b>dwMask</b> member.
     */
    wNumberingStart : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Numbering style used with numbered paragraphs. Use this member in conjunction with the 
     * 					<b>wNumbering</b> member. This member is included only for compatibility with TOM interfaces; the rich edit control stores the value but rich edit versions earlier than 3.0 do not use it to display the text or bullets. To use this member, set the PFM_NUMBERINGSTYLE flag in the
     */
    wNumberingStyle : PARAFORMAT_NUMBERING_STYLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Minimum space between a paragraph number and the paragraph text, in twips. Use this member in conjunction with the 
     * 					<b>wNumbering</b> member. The 
     * 					<b>wNumberingTab</b> member is included for compatibility with TOM interfaces; previous to Microsoft Rich Edit 3.0, the rich edit control stores the value but does not use it to display text. To use this member, set the PFM_NUMBERINGTAB flag in the 
     * 					<b>dwMask</b> member.
     */
    wNumberingTab : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * The space between the border and the paragraph text, in twips. The 
     * 					<b>wBorderSpace</b> member is included for compatibility with Word; the rich edit control stores the values but does not use them to display text. To use this member, set the PFM_BORDER flag in the 
     * 					<b>dwMask</b> member.
     */
    wBorderSpace : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Border width, in twips. To use this member, set the PFM_BORDER flag in the 
     * 					<b>dwMask</b> member.
     */
    wBorderWidth : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Border location, style, and color. Bits 0 to 7 specify the border locations, bits 8 to 11 specify the border style, and bits 12 to 15 specify the border color index. To use this member, set the PFM_BORDER flag in the 
     * 					<b>dwMask</b> member.
     */
    wBorders : PARAFORMAT_BORDERS

}
