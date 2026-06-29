#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Debug\CONTEXT.ahk" { CONTEXT }
#Import ".\PSS_THREAD_FLAGS.ahk" { PSS_THREAD_FLAGS }
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Holds thread information returned by PssWalkSnapshotPssWalkSnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns a <b>PSS_THREAD_ENTRY</b> structure when the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_walk_information_class">PSS_WALK_INFORMATION_CLASS</a> member that the caller provides it is <b>PSS_WALK_THREADS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_thread_entry
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
export default struct PSS_THREAD_ENTRY {
    #StructPack 8

    /**
     * The exit code of the process. If the process has not exited, this is set to <b>STILL_ACTIVE</b> (259).
     */
    ExitStatus : UInt32

    /**
     * The address of the thread environment block (TEB). Reserved for use by the operating system.
     */
    TebBaseAddress : IntPtr

    /**
     * The process ID.
     */
    ProcessId : UInt32

    /**
     * The thread ID.
     */
    ThreadId : UInt32

    /**
     * The affinity mask of the process.
     */
    AffinityMask : IntPtr

    /**
     * The thread’s dynamic priority level.
     */
    Priority : Int32

    /**
     * The base priority level of the process.
     */
    BasePriority : Int32

    /**
     * Reserved for use by the operating system.
     */
    LastSyscallFirstArgument : IntPtr

    /**
     * Reserved for use by the operating system.
     */
    LastSyscallNumber : UInt16

    /**
     * The time the thread was created. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    CreateTime : FILETIME

    /**
     * If the thread exited, the time of the exit. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    ExitTime : FILETIME

    /**
     * The amount of time the thread spent executing in kernel mode. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    KernelTime : FILETIME

    /**
     * The amount of time the thread spent executing in user mode. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    UserTime : FILETIME

    /**
     * A pointer to the thread procedure for thread.
     */
    Win32StartAddress : IntPtr

    /**
     * The capture time of this thread. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    CaptureTime : FILETIME

    /**
     * Flags about the thread. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_thread_flags">PSS_THREAD_FLAGS</a>.
     */
    Flags : PSS_THREAD_FLAGS

    /**
     * The    count of times the thread suspended.
     */
    SuspendCount : UInt16

    /**
     * The size of <i>ContextRecord</i>, in bytes.
     */
    SizeOfContextRecord : UInt16

    /**
     * A pointer to the context record if thread context information was captured. The pointer is valid for the lifetime of the walk marker passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a>.
     */
    ContextRecord : CONTEXT.Ptr

}
