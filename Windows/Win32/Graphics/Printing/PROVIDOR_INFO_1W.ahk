#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The PROVIDOR\_INFO\_1 structure identifies a print provider.
 * @see https://learn.microsoft.com/windows/win32/printdocs/providor-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct PROVIDOR_INFO_1W {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that is the name of the print provider.
     */
    pName : PWSTR

    /**
     * Pointer to a null-terminated environment string specifying the environment the provider dynamic-link library (DLL) is designed to run in.
     */
    pEnvironment : PWSTR

    /**
     * Pointer to a null-terminated string that is the name of the provider .dll.
     */
    pDLLName : PWSTR

}
