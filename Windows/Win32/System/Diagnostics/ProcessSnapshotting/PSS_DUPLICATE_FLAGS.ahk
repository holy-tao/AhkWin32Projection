#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Duplication flags for use by PssDuplicateSnapshot.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ne-processsnapshot-pss_duplicate_flags
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
export default struct PSS_DUPLICATE_FLAGS {
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
    static PSS_DUPLICATE_NONE => 0

    /**
     * Free the source handle. This will only succeed if you set the  <b>PSS_CREATE_USE_VM_ALLOCATIONS</b> flag when you called <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psscapturesnapshot">PssCaptureSnapshot</a> to create the snapshot and handle. The handle will be freed  even if duplication fails.
     * The close operation does not protect against concurrent access to the same descriptor.
     * @type {Integer (Int32)}
     */
    static PSS_DUPLICATE_CLOSE_SOURCE => 1
}
