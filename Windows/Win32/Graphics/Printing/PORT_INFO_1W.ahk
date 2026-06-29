#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The PORT\_INFO\_1 structure identifies a supported printer port.
 * @see https://learn.microsoft.com/windows/win32/printdocs/port-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct PORT_INFO_1W {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that identifies a supported printer port (for example, "LPT1:").
     */
    pName : PWSTR

}
