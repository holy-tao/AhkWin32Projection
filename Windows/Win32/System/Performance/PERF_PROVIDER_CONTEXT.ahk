#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines provider context information.
 * @remarks
 * By default, PERFLIB uses process heap. The memory allocation and free routines lets you provide custom memory management.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_provider_context
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_PROVIDER_CONTEXT {
    #StructPack 8

    /**
     * The size of this structure.
     */
    ContextSize : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * The name of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nc-perflib-perflibrequest">ControlCallback</a> function that PERFLIB calls to notify you of consumer requests, such as a request to add or remove counters from the query. Set this member if the <b>callback</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element is "custom" or you used the <b>-NotificationCallback</b> argument when calling <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a>. Otherwise, <b>NULL</b>.
     */
    ControlCallback : IntPtr

    /**
     * The name of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nc-perflib-perf_mem_alloc">AllocateMemory</a> function that PERFLIB calls to allocate memory. Set this member if you used the <b>-MemoryRoutines</b> argument when calling <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a>. Otherwise, <b>NULL</b>.
     */
    MemAllocRoutine : IntPtr

    /**
     * The name of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nc-perflib-perf_mem_free">FreeMemory</a> function that PERFLIB calls to free memory allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nc-perflib-perf_mem_alloc">AllocateMemory</a> function. Must be <b>NULL</b> if <b>MemAllocRoutine</b> is <b>NULL</b>.
     */
    MemFreeRoutine : IntPtr

    /**
     * Context information passed to the memory allocation and free routines. Can be <b>NULL</b>.
     */
    pMemContext : IntPtr

}
