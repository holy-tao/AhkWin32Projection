#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The PRINTPROCESSOR\_INFO\_1 structure specifies the name of an installed print processor.
 * @see https://learn.microsoft.com/windows/win32/printdocs/printprocessor-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct PRINTPROCESSOR_INFO_1W {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the name of an installed print processor.
     */
    pName : PWSTR

}
