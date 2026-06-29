#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a signed 64-bit time interval in 100 nanosecond units.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_timespan
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_TIMESPAN {
    #StructPack 8

    /**
     * The interval.
     */
    ticks : Int64

}
