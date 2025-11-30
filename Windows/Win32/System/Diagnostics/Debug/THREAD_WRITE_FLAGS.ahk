#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of thread information that will be written to the minidump file by the MiniDumpWriteDump function.
 * @see https://docs.microsoft.com/windows/win32/api//minidumpapiset/ne-minidumpapiset-thread_write_flags
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class THREAD_WRITE_FLAGS extends Win32Enum{

    /**
     * Only basic thread information will be written to the minidump file.
     * @type {Integer (Int32)}
     */
    static ThreadWriteThread => 1

    /**
     * Basic thread and thread stack information will be written to the minidump file.
     * @type {Integer (Int32)}
     */
    static ThreadWriteStack => 2

    /**
     * The entire thread context will be written to the minidump file.
     * @type {Integer (Int32)}
     */
    static ThreadWriteContext => 4

    /**
     * <b>Intel Itanium:  </b>The backing store memory of every thread will be written to the minidump file.
     * @type {Integer (Int32)}
     */
    static ThreadWriteBackingStore => 8

    /**
     * A small amount of memory surrounding each thread's instruction pointer will be written to the minidump file. This allows instructions near a thread's instruction pointer to be disassembled even if an executable image matching the module cannot be found.
     * @type {Integer (Int32)}
     */
    static ThreadWriteInstructionWindow => 16

    /**
     * When the minidump type includes <b>MiniDumpWithProcessThreadData</b>, this flag is set. The callback function can clear this flag to control which threads provide complete thread data in the minidump file.
     * 
     * <b>DbgHelp 5.1:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static ThreadWriteThreadData => 32

    /**
     * When the minidump type includes <b>MiniDumpWithThreadInfo</b>, this flag is set. The callback function can clear this flag to control which threads provide thread state information in the minidump file. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_thread_info">MINIDUMP_THREAD_INFO</a>.
     * 
     * <b>DbgHelp 6.1 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static ThreadWriteThreadInfo => 64
}
