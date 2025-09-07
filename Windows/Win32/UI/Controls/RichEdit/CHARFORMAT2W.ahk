#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\CHARFORMATW.ahk

/**
 * Contains information about character formatting in a rich edit control. (CHARFORMAT2W)
 * @remarks
 * To turn off a formatting attribute, set the appropriate value in <b>dwMask</b> but do not set the corresponding value in <b>dwEffects</b>. For example, to turn off italics, set <b>CFM_ITALIC</b> but do not set <b>CFE_ITALIC</b>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The richedit.h header defines CHARFORMAT2 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-charformat2w
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 * @charset Unicode
 */
class CHARFORMAT2W extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {CHARFORMATW}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CHARFORMATW(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Font weight. This member is the same as the <b>lfWeight</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure. To use this member, set the <b>CFM_WEIGHT</b> flag in the <b>dwMask</b> member.
     * @type {Integer}
     */
    wWeight {
        get => NumGet(this, 92, "ushort")
        set => NumPut("ushort", value, this, 92)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Horizontal space between letters, in twips. This value has no effect on the text displayed by a rich edit control; it is included for compatibility with Windows TOM interfaces. To use this member, set the <b>CFM_SPACING</b> flag in the <b>dwMask</b> member.
     * @type {Integer}
     */
    sSpacing {
        get => NumGet(this, 94, "short")
        set => NumPut("short", value, this, 94)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Background color. To use this member, set the <b>CFM_BACKCOLOR</b> flag in the <b>dwMask</b> member. This member is ignored if the <b>CFE_AUTOBACKCOLOR</b> character effect is specified. To generate a , use the  macro.
     * @type {Integer}
     */
    crBackColor {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LCID</a></b>
     * 
     * A 32-bit locale identifier that contains a language identifier in the lower word and a sorting identifier and reserved value in the upper word. This member has no effect on the text displayed by a rich edit control, but spelling and grammar checkers can use it to deal with language-dependent problems. You can use the  macro to create an <b>LCID</b> value. To use this member, set the <b>CFM_LCID</b> flag in the <b>dwMask</b> member.
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    dwCookie {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SHORT</a></b>
     * 
     * Character style handle. This value has no effect on the text displayed by a rich edit control; it is included for compatibility with WindowsTOM  interfaces. To use this member, set the <b>CFM_STYLE</b> flag in the <b>dwMask</b> member. For more information see the TOM documentation.
     * @type {Integer}
     */
    sStyle {
        get => NumGet(this, 108, "short")
        set => NumPut("short", value, this, 108)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Value of the font size, above which to kern the character (<b>yHeight</b>). This value has no effect on the text displayed by a rich edit control; it is included for compatibility with TOM interfaces. To use this member, set the <b>CFM_KERNING</b> flag in the <b>dwMask</b> member.
     * @type {Integer}
     */
    wKerning {
        get => NumGet(this, 110, "ushort")
        set => NumPut("ushort", value, this, 110)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * @type {Integer}
     */
    bUnderlineType {
        get => NumGet(this, 112, "char")
        set => NumPut("char", value, this, 112)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Text animation type. This value has no effect on the text displayed by a rich edit control; it is included for compatibility with TOM interfaces. To use this member, set the <b>CFM_ANIMATION</b> flag in the <b>dwMask</b> member.
     * @type {Integer}
     */
    bAnimation {
        get => NumGet(this, 113, "char")
        set => NumPut("char", value, this, 113)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * An index that identifies the author making a revision. The rich edit control uses different text colors for each different author index. To use this member, set the <b>CFM_REVAUTHOR</b> flag in the <b>dwMask</b> member.
     * @type {Integer}
     */
    bRevAuthor {
        get => NumGet(this, 114, "char")
        set => NumPut("char", value, this, 114)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Underline color:
     * 
     * * UnderlineColor_Black = 0x00;
     * * UnderlineColor_Blue = 0x01;
     * * UnderlineColor_Aqua = 0x02;
     * * UnderlineColor_Lime = 0x03;
     * * UnderlineColor_Fuchsia = 0x04;
     * * UnderlineColor_Red = 0x05;
     * * UnderlineColor_Yellow = 0x06;
     * * UnderlineColor_White = 0x07;
     * * UnderlineColor_Navy = 0x08;
     * * UnderlineColor_Teal = 0x09;
     * * UnderlineColor_Green = 0x0A;
     * * UnderlineColor_Purple = 0x0B;
     * * UnderlineColor_Maroon = 0x0C;
     * * UnderlineColor_Olive = 0x0D;
     * * UnderlineColor_DkGray = 0x0E;
     * * UnderlineColor_LtGray = 0x0F;
     * @type {Integer}
     */
    bUnderlineColor {
        get => NumGet(this, 115, "char")
        set => NumPut("char", value, this, 115)
    }
}
