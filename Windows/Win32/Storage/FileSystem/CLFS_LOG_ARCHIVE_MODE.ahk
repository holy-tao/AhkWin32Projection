#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether a log is ephemeral.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ne-clfs-clfs_log_archive_mode
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLFS_LOG_ARCHIVE_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Enables log archive (ephemeral logs) support.
     * @type {Integer (Int32)}
     */
    static ClfsLogArchiveEnabled => 1

    /**
     * Disables ephemeral logs.
     * @type {Integer (Int32)}
     */
    static ClfsLogArchiveDisabled => 2
}
