#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether Data Deduplication should perform an unoptimized or optimized restore.
 * @see https://docs.microsoft.com/windows/win32/api//ddpbackup/ne-ddpbackup-dedup_backup_support_param_type
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class DEDUP_BACKUP_SUPPORT_PARAM_TYPE extends Win32Enum{

    /**
     * Perform an unoptimized restore.
     * @type {Integer (Int32)}
     */
    static DEDUP_RECONSTRUCT_UNOPTIMIZED => 1

    /**
     * Reserved for future use. Do not use.
     * @type {Integer (Int32)}
     */
    static DEDUP_RECONSTRUCT_OPTIMIZED => 2
}
