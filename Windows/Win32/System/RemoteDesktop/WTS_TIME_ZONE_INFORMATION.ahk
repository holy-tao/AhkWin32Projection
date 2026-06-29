#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_SYSTEMTIME.ahk" { WTS_SYSTEMTIME }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains client time zone information.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_time_zone_information
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_TIME_ZONE_INFORMATION {
    #StructPack 4

    /**
     * An integer that contains the bias for local time translation.  Bias is the difference, in minutes, between Coordinated Universal Time (Greenwich Mean Time) and local time.
     */
    Bias : Int32

    /**
     * A string that contains a descriptive name for standard time on the client. Examples include "Pacific Standard Time".
     */
    StandardName : WCHAR[32]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_systemtime">WTS_SYSTEMTIME</a> structure that contains the date and local time when the transition from daylight saving time to standard time occurs on the client. If this field is specified, the <b>DaylightDate</b> member should also be specified.
     */
    StandardDate : WTS_SYSTEMTIME

    /**
     * An integer that defines the bias, in minutes, to be used during local time translations that occur during standard time. This value is added to the value of the <b>Bias</b> member to form the bias used during standard time. In most time zones, the value of this field is zero.
     */
    StandardBias : Int32

    /**
     * A string that contains a descriptive name for daylight saving time on the client. Examples include "Pacific Daylight Time".
     */
    DaylightName : WCHAR[32]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_systemtime">WTS_SYSTEMTIME</a> structure that contains the date and local time when the transition from standard time to daylight saving time occurs on the client. If this field is specified, the <b>StandardDate</b> member should also be specified.
     */
    DaylightDate : WTS_SYSTEMTIME

    /**
     * An integer that defines the bias, in minutes, to be used during local time translations that occur during daylight saving time. This value is added to the value of the <b>Bias</b> member to form the bias used during daylight saving time. In most time zones, the value of this field is 60.
     */
    DaylightBias : Int32

}
