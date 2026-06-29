#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DRIVER\_INFO\_1 structure identifies a printer driver.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct DRIVER_INFO_1W {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the name of a printer driver.
     */
    pName : PWSTR

}
