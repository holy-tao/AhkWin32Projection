#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information associated with audio descriptions. This structure is used with the SystemParametersInfo function when the SPI_GETAUDIODESCRIPTION or SPI_SETAUDIODESCRIPTION action value is specified.
 * @remarks
 * 
  * To compile an application that uses this structure, define _WIN32_WINNT as 0x0600 or later. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-audiodescription
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class AUDIODESCRIPTION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(AUDIODESCRIPTION)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If this member is <b>TRUE</b>, audio descriptions are enabled; Otherwise, this member is <b>FALSE</b>.
     * @type {Integer}
     */
    Enabled {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The locale identifier (LCID) of the language for the audio description. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Intl/locales-and-languages">Locales and Languages</a>.
     * @type {Integer}
     */
    Locale {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 12
    }
}
