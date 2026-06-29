#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct DBGHELP_DATA_REPORT_STRUCT {
    #StructPack 8

    pBinPathNonExist : PWSTR

    pSymbolPathNonExist : PWSTR

}
