#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_MISC_INFO_FLAGS.ahk" { MINIDUMP_MISC_INFO_FLAGS }

/**
 * Contains a variety of information.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_misc_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_MISC_INFO {
    #StructPack 4

    /**
     * The size of the structure, in bytes.
     */
    SizeOfInfo : UInt32

    Flags1 : MINIDUMP_MISC_INFO_FLAGS

    /**
     * The identifier of the process. If <b>Flags1</b> does not specify MINIDUMP_MISC1_PROCESS_ID, this member is unused.
     */
    ProcessId : UInt32

    /**
     * The creation time of the process, in <b>time_t</b> format. If <b>Flags1</b> does not specify MINIDUMP_MISC1_PROCESS_TIMES, this member is unused.
     */
    ProcessCreateTime : UInt32

    /**
     * The time the process has executed in user mode, in seconds. The time that each of the threads of the process has executed in user mode is determined, then all these times are summed to obtain this value. If <b>Flags1</b> does not specify MINIDUMP_MISC1_PROCESS_TIMES, this member is unused.
     */
    ProcessUserTime : UInt32

    /**
     * The time the process has executed in kernel mode, in seconds. The time that each of the threads of the process has executed in kernel mode is determined, then all these times are summed to obtain this value. If <b>Flags1</b> does not specify MINIDUMP_MISC1_PROCESS_TIMES, this member is unused.
     */
    ProcessKernelTime : UInt32

}
