#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the SerialKeys accessibility feature, which interprets data from a communication aid attached to a serial port as commands causing the system to simulate keyboard and mouse input. (Unicode)
 * @remarks
 * An application uses this structure when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-systemparametersinfoa">SystemParametersInfo</a> function with the <b>SPI_GETSERIALKEYS</b> or <b>SPI_SETSERIALKEYS</b> value. When using <b>SPI_GETSERIALKEYS</b>, an application must specify the <b>cbSize</b>, <b>lpszActivePort</b>, and <b>lpszPort</b> members of the <b>SERIALKEYS</b> structure; the <b>SystemParametersInfo</b> function fills the remaining members. An application must specify all structure members when using the <b>SPI_SETSERIALKEYS</b> value.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winuser.h header defines SERIALKEYS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-serialkeysw
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 * @charset Unicode
 */
class SERIALKEYSW extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the structure size, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * Points to a string that contains the name of the serial port that receives input from the communication aid when the SerialKeys feature is on. If no port is being used, this member is <b>NULL</b>. If this member is "Auto", the system watches all unused serial ports for input from communication aids.
     * @type {Pointer<Char>}
     */
    lpszActivePort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPSTR</a></b>
     * 
     * Reserved; must be <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    lpszPort {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the baud rate setting for the serial port specified by the <b>lpszActivePort</b> member. This member should be set to one of the CBR_ values defined in the winbase.h header file. If <b>lpszActivePort</b> is <b>NULL</b>, this member is zero.
     * @type {Integer}
     */
    iBaudRate {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    iPortState {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the active port.
     * @type {Integer}
     */
    iActive {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
