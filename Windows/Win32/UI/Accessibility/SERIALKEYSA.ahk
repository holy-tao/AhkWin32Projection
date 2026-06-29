#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SERIALKEYS_FLAGS.ahk" { SERIALKEYS_FLAGS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about the SerialKeys accessibility feature, which interprets data from a communication aid attached to a serial port as commands causing the system to simulate keyboard and mouse input. (ANSI)
 * @remarks
 * An application uses this structure when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function with the <b>SPI_GETSERIALKEYS</b> or <b>SPI_SETSERIALKEYS</b> value. When using <b>SPI_GETSERIALKEYS</b>, an application must specify the <b>cbSize</b>, <b>lpszActivePort</b>, and <b>lpszPort</b> members of the <b>SERIALKEYS</b> structure; the <b>SystemParametersInfo</b> function fills the remaining members. An application must specify all structure members when using the <b>SPI_SETSERIALKEYS</b> value.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines SERIALKEYS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-serialkeysa
 * @namespace Windows.Win32.UI.Accessibility
 * @charset ANSI
 */
export default struct SERIALKEYSA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the structure size, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwFlags : SERIALKEYS_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * Points to a string that contains the name of the serial port that receives input from the communication aid when the SerialKeys feature is on. If no port is being used, this member is <b>NULL</b>. If this member is "Auto", the system watches all unused serial ports for input from communication aids.
     */
    lpszActivePort : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * Reserved; must be <b>NULL</b>.
     */
    lpszPort : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the baud rate setting for the serial port specified by the <b>lpszActivePort</b> member. This member should be set to one of the CBR_ values defined in the winbase.h header file. If <b>lpszActivePort</b> is <b>NULL</b>, this member is zero.
     */
    iBaudRate : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     */
    iPortState : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the active port.
     */
    iActive : UInt32

}
