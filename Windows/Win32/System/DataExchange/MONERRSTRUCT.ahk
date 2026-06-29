#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Contains information about the current Dynamic Data Exchange (DDE) error. A DDE monitoring application can use this structure to monitor errors returned by DDE Management Library functions.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-monerrstruct
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct MONERRSTRUCT {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure's size, in bytes.
     */
    cb : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The current error.
     */
    wLastError : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The Windows time at which the error occurred. Windows time is the number of milliseconds that have elapsed since the system was booted.
     */
    dwTime : UInt32

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the task (application instance) that called the DDE function that caused the error.
     */
    hTask : HANDLE

}
