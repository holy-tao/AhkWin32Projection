#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TIME_OF_DAY_INFO structure contains information about the time of day from a remote server.
 * @see https://docs.microsoft.com/windows/win32/api//lmremutl/ns-lmremutl-time_of_day_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class TIME_OF_DAY_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds since 00:00:00, January 1, 1970, GMT.
     * @type {Integer}
     */
    tod_elapsedt {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of milliseconds from an arbitrary starting point (system reset). 
     * 
     * 
     * 
     * 
     * Typically, this member is read twice, once when the process begins and again at the end. To determine the elapsed time between the process's start and finish, you can subtract the first value from the second.
     * @type {Integer}
     */
    tod_msecs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The current hour. Valid values are 0 through 23.
     * @type {Integer}
     */
    tod_hours {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The current minute. Valid values are 0 through 59.
     * @type {Integer}
     */
    tod_mins {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The current second. Valid values are 0 through 59.
     * @type {Integer}
     */
    tod_secs {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The current hundredth second (0.01 second). Valid values are 0 through 99.
     * @type {Integer}
     */
    tod_hunds {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * The time zone of the server. This value is calculated, in minutes, from Greenwich Mean Time (GMT). For time zones west of Greenwich, the value is positive; for time zones east of Greenwich, the value is negative. A value of –1 indicates that the time zone is undefined.
     * @type {Integer}
     */
    tod_timezone {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The time interval for each tick of the clock. Each integral integer represents one ten-thousandth second (0.0001 second).
     * @type {Integer}
     */
    tod_tinterval {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The day of the month. Valid values are 1 through 31.
     * @type {Integer}
     */
    tod_day {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The month of the year. Valid values are 1 through 12.
     * @type {Integer}
     */
    tod_month {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The year.
     * @type {Integer}
     */
    tod_year {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The day of the week. Valid values are 0 through 6, where 0 is Sunday, 1 is Monday, and so on.
     * @type {Integer}
     */
    tod_weekday {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
