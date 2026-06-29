#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RESOURCE_FAILURE_INFO structure represents information about the Failover attempts for a resource and is used by the RESOURCE_FAILURE_INFO_BUFFER structure.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-resource_failure_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct RESOURCE_FAILURE_INFO {
    #StructPack 4

    /**
     * The number of remaining failover attempts that can be made on the resource during the current <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups-failoverperiod">FailoverPeriod</a> time interval.
     */
    dwRestartAttemptsRemaining : UInt32

    /**
     * The amount of time remaining for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups-failoverperiod">FailoverPeriod</a>, in seconds.
     */
    dwRestartPeriodRemaining : UInt32

}
