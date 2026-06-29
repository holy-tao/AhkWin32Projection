#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The PROVIDOR\_INFO\_1 structure identifies a print provider.
 * @see https://learn.microsoft.com/windows/win32/printdocs/providor-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct PROVIDOR_INFO_1A {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that is the name of the print provider.
     */
    pName : PSTR

    /**
     * Pointer to a null-terminated environment string specifying the environment the provider dynamic-link library (DLL) is designed to run in.
     */
    pEnvironment : PSTR

    /**
     * Pointer to a null-terminated string that is the name of the provider .dll.
     */
    pDLLName : PSTR

}
