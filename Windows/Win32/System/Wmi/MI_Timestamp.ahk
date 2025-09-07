#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * MI_Timestamp specifies a timestamp or a specific point in time.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_timestamp
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Timestamp extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * A four digit number representing the year in the form yyyy.
     * @type {Integer}
     */
    year {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A two digit number representing the month in the form mm. (01-12)
     * @type {Integer}
     */
    month {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A two digit number representing the day of the month in the form dd. (01-31)
     * @type {Integer}
     */
    day {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A two digit number representing the hour on a 24-hour clock in the form hh. (00-23)
     * @type {Integer}
     */
    hour {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A two digit number representing minutes in the form mm. (00-59)
     * @type {Integer}
     */
    minute {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A two digit number representing seconds in the form ss. (00-59)
     * @type {Integer}
     */
    second {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A six digit number in the form mmmmmm representing the microseconds. (000000-999999)
     * @type {Integer}
     */
    microseconds {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The offset from Coordinated Universal Time in minutes. Timezones west of Greenwich use negative numbers while timezones east of Greenwich use positive numbers.
     * @type {Integer}
     */
    utc {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
