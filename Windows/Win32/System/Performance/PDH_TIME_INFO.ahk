#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PDH_TIME_INFO structure contains information on time intervals as applied to the sampling of performance data.
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_time_info
 * @namespace Windows.Win32.System.Performance
 */
export default struct PDH_TIME_INFO {
    #StructPack 8

    /**
     * Starting time of the sample interval, in local <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format.
     */
    StartTime : Int64

    /**
     * Ending time of the sample interval, in local <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format.
     */
    EndTime : Int64

    /**
     * Number of samples collected during the interval.
     */
    SampleCount : UInt32

}
