#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines types of I/O statistics reported by CLFS and is used when a client calls GetLogIoStatistics.
 * @see https://docs.microsoft.com/windows/win32/api//clfs/ne-clfs-clfs_iostats_class
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_IOSTATS_CLASS{

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
