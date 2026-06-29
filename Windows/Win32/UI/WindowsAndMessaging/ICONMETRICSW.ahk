#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\FONT_OUTPUT_PRECISION.ahk" { FONT_OUTPUT_PRECISION }
#Import "..\..\Graphics\Gdi\FONT_CLIP_PRECISION.ahk" { FONT_CLIP_PRECISION }
#Import "..\..\Graphics\Gdi\FONT_QUALITY.ahk" { FONT_QUALITY }
#Import "..\..\Graphics\Gdi\LOGFONTW.ahk" { LOGFONTW }
#Import "..\..\Graphics\Gdi\FONT_CHARSET.ahk" { FONT_CHARSET }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains the scalable metrics associated with icons. This structure is used with the SystemParametersInfo function when the SPI_GETICONMETRICS or SPI_SETICONMETRICS action is specified. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winuser.h header defines ICONMETRICS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-iconmetricsw
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @charset Unicode
 */
export default struct ICONMETRICSW {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>int</b>
     * 
     * The horizontal space, in pixels, for each arranged icon.
     */
    iHorzSpacing : Int32

    /**
     * Type: <b>int</b>
     * 
     * The vertical space, in pixels, for each arranged icon.
     */
    iVertSpacing : Int32

    /**
     * Type: <b>int</b>
     * 
     * If this member is nonzero, icon titles wrap to a new line. If this member is zero, titles do not wrap.
     */
    iTitleWrap : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a></b>
     * 
     * The font to use for icon titles.
     */
    lfFont : LOGFONTW

}
