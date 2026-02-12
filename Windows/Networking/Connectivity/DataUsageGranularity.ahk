#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines levels of granularity used when retrieving data usage statistics with [GetNetworkUsageAsync](connectionprofile_getnetworkusageasync_665790436.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.datausagegranularity
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class DataUsageGranularity extends Win32Enum{

    /**
     * Provide data usage per minute.
     * @type {Integer (Int32)}
     */
    static PerMinute => 0

    /**
     * Provide data usage per hour.
     * @type {Integer (Int32)}
     */
    static PerHour => 1

    /**
     * Provide data usage per day.
     * @type {Integer (Int32)}
     */
    static PerDay => 2

    /**
     * Provide data usage overall.
     * @type {Integer (Int32)}
     */
    static Total => 3
}
