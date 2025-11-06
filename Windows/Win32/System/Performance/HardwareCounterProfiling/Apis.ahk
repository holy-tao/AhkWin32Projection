#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Performance.HardwareCounterProfiling
 * @version v4.0.30319
 */
class HardwareCounterProfiling {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Enables thread profiling on the specified thread.
     * @param {HANDLE} ThreadHandle The handle to the thread on which you want to enable profiling. This must be the current thread.
     * @param {Integer} Flags To receive thread profiling data such as context switch count, set this parameter to THREAD_PROFILING_FLAG_DISPATCH; otherwise, set to 0.
     * @param {Integer} HardwareCounters To receive hardware performance counter data, set this parameter to a bitmask that identifies the hardware counters to collect. You can specify up to 16 performance counters. Each bit relates directly to the zero-based hardware counter index for the hardware performance counters that you configured. Set to zero if you are not collecting hardware counter data. If you set a bit for a hardware counter that has not been configured, the counter value that is read for that counter is zero.
     * @param {Pointer<HANDLE>} PerformanceDataHandle An opaque handle that you use when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-readthreadprofilingdata">ReadThreadProfilingData</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-disablethreadprofiling">DisableThreadProfiling</a> functions.
     * @returns {Integer} Returns ERROR_SUCCESS if the call is successful; otherwise, a system error code (see Winerror.h).
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-enablethreadprofiling
     * @since windows6.1
     */
    static EnableThreadProfiling(ThreadHandle, Flags, HardwareCounters, PerformanceDataHandle) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        result := DllCall("KERNEL32.dll\EnableThreadProfiling", "ptr", ThreadHandle, "uint", Flags, "uint", HardwareCounters, "ptr", PerformanceDataHandle, "uint")
        return result
    }

    /**
     * Disables thread profiling.
     * @param {HANDLE} PerformanceDataHandle The handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-enablethreadprofiling">EnableThreadProfiling</a> function returned.
     * @returns {Integer} Returns ERROR_SUCCESS if the call is successful; otherwise, a system error code (see Winerror.h).
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-disablethreadprofiling
     * @since windows6.1
     */
    static DisableThreadProfiling(PerformanceDataHandle) {
        PerformanceDataHandle := PerformanceDataHandle is Win32Handle ? NumGet(PerformanceDataHandle, "ptr") : PerformanceDataHandle

        result := DllCall("KERNEL32.dll\DisableThreadProfiling", "ptr", PerformanceDataHandle, "uint")
        return result
    }

    /**
     * Determines whether thread profiling is enabled for the specified thread.
     * @param {HANDLE} ThreadHandle The handle to the thread of interest.
     * @param {Pointer<BOOLEAN>} Enabled Is <b>TRUE</b> if thread profiling is enabled for the specified thread; otherwise, <b>FALSE</b>.
     * @returns {Integer} Returns ERROR_SUCCESS if the call is successful; otherwise, a system error code (see Winerror.h).
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-querythreadprofiling
     * @since windows6.1
     */
    static QueryThreadProfiling(ThreadHandle, Enabled) {
        ThreadHandle := ThreadHandle is Win32Handle ? NumGet(ThreadHandle, "ptr") : ThreadHandle

        EnabledMarshal := Enabled is VarRef ? "char*" : "ptr"

        result := DllCall("KERNEL32.dll\QueryThreadProfiling", "ptr", ThreadHandle, EnabledMarshal, Enabled, "uint")
        return result
    }

    /**
     * Reads the specified profiling data associated with the thread.
     * @param {HANDLE} PerformanceDataHandle The handle that the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-enablethreadprofiling">EnableThreadProfiling</a> function returned.
     * @param {Integer} Flags One or more of the following flags that specify the counter data to read. The flags must have been set when you called the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-enablethreadprofiling">EnableThreadProfiling</a> function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="READ_THREAD_PROFILING_FLAG_DISPATCHING"></a><a id="read_thread_profiling_flag_dispatching"></a><dl>
     * <dt><b>READ_THREAD_PROFILING_FLAG_DISPATCHING</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get the thread profiling data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="READ_THREAD_PROFILING_FLAG_HARDWARE_COUNTERS"></a><a id="read_thread_profiling_flag_hardware_counters"></a><dl>
     * <dt><b>READ_THREAD_PROFILING_FLAG_HARDWARE_COUNTERS</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get the hardware performance counters data.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PERFORMANCE_DATA>} PerformanceData A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-performance_data">PERFORMANCE_DATA</a> structure that contains the thread profiling and hardware counter data.
     * @returns {Integer} Returns ERROR_SUCCESS if the call is successful; otherwise, a system error code (see Winerror.h).
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-readthreadprofilingdata
     * @since windows6.1
     */
    static ReadThreadProfilingData(PerformanceDataHandle, Flags, PerformanceData) {
        PerformanceDataHandle := PerformanceDataHandle is Win32Handle ? NumGet(PerformanceDataHandle, "ptr") : PerformanceDataHandle

        result := DllCall("KERNEL32.dll\ReadThreadProfilingData", "ptr", PerformanceDataHandle, "uint", Flags, "ptr", PerformanceData, "uint")
        return result
    }

;@endregion Methods
}
