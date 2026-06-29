#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a xsd:duration data type.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_duration
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DURATION {
    #StructPack 4

    /**
     * If <b>TRUE</b>, this represents a negative duration.
     */
    negative : BOOL

    /**
     * The number of years.
     */
    years : UInt32

    /**
     * The number of months.
     */
    months : UInt32

    /**
     * The number of days.
     */
    days : UInt32

    /**
     * The number of hours.
     */
    hours : UInt32

    /**
     * The number of minutes.
     */
    minutes : UInt32

    /**
     * The number of seconds.
     */
    seconds : UInt32

    /**
     * The number of milliseconds.  This value must be less than 1000.
     */
    milliseconds : UInt32

    /**
     * Indicates the number of ticks.  This value must be less than 10000.
     */
    ticks : UInt32

}
