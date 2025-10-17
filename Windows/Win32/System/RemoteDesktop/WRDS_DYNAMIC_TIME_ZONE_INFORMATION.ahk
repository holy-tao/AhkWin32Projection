#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTS_SYSTEMTIME.ahk

/**
 * Contains dynamic time zone information.
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wrds_dynamic_time_zone_information
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_DYNAMIC_TIME_ZONE_INFORMATION extends Win32Struct
{
    static sizeof => 440

    static packingSize => 8

    /**
     * An integer that contains the bias for local time translation.  Bias is the difference, in minutes, between Coordinated Universal Time (Greenwich Mean Time) and local time.
     * @type {Integer}
     */
    Bias {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A string that contains a descriptive name for standard time on the client. Examples include "Pacific Standard Time".
     * @type {String}
     */
    StandardName {
        get => StrGet(this.ptr + 4, 31, "UTF-16")
        set => StrPut(value, this.ptr + 4, 31, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_systemtime">WTS_SYSTEMTIME</a> structure that contains the date and local time when the transition from daylight saving time to standard time occurs on the client. If this field is specified, the <b>DaylightDate</b> member should also be specified.
     * @type {WTS_SYSTEMTIME}
     */
    StandardDate{
        get {
            if(!this.HasProp("__StandardDate"))
                this.__StandardDate := WTS_SYSTEMTIME(72, this)
            return this.__StandardDate
        }
    }

    /**
     * An integer that defines the bias, in minutes, to be used during local time translations that occur during standard time. This value is added to the value of the <b>Bias</b> member to form the bias used during standard time. In most time zones, the value of this field is zero.
     * @type {Integer}
     */
    StandardBias {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * A string that contains a descriptive name for daylight saving time on the client. Examples include "Pacific Daylight Time".
     * @type {String}
     */
    DaylightName {
        get => StrGet(this.ptr + 92, 31, "UTF-16")
        set => StrPut(value, this.ptr + 92, 31, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_systemtime">WTS_SYSTEMTIME</a> structure that contains the date and local time when the transition from standard time to daylight saving time occurs on the client. If this field is specified, the <b>StandardDate</b> member should also be specified.
     * @type {WTS_SYSTEMTIME}
     */
    DaylightDate{
        get {
            if(!this.HasProp("__DaylightDate"))
                this.__DaylightDate := WTS_SYSTEMTIME(160, this)
            return this.__DaylightDate
        }
    }

    /**
     * An integer that defines the bias, in minutes, to be used during local time translations that occur during daylight saving time. This value is added to the value of the <b>Bias</b> member to form the bias used during daylight saving time. In most time zones, the value of this field is 60.
     * @type {Integer}
     */
    DaylightBias {
        get => NumGet(this, 176, "int")
        set => NumPut("int", value, this, 176)
    }

    /**
     * Key name for the TimeZone information.
     * @type {String}
     */
    TimeZoneKeyName {
        get => StrGet(this.ptr + 180, 127, "UTF-16")
        set => StrPut(value, this.ptr + 180, 127, "UTF-16")
    }

    /**
     * Whether DynamicDaylightTime is disabled.
     * @type {Integer}
     */
    DynamicDaylightTimeDisabled {
        get => NumGet(this, 436, "ushort")
        set => NumPut("ushort", value, this, 436)
    }
}
