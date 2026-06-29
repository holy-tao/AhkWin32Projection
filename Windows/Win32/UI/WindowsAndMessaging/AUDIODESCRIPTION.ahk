#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information associated with audio descriptions. This structure is used with the SystemParametersInfo function when the SPI_GETAUDIODESCRIPTION or SPI_SETAUDIODESCRIPTION action value is specified.
 * @remarks
 * To compile an application that uses this structure, define _WIN32_WINNT as 0x0600 or later. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-audiodescription
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct AUDIODESCRIPTION {
    #StructPack 4

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(AUDIODESCRIPTION)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * If this member is <b>TRUE</b>, audio descriptions are enabled; Otherwise, this member is <b>FALSE</b>.
     */
    Enabled : BOOL

    /**
     * The locale identifier (LCID) of the language for the audio description. For more information, see 
     *        <a href="https://docs.microsoft.com/windows/desktop/Intl/locales-and-languages">Locales and Languages</a>.
     */
    Locale : UInt32

}
