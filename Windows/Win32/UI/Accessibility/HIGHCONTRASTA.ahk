#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the high contrast accessibility feature. (ANSI)
 * @remarks
 * An application uses this structure when calling the[SystemParametersInfoA function](nf-winuser-systemparametersinfoa.md) with the <b>SPI_GETHIGHCONTRAST</b> or <b>SPI_SETHIGHCONTRAST</b> value. When using <b>SPI_GETHIGHCONTRAST</b>, an application must specify the <b>cbSize</b> member of the <b>HIGHCONTRAST</b> structure; the <b>SystemParametersInfo</b> function fills the remaining members. An application must specify all structure members when using the <b>SPI_SETHIGHCONTRAST</b> value.
 * 
 * 
 * > [!NOTE]
 * > The winuser.h header defines HIGHCONTRAST as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-highcontrasta
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 * @charset ANSI
 */
class HIGHCONTRASTA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the size, in bytes, of this structure.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Points to a string that contains the name of the color scheme that will be set to the default scheme.
     * @type {PSTR}
     */
    lpszDefaultScheme {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
