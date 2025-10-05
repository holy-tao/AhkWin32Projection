#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a signed 64-bit time interval in 100 nanosecond units.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_timespan
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_TIMESPAN extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The interval.
     * @type {Integer}
     */
    ticks {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
