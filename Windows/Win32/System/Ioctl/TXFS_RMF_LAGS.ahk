#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_RMF_LAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_LOGGING_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_RENAME_RM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_LOG_CONTAINER_COUNT_MAX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_LOG_CONTAINER_COUNT_MIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_LOG_GROWTH_INCREMENT_NUM_CONTAINERS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_LOG_GROWTH_INCREMENT_PERCENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_LOG_AUTO_SHRINK_PERCENTAGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_LOG_NO_CONTAINER_COUNT_MAX => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_LOG_NO_CONTAINER_COUNT_MIN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_GROW_LOG => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_SHRINK_LOG => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_ENFORCE_MINIMUM_SIZE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_PRESERVE_CHANGES => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_RESET_RM_AT_NEXT_START => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_DO_NOT_RESET_RM_AT_NEXT_START => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_PREFER_CONSISTENCY => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TXFS_RM_FLAG_PREFER_AVAILABILITY => 131072
}
