#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents information about the Failover attempts for a group failure.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ns-msclus-group_failure_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class GROUP_FAILURE_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of remaining failover attempts that can be made on the group during the current <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups-failoverperiod">FailoverPeriod</a>  time interval.
     * @type {Integer}
     */
    dwFailoverAttemptsRemaining {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The amount of time remaining for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups-failoverperiod">FailoverPeriod</a>, in hours.
     * @type {Integer}
     */
    dwFailoverPeriodRemaining {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
