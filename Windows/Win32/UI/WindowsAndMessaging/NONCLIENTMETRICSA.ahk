#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\FONT_OUTPUT_PRECISION.ahk" { FONT_OUTPUT_PRECISION }
#Import "..\..\Graphics\Gdi\LOGFONTA.ahk" { LOGFONTA }
#Import "..\..\Graphics\Gdi\FONT_CLIP_PRECISION.ahk" { FONT_CLIP_PRECISION }
#Import "..\..\Graphics\Gdi\FONT_QUALITY.ahk" { FONT_QUALITY }
#Import "..\..\Graphics\Gdi\FONT_CHARSET.ahk" { FONT_CHARSET }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains the scalable metrics associated with the nonclient area of a nonminimized window. (ANSI)
 * @remarks
 * If the <b>iPaddedBorderWidth</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-nonclientmetricsa">NONCLIENTMETRICS</a> structure is present, this structure is 4 bytes larger than for an application that is compiled with <b>_WIN32_WINNT</b> less than or equal to 0x0502. For more information about conditional compilation, see <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * 
 * <b>Windows Server 2003 and Windows XP/2000:  </b>If an application  that is compiled for Windows Server 2008 or Windows Vista must also run on Windows Server 2003 or Windows XP/2000, use the <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getversionexa">GetVersionEx</a> function to check the operating system version at run time and, if the application is running on Windows Server 2003 or Windows XP/2000, subtract the size of the <b>iPaddedBorderWidth</b> member from the <b>cbSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-nonclientmetricsa">NONCLIENTMETRICS</a> structure before calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function. 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines NONCLIENTMETRICS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-nonclientmetricsa
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @charset ANSI
 */
export default struct NONCLIENTMETRICSA {
    #StructPack 8

    /**
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(NONCLIENTMETRICS)</c>. For   information about application compatibility, see Remarks.
     */
    cbSize : UInt32 := this.Size

    /**
     * The thickness of the sizing border, in pixels. The default is 1 pixel.
     */
    iBorderWidth : Int32

    /**
     * The width of a standard vertical scroll bar, in pixels.
     */
    iScrollWidth : Int32

    /**
     * The height of a standard horizontal scroll bar, in pixels.
     */
    iScrollHeight : Int32

    /**
     * The width of caption buttons, in pixels.
     */
    iCaptionWidth : Int32

    /**
     * The height of caption buttons, in pixels.
     */
    iCaptionHeight : Int32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the caption font.
     */
    lfCaptionFont : LOGFONTA

    /**
     * The width of small caption buttons, in pixels.
     */
    iSmCaptionWidth : Int32

    /**
     * The height of small captions, in pixels.
     */
    iSmCaptionHeight : Int32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the small caption font.
     */
    lfSmCaptionFont : LOGFONTA

    /**
     * The width of menu-bar buttons, in pixels.
     */
    iMenuWidth : Int32

    /**
     * The height of a menu bar, in pixels.
     */
    iMenuHeight : Int32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the font used in menu bars.
     */
    lfMenuFont : LOGFONTA

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the font used in status bars and tooltips.
     */
    lfStatusFont : LOGFONTA

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the font used in message boxes.
     */
    lfMessageFont : LOGFONTA

    /**
     * The thickness of the padded border, in pixels. The default value is 4 pixels. The <b>iPaddedBorderWidth</b> and <b>iBorderWidth</b> members are combined for both resizable and nonresizable windows in  the Windows Aero desktop experience. To compile an application that uses this member, define <b>_WIN32_WINNT</b> as 0x0600 or later. For more information, see Remarks. 
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>This member is not supported.
     */
    iPaddedBorderWidth : Int32

}
