#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags that describe a process.
 * @remarks
 * 
 * There are <b>PSS_PROCESS_FLAGS</b> members in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_process_information">PSS_PROCESS_INFORMATION</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_handle_entry">PSS_HANDLE_ENTRY</a> structures.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/ne-processsnapshot-pss_process_flags
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_PROCESS_FLAGS{

    /**
     * No flag.
     * @type {Integer (Int32)}
     */
    static PSS_PROCESS_FLAGS_NONE => 0

    /**
     * The process is protected.
     * @type {Integer (Int32)}
     */
    static PSS_PROCESS_FLAGS_PROTECTED => 1

    /**
     * The process is a 32-bit process running on a 64-bit native OS.
     * @type {Integer (Int32)}
     */
    static PSS_PROCESS_FLAGS_WOW64 => 2

    /**
     * Undefined.
     * @type {Integer (Int32)}
     */
    static PSS_PROCESS_FLAGS_RESERVED_03 => 4

    /**
     * Undefined.
     * @type {Integer (Int32)}
     */
    static PSS_PROCESS_FLAGS_RESERVED_04 => 8

    /**
     * The process is frozen; for example,  a debugger is attached and broken into the process or a Store process is suspended by a lifetime management service.
     * @type {Integer (Int32)}
     */
    static PSS_PROCESS_FLAGS_FROZEN => 16
}
