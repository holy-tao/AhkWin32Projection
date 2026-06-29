#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TIME_OF_DAY_INFO structure contains information about the time of day from a remote server.
 * @see https://learn.microsoft.com/windows/win32/api/lmremutl/ns-lmremutl-time_of_day_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct TIME_OF_DAY_INFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of seconds since 00:00:00, January 1, 1970, GMT.
     */
    tod_elapsedt : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of milliseconds from an arbitrary starting point (system reset). 
     * 
     * 
     * 
     * 
     * Typically, this member is read twice, once when the process begins and again at the end. To determine the elapsed time between the process's start and finish, you can subtract the first value from the second.
     */
    tod_msecs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The current hour. Valid values are 0 through 23.
     */
    tod_hours : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The current minute. Valid values are 0 through 59.
     */
    tod_mins : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The current second. Valid values are 0 through 59.
     */
    tod_secs : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The current hundredth second (0.01 second). Valid values are 0 through 99.
     */
    tod_hunds : UInt32

    /**
     * Type: <b>LONG</b>
     * 
     * The time zone of the server. This value is calculated, in minutes, from Greenwich Mean Time (GMT). For time zones west of Greenwich, the value is positive; for time zones east of Greenwich, the value is negative. A value of –1 indicates that the time zone is undefined.
     */
    tod_timezone : Int32

    /**
     * Type: <b>DWORD</b>
     * 
     * The time interval for each tick of the clock. Each integral integer represents one ten-thousandth second (0.0001 second).
     */
    tod_tinterval : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The day of the month. Valid values are 1 through 31.
     */
    tod_day : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The month of the year. Valid values are 1 through 12.
     */
    tod_month : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The year.
     */
    tod_year : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The day of the week. Valid values are 0 through 6, where 0 is Sunday, 1 is Monday, and so on.
     */
    tod_weekday : UInt32

}
