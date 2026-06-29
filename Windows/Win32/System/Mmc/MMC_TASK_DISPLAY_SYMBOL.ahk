#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The MMC_TASK_DISPLAY_SYMBOL structure is introduced in MMC 1.1.
 * @remarks
 * Allocate the <i>szFontFamilyName</i>, <i>szURLtoEOT</i>, and <i>szSymbolString</i> strings used in the structure with the COM API function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> (or the equivalent) and MMC will release them.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmc_task_display_symbol
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMC_TASK_DISPLAY_SYMBOL {
    #StructPack 8

    /**
     * A pointer to a null-terminated string that contains the font family name of the symbol to display. 
     * 
     * 
     * 
     * 
     * For example, the following string specifies that the font is Webdings: "Webdings".
     * 
     * This should never be set to a <b>NULL</b> string or an empty string.
     */
    szFontFamilyName : PWSTR

    /**
     * A pointer to a null-terminated string that contains the resource path to the EOT (embedded OpenType) file that contains the font for the symbol to display. 
     * 
     * 
     * 
     * 
     * The string should have the following form: "res://<i>filepath</i>/imgpath".
     * 
     * where <i>filepath</i> is the full path to the snap-in's DLL that stores the image file as a resource, and <i>imgpath</i> is the resource path of the image file with the snap-in DLL.
     * 
     * For example, the following string specifies that the snap-in DLL (snapin.dll) has a path of "c:\windows\system32\snapin.dll" and that the resource path is img/myfont.eot: "res://c:\\windows\\system32\\snapin.dll/img/myfont.eot".
     */
    szURLtoEOT : PWSTR

    /**
     * A pointer to a null-terminated string that contains the character or characters to display in the symbol.
     */
    szSymbolString : PWSTR

}
