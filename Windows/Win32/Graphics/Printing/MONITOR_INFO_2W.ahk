#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The MONITOR\_INFO\_2 structure identifies a monitor.
 * @see https://learn.microsoft.com/windows/win32/printdocs/monitor-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct MONITOR_INFO_2W {
    #StructPack 8

    /**
     * A pointer to a null-terminated string that is the name of the monitor.
     */
    pName : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the environment for which the monitor was written (for example, Windows NT x86, Windows IA64, Windows x64).
     */
    pEnvironment : PWSTR

    /**
     * A pointer to a null-terminated string that is the name of the monitor DLL.
     */
    pDLLName : PWSTR

}
