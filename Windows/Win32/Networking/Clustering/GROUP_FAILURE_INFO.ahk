#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The GROUP_FAILURE_INFO structure represents information about the Failover attempts for a group failure. (GROUP_FAILURE_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-group_failure_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct GROUP_FAILURE_INFO {
    #StructPack 4

    /**
     * The number of remaining failover attempts that can be made on the group during the current <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups-failoverperiod">FailoverPeriod</a>  time interval.
     */
    dwFailoverAttemptsRemaining : UInt32

    /**
     * The amount of time remaining for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups-failoverperiod">FailoverPeriod</a>, in hours.
     */
    dwFailoverPeriodRemaining : UInt32

}
