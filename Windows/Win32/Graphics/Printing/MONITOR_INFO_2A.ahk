#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The MONITOR\_INFO\_2 structure identifies a monitor.
 * @see https://learn.microsoft.com/windows/win32/printdocs/monitor-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct MONITOR_INFO_2A {
    #StructPack 8

    /**
     * A pointer to a null-terminated string that is the name of the monitor.
     */
    pName : PSTR

    /**
     * A pointer to a null-terminated string that specifies the environment for which the monitor was written (for example, Windows NT x86, Windows IA64, Windows x64).
     */
    pEnvironment : PSTR

    /**
     * A pointer to a null-terminated string that is the name of the monitor DLL.
     */
    pDLLName : PSTR

}
