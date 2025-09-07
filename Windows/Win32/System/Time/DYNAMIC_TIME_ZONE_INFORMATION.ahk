#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * Specifies settings for a time zone and dynamic daylight saving time.
 * @remarks
 * Dynamic daylight saving time provides support for time zones whose boundaries for daylight saving time change 
  *     from year to year. This feature enables easier updating of systems, especially for locales where the yearly DST 
  *     boundaries are known in advance. After the time zone has been updated, the current time zone setting is applied to 
  *     all time operations, even when the time in question occurred before the time zone changed. Therefore, it is best 
  *     to store UTC times and convert them to the current local time zone.
  * 
  * You can set the transition dates for the current year using the 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-setdynamictimezoneinformation">SetDynamicTimeZoneInformation</a> function. 
  *      To set future transition dates, you must add entries to the registry data. The settings for dynamic daylight time 
  *      are stored in the following registry key:
  * 
  * 
  * <pre><b>HKEY_LOCAL_MACHINE</b>
  *    <b>SOFTWARE</b>
  *       <b>Microsoft</b>
  *          <b>Windows NT</b>
  *             <b>CurrentVersion</b>
  *                <b>Time Zones</b>
  *                   <i>time_zone_name</i>
  *                      <b>Dynamic DST</b></pre>
  * 
  * 
  * Each <b>Dynamic DST</b> key includes the following registry values.
  * 
  * <table>
  * <tr>
  * <th>Registry value</th>
  * <th>Type</th>
  * <th>Description</th>
  * </tr>
  * <tr>
  * <td><b>FirstEntry</b></td>
  * <td><b>REG_DWORD</b></td>
  * <td>The first year in the table.</td>
  * </tr>
  * <tr>
  * <td><b>LastEntry</b></td>
  * <td><b>REG_DWORD</b></td>
  * <td>The last year in the table.</td>
  * </tr>
  * <tr>
  * <td><i>year1</i></td>
  * <td><b>REG_BINARY</b></td>
  * <td>
  * The following time zone information.
  * 
  * 
  * ``` syntax
  * typedef struct _REG_TZI_FORMAT
  * {
  *     LONG Bias;
  *     LONG StandardBias;
  *     LONG DaylightBias;
  *     SYSTEMTIME StandardDate;
  *     SYSTEMTIME DaylightDate;
  * } REG_TZI_FORMAT;
  * ```
  * 
  * </td>
  * </tr>
  * <tr>
  * <td><i>year2</i></td>
  * <td><b>REG_BINARY</b></td>
  * <td>A <b>REG_TZI_FORMAT</b> structure.</td>
  * </tr>
  * <tr>
  * <td><i>yearN</i></td>
  * <td><b>REG_BINARY</b></td>
  * <td>A <b>REG_TZI_FORMAT</b> structure.</td>
  * </tr>
  * </table>
  *  
  * 
  * For more information on other values in the <b>Time Zones</b> key, see 
  *      <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/ns-timezoneapi-time_zone_information">TIME_ZONE_INFORMATION</a>.
  * 
  *  Both <b>StandardName</b> and <b>DaylightName</b> are localized according to the current user default UI language.
 * @see https://learn.microsoft.com/windows/win32/api/timezoneapi/ns-timezoneapi-dynamic_time_zone_information
 * @namespace Windows.Win32.System.Time
 * @version v4.0.30319
 */
class DYNAMIC_TIME_ZONE_INFORMATION extends Win32Struct
{
    static sizeof => 440

    static packingSize => 8

    /**
     * The current bias for local time translation on this computer, in minutes. The bias is the difference, in 
     *        minutes, between Coordinated Universal Time (UTC) and local time. All translations between UTC and local time 
     *        are based on the following formula:
     * 
     * UTC = local time + bias
     * 
     * This member is required.
     * @type {Integer}
     */
    Bias {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A description for standard time. For example, "EST" could indicate Eastern Standard Time. The string will 
     *       be returned unchanged by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-getdynamictimezoneinformation">GetDynamicTimeZoneInformation</a> 
     *       function. This string can be empty.
     * @type {String}
     */
    StandardName {
        get => StrGet(this.ptr + 4, 31, "UTF-16")
        set => StrPut(value, this.ptr + 4, 31, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains a date and 
     *        local time when the transition from daylight saving time to standard time occurs on this operating system. If 
     *        the time zone does not support daylight saving time or if the caller needs to disable daylight saving time, the 
     *        <b>wMonth</b> member in the 
     *        <b>SYSTEMTIME</b> structure must be zero. If this date is 
     *        specified, the <b>DaylightDate</b> member of this structure must also be specified. 
     *        Otherwise, the system assumes the time zone data is invalid and no changes will be applied.
     * 
     * To select the correct day in the month, set the <b>wYear</b> member to zero, the 
     *        <b>wHour</b> and <b>wMinute</b> members to the transition time, the 
     *        <b>wDayOfWeek</b> member to the appropriate weekday, and the 
     *        <b>wDay</b> member to indicate the occurrence of the day of the week within the month (1 to 
     *        5, where 5 indicates the final occurrence during the month if that day of the week does not occur 5 times).
     * 
     * Using this notation, specify 02:00 on the first Sunday in April as follows: 
     *        <b>wHour</b> = 2, <b>wMonth</b> = 4, 
     *        <b>wDayOfWeek</b> = 0, <b>wDay</b> = 1. Specify 02:00 on the last 
     *        Thursday in October as follows: <b>wHour</b> = 2, <b>wMonth</b> = 10, 
     *        <b>wDayOfWeek</b> = 4, <b>wDay</b> = 5.
     * 
     * If the 
     *        <b>wYear</b> member is not zero, the transition date is absolute; it will only occur one 
     *        time. Otherwise, it is a relative date that occurs yearly.
     * @type {SYSTEMTIME}
     */
    StandardDate{
        get {
            if(!this.HasProp("__StandardDate"))
                this.__StandardDate := SYSTEMTIME(this.ptr + 72)
            return this.__StandardDate
        }
    }

    /**
     * The bias value to be used during local time translations that occur during standard time. This member is 
     *        ignored if a value for the <b>StandardDate</b> member is not supplied.
     * 
     * This value is added to the value of the <b>Bias</b> member to form the bias used during 
     *        standard time. In most time zones, the value of this member is zero.
     * @type {Integer}
     */
    StandardBias {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * A description for daylight saving time (DST). For example, "PDT" could indicate Pacific Daylight Time. The 
     *       string will be  returned unchanged by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-getdynamictimezoneinformation">GetDynamicTimeZoneInformation</a> 
     *       function. This string can be empty.
     * @type {String}
     */
    DaylightName {
        get => StrGet(this.ptr + 92, 31, "UTF-16")
        set => StrPut(value, this.ptr + 92, 31, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains a 
     *        date and local time when the transition from standard time to daylight saving time occurs on this operating 
     *        system. If the time zone does not support daylight saving time or if the caller needs to disable daylight 
     *        saving time, the <b>wMonth</b> member in the 
     *        <b>SYSTEMTIME</b> structure must be zero. If this date is 
     *        specified, the <b>StandardDate</b> member in this structure must also be specified. 
     *        Otherwise, the system assumes the time zone data is invalid and no changes will be applied.
     * 
     * To select the correct day in the month, set the <b>wYear</b> member to zero, the 
     *        <b>wHour</b> and <b>wMinute</b> members to the transition time, the 
     *        <b>wDayOfWeek</b> member to the appropriate weekday, and the 
     *        <b>wDay</b> member to indicate the occurrence of the day of the week within the month (1 to 
     *        5, where 5 indicates the final occurrence during the month if that day of the week does not occur 5 times).
     * 
     * If the <b>wYear</b> member is not zero, the transition date is absolute; it will only 
     *        occur one time. Otherwise, it is a relative date that occurs yearly.
     * @type {SYSTEMTIME}
     */
    DaylightDate{
        get {
            if(!this.HasProp("__DaylightDate"))
                this.__DaylightDate := SYSTEMTIME(this.ptr + 160)
            return this.__DaylightDate
        }
    }

    /**
     * The bias value to be used during local time translations that occur during daylight saving time. This member 
     *        is ignored if a value for the <b>DaylightDate</b> member is not supplied.
     * 
     * This value is added to the value of the <b>Bias</b> member to form the bias used during 
     *        daylight saving time. In most time zones, the value of this member is –60.
     * @type {Integer}
     */
    DaylightBias {
        get => NumGet(this, 176, "int")
        set => NumPut("int", value, this, 176)
    }

    /**
     * The name of the time zone registry key on the local computer. For more information, see Remarks.
     * @type {String}
     */
    TimeZoneKeyName {
        get => StrGet(this.ptr + 180, 127, "UTF-16")
        set => StrPut(value, this.ptr + 180, 127, "UTF-16")
    }

    /**
     * Indicates whether dynamic daylight saving time is disabled. Setting this member to <b>TRUE</b> disables dynamic 
     *        daylight saving time, causing the system to use a fixed set of transition dates.
     * 
     * To restore dynamic daylight saving time, call the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-setdynamictimezoneinformation">SetDynamicTimeZoneInformation</a> 
     *        function with <b>DynamicDaylightTimeDisabled</b> set to <b>FALSE</b>. 
     *        The system will read the transition dates for the current year at the next time update, the next system reboot, 
     *        or the end of the calendar year (whichever comes first.)
     * 
     * When calling the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-getdynamictimezoneinformation">GetDynamicTimeZoneInformation</a> 
     *        function, this member is <b>TRUE</b> if the time zone was set using the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-settimezoneinformation">SetTimeZoneInformation</a> function instead of 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-setdynamictimezoneinformation">SetDynamicTimeZoneInformation</a> or if 
     *        the user has disabled this feature using the Date and Time application in Control 
     *        Panel.
     * 
     * To disable daylight saving time, set this member to <b>TRUE</b>, clear the 
     *        <b>StandardDate</b> and <b>DaylightDate</b> members, and call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-setdynamictimezoneinformation">SetDynamicTimeZoneInformation</a>. To 
     *        restore daylight saving time, call 
     *        <b>SetDynamicTimeZoneInformation</b> with 
     *        <b>DynamicDaylightTimeDisabled</b> set to <b>FALSE</b>.
     * @type {Integer}
     */
    DynamicDaylightTimeDisabled {
        get => NumGet(this, 436, "char")
        set => NumPut("char", value, this, 436)
    }
}
