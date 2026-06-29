#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_THREAD_INFO_DUMP_FLAGS.ahk" { MINIDUMP_THREAD_INFO_DUMP_FLAGS }

/**
 * Contains thread state information.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_thread_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_THREAD_INFO {
    #StructPack 8

    /**
     * The identifier of the thread.
     */
    ThreadId : UInt32

    DumpFlags : MINIDUMP_THREAD_INFO_DUMP_FLAGS

    /**
     * An <b>HRESULT</b> value that indicates the dump status.
     */
    DumpError : UInt32

    /**
     * The thread termination status code.
     */
    ExitStatus : UInt32

    /**
     * The time when the thread was created, in 100-nanosecond intervals since January 1, 1601 (UTC).
     */
    CreateTime : Int64

    /**
     * The time when the thread exited, in 100-nanosecond intervals since January 1, 1601 (UTC).
     */
    ExitTime : Int64

    /**
     * The time executed in kernel mode, in 100-nanosecond intervals.
     */
    KernelTime : Int64

    /**
     * The time executed in user mode, in 100-nanosecond intervals.
     */
    UserTime : Int64

    /**
     * The starting address of the thread.
     */
    StartAddress : Int64

    /**
     * The processor affinity mask.
     */
    Affinity : Int64

}
