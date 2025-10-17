#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a xsd:duration data type.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_duration
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DURATION extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * If <b>TRUE</b>, this represents a negative duration.
     * @type {BOOL}
     */
    negative {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of years.
     * @type {Integer}
     */
    years {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of months.
     * @type {Integer}
     */
    months {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of days.
     * @type {Integer}
     */
    days {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of hours.
     * @type {Integer}
     */
    hours {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of minutes.
     * @type {Integer}
     */
    minutes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of seconds.
     * @type {Integer}
     */
    seconds {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of milliseconds.  This value must be less than 1000.
     * @type {Integer}
     */
    milliseconds {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Indicates the number of ticks.  This value must be less than 10000.
     * @type {Integer}
     */
    ticks {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
