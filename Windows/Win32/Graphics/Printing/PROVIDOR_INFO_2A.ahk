#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The PROVIDOR\_INFO\_2 structure appends a print provider to the print provider order list.
 * @remarks
 * This structure is used when calling [**AddPrintProvidor**](addprintprovidor.md), level 2, to add the specified print provider to the end of the print provider order list. The provider is immediately used for routing if the call succeeds.
 * @see https://learn.microsoft.com/windows/win32/printdocs/providor-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct PROVIDOR_INFO_2A {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the name of the print provider.
     */
    pOrder : PSTR

}
