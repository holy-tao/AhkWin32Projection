#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines types of I/O statistics reported by CLFS and is used when a client calls GetLogIoStatistics.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ne-clfs-clfs_iostats_class
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLFS_IOSTATS_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The default I/O statistics exported.
     * @type {Integer (Int32)}
     */
    static ClfsIoStatsDefault => 0

    /**
     * The log flush rate.
     * @type {Integer (Int32)}
     */
    static ClfsIoStatsMax => 65535
}
