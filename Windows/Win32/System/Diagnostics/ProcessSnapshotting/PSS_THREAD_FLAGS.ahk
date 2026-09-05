#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Flags that describe a thread.
 * @remarks
 * There is a <b>PSS_THREAD_FLAGS</b> member in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_thread_entry">PSS_THREAD_ENTRY</a> structure that <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ne-processsnapshot-pss_thread_flags
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
class PSS_THREAD_FLAGS extends Win32BitflagEnum {

    /**
     * No flag.
     * Native name: PSS_THREAD_FLAGS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The thread terminated.
     * Native name: PSS_THREAD_FLAGS_TERMINATED
     * @type {Integer (Int32)}
     */
    static TERMINATED => 1
}
