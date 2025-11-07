#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags that describe a thread.
 * @remarks
 * 
 * There is a <b>PSS_THREAD_FLAGS</b> member in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_thread_entry">PSS_THREAD_ENTRY</a> structure that <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/ne-processsnapshot-pss_thread_flags
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_THREAD_FLAGS{

    /**
     * No flag.
     * @type {Integer (Int32)}
     */
    static PSS_THREAD_FLAGS_NONE => 0

    /**
     * The thread terminated.
     * @type {Integer (Int32)}
     */
    static PSS_THREAD_FLAGS_TERMINATED => 1
}
