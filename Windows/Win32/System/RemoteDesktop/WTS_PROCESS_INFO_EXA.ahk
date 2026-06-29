#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\PSID.ahk" { PSID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains extended information about a process running on a Remote Desktop Session Host (RD Session Host) server. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wtsapi32.h header defines WTS_PROCESS_INFO_EX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wts_process_info_exa
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset ANSI
 */
export default struct WTS_PROCESS_INFO_EXA {
    #StructPack 8

    /**
     * The Remote Desktop Services session identifier for the session associated with the process.
     */
    SessionId : UInt32

    /**
     * The process identifier that uniquely identifies the process on the RD Session Host server.
     */
    ProcessId : UInt32

    /**
     * A pointer to a null-terminated string that contains the name of the executable file associated with the process.
     */
    pProcessName : PSTR

    /**
     * A pointer to the user security identifiers (SIDs) in the primary access token of the process. For more 
     *       information about SIDs and access tokens, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a> and 
     *       <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a>.
     */
    pUserSid : PSID

    /**
     * The number of threads in the process.
     */
    NumberOfThreads : UInt32

    /**
     * The number of handles in the process.
     */
    HandleCount : UInt32

    /**
     * The page file usage of the process, in bytes.
     */
    PagefileUsage : UInt32

    /**
     * The peak page file usage of the process, in bytes.
     */
    PeakPagefileUsage : UInt32

    /**
     * The working set size of the process, in bytes.
     */
    WorkingSetSize : UInt32

    /**
     * The peak working set size of the process, in bytes.
     */
    PeakWorkingSetSize : UInt32

    /**
     * The amount of time, in milliseconds, the process has been running in user mode.
     */
    UserTime : Int64

    /**
     * The amount of time, in milliseconds, the process has been running in kernel mode.
     */
    KernelTime : Int64

}
