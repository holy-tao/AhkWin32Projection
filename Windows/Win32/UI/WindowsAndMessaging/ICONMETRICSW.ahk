#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\LOGFONTW.ahk

/**
 * Contains the scalable metrics associated with icons. This structure is used with the SystemParametersInfo function when the SPI_GETICONMETRICS or SPI_SETICONMETRICS action is specified. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winuser.h header defines ICONMETRICS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-iconmetricsw
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset Unicode
 */
class ICONMETRICSW extends Win32Struct
{
    static sizeof => 108

    static packingSize => 4

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The horizontal space, in pixels, for each arranged icon.
     * @type {Integer}
     */
    iHorzSpacing {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * The vertical space, in pixels, for each arranged icon.
     * @type {Integer}
     */
    iVertSpacing {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * If this member is nonzero, icon titles wrap to a new line. If this member is zero, titles do not wrap.
     * @type {Integer}
     */
    iTitleWrap {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a></b>
     * 
     * The font to use for icon titles.
     * @type {LOGFONTW}
     */
    lfFont{
        get {
            if(!this.HasProp("__lfFont"))
                this.__lfFont := LOGFONTW(16, this)
            return this.__lfFont
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 108
    }
}
