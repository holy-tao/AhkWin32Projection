#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\HARDWARE_COUNTER_DATA.ahk

/**
 * Contains the thread profiling and hardware counter data that you requested.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-performance_data
 * @namespace Windows.Win32.System.Performance.HardwareCounterProfiling
 * @version v4.0.30319
 */
class PERFORMANCE_DATA extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * The size of this structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The version of this structure. Must be set to PERFORMANCE_DATA_VERSION.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * The number of array elements in the <b>HwCounters</b> array that contain hardware counter data. A value of 3 means that the array contains data for three hardware counters, not that elements 0 through 2 contain counter data.
     * @type {Integer}
     */
    HwCountersCount {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * The number of context switches that occurred from the time profiling was enabled.
     * @type {Integer}
     */
    ContextSwitchCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A bitmask that identifies the reasons for the context switches that occurred since the last time the data was read. For possible values, see the <b>KWAIT_REASON</b> enumeration (the enumeration is included in the Wdm.h file in the WDK).
     * @type {Integer}
     */
    WaitReasonBitMap {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The cycle time of the thread (excludes the time spent interrupted) from the time profiling was enabled.
     * @type {Integer}
     */
    CycleTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of times that the read operation read the data to ensure a consistent snapshot of the data.
     * @type {Integer}
     */
    RetryCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved. Set to zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-hardware_counter_data">HARDWARE_COUNTER_DATA</a> structures that contain the counter values. The elements of the array that contain counter data relate directly to the bits set in the <i>HardwareCounters</i> bitmask that you specified when you called the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-enablethreadprofiling">EnableThreadProfiling</a> function. For example, if you set bit 3 in the <i>HardwareCounters</i> bitmask, HwCounters[3] will contain the counter data for that counter.
     * @type {Array<HARDWARE_COUNTER_DATA>}
     */
    HwCounters{
        get {
            if(!this.HasProp("__HwCountersProxyArray"))
                this.__HwCountersProxyArray := Win32FixedArray(this.ptr + 32, 16, HARDWARE_COUNTER_DATA, "")
            return this.__HwCountersProxyArray
        }
    }
}
