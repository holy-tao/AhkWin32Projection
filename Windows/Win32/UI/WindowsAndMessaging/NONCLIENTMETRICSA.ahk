#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\LOGFONTA.ahk

/**
 * Contains the scalable metrics associated with the nonclient area of a nonminimized window.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-nonclientmetricsa
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 * @charset ANSI
 */
class NONCLIENTMETRICSA extends Win32Struct
{
    static sizeof => 360

    static packingSize => 8

    /**
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(NONCLIENTMETRICS)</c>. For   information about application compatibility, see Remarks.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The thickness of the sizing border, in pixels. The default is 1 pixel.
     * @type {Integer}
     */
    iBorderWidth {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The width of a standard vertical scroll bar, in pixels.
     * @type {Integer}
     */
    iScrollWidth {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The height of a standard horizontal scroll bar, in pixels.
     * @type {Integer}
     */
    iScrollHeight {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The width of caption buttons, in pixels.
     * @type {Integer}
     */
    iCaptionWidth {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The height of caption buttons, in pixels.
     * @type {Integer}
     */
    iCaptionHeight {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the caption font.
     * @type {LOGFONTA}
     */
    lfCaptionFont{
        get {
            if(!this.HasProp("__lfCaptionFont"))
                this.__lfCaptionFont := LOGFONTA(this.ptr + 24)
            return this.__lfCaptionFont
        }
    }

    /**
     * The width of small caption buttons, in pixels.
     * @type {Integer}
     */
    iSmCaptionWidth {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * The height of small captions, in pixels.
     * @type {Integer}
     */
    iSmCaptionHeight {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the small caption font.
     * @type {LOGFONTA}
     */
    lfSmCaptionFont{
        get {
            if(!this.HasProp("__lfSmCaptionFont"))
                this.__lfSmCaptionFont := LOGFONTA(this.ptr + 96)
            return this.__lfSmCaptionFont
        }
    }

    /**
     * The width of menu-bar buttons, in pixels.
     * @type {Integer}
     */
    iMenuWidth {
        get => NumGet(this, 156, "int")
        set => NumPut("int", value, this, 156)
    }

    /**
     * The height of a menu bar, in pixels.
     * @type {Integer}
     */
    iMenuHeight {
        get => NumGet(this, 160, "int")
        set => NumPut("int", value, this, 160)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the font used in menu bars.
     * @type {LOGFONTA}
     */
    lfMenuFont{
        get {
            if(!this.HasProp("__lfMenuFont"))
                this.__lfMenuFont := LOGFONTA(this.ptr + 168)
            return this.__lfMenuFont
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the font used in status bars and tooltips.
     * @type {LOGFONTA}
     */
    lfStatusFont{
        get {
            if(!this.HasProp("__lfStatusFont"))
                this.__lfStatusFont := LOGFONTA(this.ptr + 232)
            return this.__lfStatusFont
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains information about the font used in message boxes.
     * @type {LOGFONTA}
     */
    lfMessageFont{
        get {
            if(!this.HasProp("__lfMessageFont"))
                this.__lfMessageFont := LOGFONTA(this.ptr + 296)
            return this.__lfMessageFont
        }
    }

    /**
     * The thickness of the padded border, in pixels. The default value is 4 pixels. The <b>iPaddedBorderWidth</b> and <b>iBorderWidth</b> members are combined for both resizable and nonresizable windows in  the Windows Aero desktop experience. To compile an application that uses this member, define <b>_WIN32_WINNT</b> as 0x0600 or later. For more information, see Remarks. 
     * 
     * <b>Windows Server 2003 and Windows XP/2000:  </b>This member is not supported.
     * @type {Integer}
     */
    iPaddedBorderWidth {
        get => NumGet(this, 356, "int")
        set => NumPut("int", value, this, 356)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 360
    }
}
