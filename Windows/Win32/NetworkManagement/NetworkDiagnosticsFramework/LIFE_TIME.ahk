#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * The LIFE_TIME structure contains a start time and an end time.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-life_time
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct LIFE_TIME {
    #StructPack 4

    /**
     * Type: <b>FILETIME</b>
     * 
     * The time the problem instance began.
     */
    startTime : FILETIME

    /**
     * Type: <b>FILETIME</b>
     * 
     * The time the problem instance ended.
     */
    endTime : FILETIME

}
