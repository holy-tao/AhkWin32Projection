#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended information about a process running on a Remote Desktop Session Host (RD Session Host) server.
 * @remarks
 * 
  * > [!NOTE]
  * > The wtsapi32.h header defines WTS_PROCESS_INFO_EX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsapi32/ns-wtsapi32-wts_process_info_exa
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class WTS_PROCESS_INFO_EXA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The Remote Desktop Services session identifier for the session associated with the process.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The process identifier that uniquely identifies the process on the RD Session Host server.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a null-terminated string that contains the name of the executable file associated with the process.
     * @type {PSTR}
     */
    pProcessName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the user security identifiers (SIDs) in the primary access token of the process. For more 
     *       information about SIDs and access tokens, see 
     *       <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control">Access Control</a> and 
     *       <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-identifiers">Security Identifiers</a>.
     * @type {PSID}
     */
    pUserSid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of threads in the process.
     * @type {Integer}
     */
    NumberOfThreads {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of handles in the process.
     * @type {Integer}
     */
    HandleCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The page file usage of the process, in bytes.
     * @type {Integer}
     */
    PagefileUsage {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The peak page file usage of the process, in bytes.
     * @type {Integer}
     */
    PeakPagefileUsage {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The working set size of the process, in bytes.
     * @type {Integer}
     */
    WorkingSetSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The peak working set size of the process, in bytes.
     * @type {Integer}
     */
    PeakWorkingSetSize {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The amount of time, in milliseconds, the process has been running in user mode.
     * @type {Integer}
     */
    UserTime {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * The amount of time, in milliseconds, the process has been running in kernel mode.
     * @type {Integer}
     */
    KernelTime {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }
}
