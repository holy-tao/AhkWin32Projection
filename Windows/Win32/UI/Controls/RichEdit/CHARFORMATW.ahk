#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CFE_EFFECTS.ahk" { CFE_EFFECTS }
#Import ".\CFM_MASK.ahk" { CFM_MASK }
#Import "..\..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\..\Graphics\Gdi\FONT_CHARSET.ahk" { FONT_CHARSET }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about character formatting in a rich edit control. (CHARFORMATW)
 * @remarks
 * To turn off a formatting attribute, set the appropriate value in <b>dwMask</b> but do not set the corresponding value in <b>dwEffects</b>. For example, to turn off italics, set CFM_ITALIC but do not set CFE_ITALIC.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The richedit.h header defines CHARFORMAT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-charformatw
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @charset Unicode
 */
export default struct CHARFORMATW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size in bytes of the specified structure. This member must be set before passing the structure to the rich edit control.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwMask : CFM_MASK

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwEffects : CFE_EFFECTS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character height, in twips (1/1440 of an inch or 1/20 of a printer's point).
     */
    yHeight : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character offset, in twips, from the baseline. If the value of this member is positive, the character is a superscript; if it is negative, the character is a subscript.
     */
    yOffset : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Text color. This member is ignored if the CFE_AUTOCOLOR character effect is specified. To generate a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     */
    crTextColor : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Character set value. The <b>bCharSet</b> member can be one of the values specified for the <b>lfCharSet</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure. Microsoft Rich Edit 3.0 may override this value if it is invalid for the target characters.
     */
    bCharSet : FONT_CHARSET

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * Font family and pitch. This member is the same as the <b>lfPitchAndFamily</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.
     */
    bPitchAndFamily : Int8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">TCHAR</a>[LF_FACESIZE]</b>
     * 
     * Null-terminated character array specifying the font name.
     */
    szFaceName : WCHAR[32]

}
