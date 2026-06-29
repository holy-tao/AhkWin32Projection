#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags that describe a thread.
 * @remarks
 * There is a <b>PSS_THREAD_FLAGS</b> member in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_thread_entry">PSS_THREAD_ENTRY</a> structure that <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ne-processsnapshot-pss_thread_flags
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
export default struct PSS_THREAD_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
