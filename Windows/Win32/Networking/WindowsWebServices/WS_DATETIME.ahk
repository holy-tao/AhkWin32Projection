#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is used to represent dates and times.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_datetime
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DATETIME extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The time in 100 nanosecond units, with 0 representing 12:00:00 midnight January 1, Anno Domini (Common Era).  The
     *           largest representable value is 3155378975999999999, which corresponds to 100 nanoseconds prior to 12:00:00 midnight
     *           January 1, 10000.
     * @type {Integer}
     */
    ticks {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The format that is used when representing this time as text.
     * @type {Integer}
     */
    format {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
