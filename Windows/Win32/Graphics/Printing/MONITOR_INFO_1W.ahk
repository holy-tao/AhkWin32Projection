#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The MONITOR\_INFO\_1 structure identifies an installed monitor.
 * @see https://learn.microsoft.com/windows/win32/printdocs/monitor-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct MONITOR_INFO_1W {
    #StructPack 8

    /**
     * A pointer to a null-terminated string that identifies an installed monitor.
     */
    pName : PWSTR

}
