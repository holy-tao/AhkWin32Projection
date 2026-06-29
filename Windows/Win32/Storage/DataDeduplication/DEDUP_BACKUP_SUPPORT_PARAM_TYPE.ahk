#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether Data Deduplication should perform an unoptimized or optimized restore.
 * @see https://learn.microsoft.com/windows/win32/api/ddpbackup/ne-ddpbackup-dedup_backup_support_param_type
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DEDUP_BACKUP_SUPPORT_PARAM_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
