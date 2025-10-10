#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PARAFORMAT.ahk

/**
 * Contains information about paragraph formatting attributes in a rich edit control.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-paraformat2
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class PARAFORMAT2 extends Win32Struct
{
    static sizeof => 192

    static packingSize => 8

    /**
     * @type {PARAFORMAT}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := PARAFORMAT(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Size of the spacing above the paragraph, in twips. To use this member, set the PFM_SPACEBEFORE flag in the 
     * 					<b>dwMask</b> member. The value must be greater than or equal to zero.
     * @type {Integer}
     */
    dySpaceBefore {
        get => NumGet(this, 156, "int")
        set => NumPut("int", value, this, 156)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Specifies the size of the spacing below the paragraph, in twips. To use this member, set the PFM_SPACEAFTER flag in the 
     * 					<b>dwMask</b> member. The value must be greater than or equal to zero.
     * @type {Integer}
     */
    dySpaceAfter {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Spacing between lines. For a description of how this value is interpreted, see the 
     * 					<b>bLineSpacingRule</b> member. To use this member, set the PFM_LINESPACING flag in the 
     * 					<b>dwMask</b> member.
     * @type {Integer}
     */
    dyLineSpacing {
        get => NumGet(this, 164, "int")
        set => NumPut("int", value, this, 164)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Text style. To use this member, set the PFM_STYLE flag in the 
     * 					<b>dwMask</b> member. This member is included only for compatibility with TOM interfaces and Word; the rich edit control stores the value but does not use it to display the text.
     * @type {Integer}
     */
    sStyle {
        get => NumGet(this, 168, "short")
        set => NumPut("short", value, this, 168)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Type of line spacing. To use this member, set the PFM_LINESPACING flag in the
     * @type {Integer}
     */
    bLineSpacingRule {
        get => NumGet(this, 170, "char")
        set => NumPut("char", value, this, 170)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Reserved; must be zero.
     * @type {Integer}
     */
    bOutlineLevel {
        get => NumGet(this, 171, "char")
        set => NumPut("char", value, this, 171)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Percentage foreground color used in shading. The 
     * 					<b>wShadingStyle</b> member specifies the foreground and background shading colors. A value of 5 indicates a shading color consisting of 5 percent foreground color and 95 percent background color. To use these members, set the PFM_SHADING flag in the 
     * 					<b>dwMask</b> member. This member is included only for compatibility with Word; the rich edit control stores the value but does not use it to display the text.
     * @type {Integer}
     */
    wShadingWeight {
        get => NumGet(this, 172, "ushort")
        set => NumPut("ushort", value, this, 172)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Style and colors used for background shading. Bits 0 to 3 contain the shading style, bits 4 to 7 contain the foreground color index, and bits 8 to 11 contain the background color index. To use this member, set the PFM_SHADING flag in the 
     * 					<b>dwMask</b> member. This member is included only for compatibility with Word; the rich edit control stores the value but does not use it to display the text.
     * @type {Integer}
     */
    wShadingStyle {
        get => NumGet(this, 174, "ushort")
        set => NumPut("ushort", value, this, 174)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Starting number or Unicode value used for numbered paragraphs. Use this member in conjunction with the 
     * 					<b>wNumbering</b> member. This member is included only for compatibility with TOM interfaces; the rich edit control stores the value but does not use it to display the text or bullets. To use this member, set the PFM_NUMBERINGSTART flag in the 
     * 					<b>dwMask</b> member.
     * @type {Integer}
     */
    wNumberingStart {
        get => NumGet(this, 176, "ushort")
        set => NumPut("ushort", value, this, 176)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Numbering style used with numbered paragraphs. Use this member in conjunction with the 
     * 					<b>wNumbering</b> member. This member is included only for compatibility with TOM interfaces; the rich edit control stores the value but rich edit versions earlier than 3.0 do not use it to display the text or bullets. To use this member, set the PFM_NUMBERINGSTYLE flag in the
     * @type {Integer}
     */
    wNumberingStyle {
        get => NumGet(this, 178, "ushort")
        set => NumPut("ushort", value, this, 178)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Minimum space between a paragraph number and the paragraph text, in twips. Use this member in conjunction with the 
     * 					<b>wNumbering</b> member. The 
     * 					<b>wNumberingTab</b> member is included for compatibility with TOM interfaces; previous to Microsoft Rich Edit 3.0, the rich edit control stores the value but does not use it to display text. To use this member, set the PFM_NUMBERINGTAB flag in the 
     * 					<b>dwMask</b> member.
     * @type {Integer}
     */
    wNumberingTab {
        get => NumGet(this, 180, "ushort")
        set => NumPut("ushort", value, this, 180)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * The space between the border and the paragraph text, in twips. The 
     * 					<b>wBorderSpace</b> member is included for compatibility with Word; the rich edit control stores the values but does not use them to display text. To use this member, set the PFM_BORDER flag in the 
     * 					<b>dwMask</b> member.
     * @type {Integer}
     */
    wBorderSpace {
        get => NumGet(this, 182, "ushort")
        set => NumPut("ushort", value, this, 182)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Border width, in twips. To use this member, set the PFM_BORDER flag in the 
     * 					<b>dwMask</b> member.
     * @type {Integer}
     */
    wBorderWidth {
        get => NumGet(this, 184, "ushort")
        set => NumPut("ushort", value, this, 184)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Border location, style, and color. Bits 0 to 7 specify the border locations, bits 8 to 11 specify the border style, and bits 12 to 15 specify the border color index. To use this member, set the PFM_BORDER flag in the 
     * 					<b>dwMask</b> member.
     * @type {Integer}
     */
    wBorders {
        get => NumGet(this, 186, "ushort")
        set => NumPut("ushort", value, this, 186)
    }
}
