#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_MEMORY_DESCRIPTOR.ahk" { MINIDUMP_MEMORY_DESCRIPTOR }
#Import ".\MINIDUMP_LOCATION_DESCRIPTOR.ahk" { MINIDUMP_LOCATION_DESCRIPTOR }

/**
 * Contains extended information for a specific thread.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_ex
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_THREAD_EX {
    #StructPack 8

    /**
     * The identifier of the thread.
     */
    ThreadId : UInt32

    /**
     * The suspend count for the thread. If the suspend count is greater than zero, the thread is suspended; otherwise, the thread is not suspended. The maximum value is MAXIMUM_SUSPEND_COUNT.
     */
    SuspendCount : UInt32

    /**
     * The priority class of the thread. See 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     */
    PriorityClass : UInt32

    /**
     * The priority level of the thread.
     */
    Priority : UInt32

    /**
     * The thread environment block.
     */
    Teb : Int64

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_memory_descriptor">MINIDUMP_MEMORY_DESCRIPTOR</a> structure.
     */
    Stack : MINIDUMP_MEMORY_DESCRIPTOR

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure.
     */
    ThreadContext : MINIDUMP_LOCATION_DESCRIPTOR

    /**
     * <b>Intel Itanium:  </b>The backing store for the thread.
     */
    BackingStore : MINIDUMP_MEMORY_DESCRIPTOR

}
