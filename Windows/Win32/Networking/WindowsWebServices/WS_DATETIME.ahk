#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_DATETIME_FORMAT.ahk" { WS_DATETIME_FORMAT }

/**
 * This structure is used to represent dates and times.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_datetime
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DATETIME {
    #StructPack 8

    /**
     * The time in 100 nanosecond units, with 0 representing 12:00:00 midnight January 1, Anno Domini (Common Era).  The
     *           largest representable value is 3155378975999999999, which corresponds to 100 nanoseconds prior to 12:00:00 midnight
     *           January 1, 10000.
     */
    ticks : Int64

    /**
     * The format that is used when representing this time as text.
     */
    format : WS_DATETIME_FORMAT

}
