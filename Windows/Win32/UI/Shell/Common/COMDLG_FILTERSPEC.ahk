#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used generically to filter elements.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-comdlg_filterspec
 * @namespace Windows.Win32.UI.Shell.Common
 */
export default struct COMDLG_FILTERSPEC {
    #StructPack 8

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the friendly name of the filter.
     */
    pszName : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * A pointer to a buffer that contains the filter pattern.
     */
    pszSpec : PWSTR

}
