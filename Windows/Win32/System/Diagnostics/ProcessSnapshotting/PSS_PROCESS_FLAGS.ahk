#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Flags that describe a process.
 * @remarks
 * There are <b>PSS_PROCESS_FLAGS</b> members in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_process_information">PSS_PROCESS_INFORMATION</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_handle_entry">PSS_HANDLE_ENTRY</a> structures.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ne-processsnapshot-pss_process_flags
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
class PSS_PROCESS_FLAGS extends Win32BitflagEnum {

    /**
     * No flag.
     * Native name: PSS_PROCESS_FLAGS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The process is protected.
     * Native name: PSS_PROCESS_FLAGS_PROTECTED
     * @type {Integer (Int32)}
     */
    static PROTECTED => 1

    /**
     * The process is a 32-bit process running on a 64-bit native OS.
     * Native name: PSS_PROCESS_FLAGS_WOW64
     * @type {Integer (Int32)}
     */
    static WOW64 => 2

    /**
     * Undefined.
     * Native name: PSS_PROCESS_FLAGS_RESERVED_03
     * @type {Integer (Int32)}
     */
    static RESERVED_03 => 4

    /**
     * Undefined.
     * Native name: PSS_PROCESS_FLAGS_RESERVED_04
     * @type {Integer (Int32)}
     */
    static RESERVED_04 => 8

    /**
     * The process is frozen; for example,  a debugger is attached and broken into the process or a Store process is suspended by a lifetime management service.
     * Native name: PSS_PROCESS_FLAGS_FROZEN
     * @type {Integer (Int32)}
     */
    static FROZEN => 16
}
