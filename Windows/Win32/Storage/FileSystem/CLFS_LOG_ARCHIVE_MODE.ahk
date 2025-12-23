#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether a log is ephemeral.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ne-clfs-clfs_log_archive_mode
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_LOG_ARCHIVE_MODE extends Win32Enum{

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
