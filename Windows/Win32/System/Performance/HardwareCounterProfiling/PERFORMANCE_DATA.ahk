#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HARDWARE_COUNTER_TYPE.ahk" { HARDWARE_COUNTER_TYPE }
#Import ".\HARDWARE_COUNTER_DATA.ahk" { HARDWARE_COUNTER_DATA }

/**
 * Contains the thread profiling and hardware counter data that you requested.
 * @remarks
 * You must initialize the <b>Size</b> and <b>Version</b> members before calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-readthreadprofilingdata">ReadThreadProfilingData</a> function to read the profiling data.
 * 
 * The profile data contained in this structure depends on the data that you requested when you called the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-readthreadprofilingdata">ReadThreadProfilingData</a> function. The following members are set when you specify the READ_THREAD_PROFILING_FLAG_DISPATCHING flag:
 * 
 * <ul>
 * <li><b>ContextSwitchCount</b></li>
 * <li><b>CycleTime</b></li>
 * <li><b>RetryCount</b></li>
 * <li><b>WaitReasonBitMap</b></li>
 * </ul>
 * The following members are set when you specify the READ_THREAD_PROFILING_FLAG_HARDWARE_COUNTERS flag:
 * 
 * <ul>
 * <li><b>HwCounters</b></li>
 * <li><b>HwCountersCount</b></li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-performance_data
 * @namespace Windows.Win32.System.Performance.HardwareCounterProfiling
 */
export default struct PERFORMANCE_DATA {
    #StructPack 8

    /**
     * The size of this structure.
     */
    Size : UInt16

    /**
     * The version of this structure. Must be set to PERFORMANCE_DATA_VERSION.
     */
    Version : Int8

    /**
     * The number of array elements in the <b>HwCounters</b> array that contain hardware counter data. A value of 3 means that the array contains data for three hardware counters, not that elements 0 through 2 contain counter data.
     */
    HwCountersCount : Int8

    /**
     * The number of context switches that occurred from the time profiling was enabled.
     */
    ContextSwitchCount : UInt32

    /**
     * A bitmask that identifies the reasons for the context switches that occurred since the last time the data was read. For possible values, see the <b>KWAIT_REASON</b> enumeration (the enumeration is included in the Wdm.h file in the WDK).
     */
    WaitReasonBitMap : Int64

    /**
     * The cycle time of the thread (excludes the time spent interrupted) from the time profiling was enabled.
     */
    CycleTime : Int64

    /**
     * The number of times that the read operation read the data to ensure a consistent snapshot of the data.
     */
    RetryCount : UInt32

    /**
     * Reserved. Set to zero.
     */
    Reserved : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-hardware_counter_data">HARDWARE_COUNTER_DATA</a> structures that contain the counter values. The elements of the array that contain counter data relate directly to the bits set in the <i>HardwareCounters</i> bitmask that you specified when you called the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-enablethreadprofiling">EnableThreadProfiling</a> function. For example, if you set bit 3 in the <i>HardwareCounters</i> bitmask, HwCounters[3] will contain the counter data for that counter.
     */
    HwCounters : HARDWARE_COUNTER_DATA[16]

}
