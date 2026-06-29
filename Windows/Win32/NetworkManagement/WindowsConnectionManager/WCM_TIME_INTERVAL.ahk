#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a time interval.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ns-wcmapi-wcm_time_interval
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_TIME_INTERVAL {
    #StructPack 2

    /**
     * Type: <b>WORD</b>
     * 
     * Years.
     */
    wYear : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * Months.
     */
    wMonth : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * Days.
     */
    wDay : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * Hours.
     */
    wHour : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * Minutes.
     */
    wMinute : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * Seconds.
     */
    wSecond : UInt16

    /**
     * Type: <b>WORD</b>
     * 
     * Milliseconds.
     */
    wMilliseconds : UInt16

}
