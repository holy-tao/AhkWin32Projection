#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HIGHCONTRASTW_FLAGS.ahk" { HIGHCONTRASTW_FLAGS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

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
 * @charset ANSI
 */
export default struct HIGHCONTRASTA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwFlags : HIGHCONTRASTW_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Points to a string that contains the name of the color scheme that will be set to the default scheme.
     */
    lpszDefaultScheme : PSTR

}
