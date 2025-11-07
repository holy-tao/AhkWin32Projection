#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines provider context information.
 * @remarks
 * 
 * By default, PERFLIB uses process heap. The memory allocation and free routines lets you provide custom memory management.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//perflib/ns-perflib-perf_provider_context
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_PROVIDER_CONTEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size of this structure.
     * @type {Integer}
     */
    ContextSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The name of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nc-perflib-perflibrequest">ControlCallback</a> function that PERFLIB calls to notify you of consumer requests, such as a request to add or remove counters from the query. Set this member if the <b>callback</b> attribute of the <a href="https://docs.microsoft.com/previous-versions/aa373164(v=vs.85)">provider</a> element is "custom" or you used the <b>-NotificationCallback</b> argument when calling <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a>. Otherwise, <b>NULL</b>.
     * @type {Pointer<PERFLIBREQUEST>}
     */
    ControlCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The name of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nc-perflib-perf_mem_alloc">AllocateMemory</a> function that PERFLIB calls to allocate memory. Set this member if you used the <b>-MemoryRoutines</b> argument when calling <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/ctrpp">CTRPP</a>. Otherwise, <b>NULL</b>.
     * @type {Pointer<PERF_MEM_ALLOC>}
     */
    MemAllocRoutine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The name of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nc-perflib-perf_mem_free">FreeMemory</a> function that PERFLIB calls to free memory allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nc-perflib-perf_mem_alloc">AllocateMemory</a> function. Must be <b>NULL</b> if <b>MemAllocRoutine</b> is <b>NULL</b>.
     * @type {Pointer<PERF_MEM_FREE>}
     */
    MemFreeRoutine {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Context information passed to the memory allocation and free routines. Can be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pMemContext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
