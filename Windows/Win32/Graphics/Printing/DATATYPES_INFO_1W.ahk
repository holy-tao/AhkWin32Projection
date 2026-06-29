#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DATATYPES\_INFO\_1 structure contains information about the data type used to record a print job.
 * @see https://learn.microsoft.com/windows/win32/printdocs/datatypes-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct DATATYPES_INFO_1W {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that identifies the data type used to record a print job.
     */
    pName : PWSTR

}
