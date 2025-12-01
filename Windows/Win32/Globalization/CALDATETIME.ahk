#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Deprecated. Represents an instant in time, typically expressed as a date and time of day and a corresponding calendar.
 * @see https://learn.microsoft.com/windows/win32/Intl/caldatetime
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class CALDATETIME extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * The [calendar identifier](calendar-identifiers.md) for the instant in time.
     * @type {Integer}
     */
    CalId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The era information for the instant in time.
     * @type {Integer}
     */
    Era {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The year for the instant in time.
     * @type {Integer}
     */
    Year {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The month for the instant in time.
     * @type {Integer}
     */
    Month {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The day for the instant in time.
     * @type {Integer}
     */
    Day {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The day of the week for the instant in time.
     * @type {Integer}
     */
    DayOfWeek {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The hour for the instant in time.
     * @type {Integer}
     */
    Hour {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The minute for the instant in time.
     * @type {Integer}
     */
    Minute {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The second for the instant in time.
     * @type {Integer}
     */
    Second {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The tick for the instant in time.
     * @type {Integer}
     */
    Tick {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
