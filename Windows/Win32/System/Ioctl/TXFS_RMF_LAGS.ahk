#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class TXFS_RMF_LAGS extends Win32BitflagEnum {

    /**
     * Native name: TXFS_RM_FLAG_LOGGING_MODE
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_LOGGING_MODE => 1

    /**
     * Native name: TXFS_RM_FLAG_RENAME_RM
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_RENAME_RM => 2

    /**
     * Native name: TXFS_RM_FLAG_LOG_CONTAINER_COUNT_MAX
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_LOG_CONTAINER_COUNT_MAX => 4

    /**
     * Native name: TXFS_RM_FLAG_LOG_CONTAINER_COUNT_MIN
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_LOG_CONTAINER_COUNT_MIN => 8

    /**
     * Native name: TXFS_RM_FLAG_LOG_GROWTH_INCREMENT_NUM_CONTAINERS
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_LOG_GROWTH_INCREMENT_NUM_CONTAINERS => 16

    /**
     * Native name: TXFS_RM_FLAG_LOG_GROWTH_INCREMENT_PERCENT
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_LOG_GROWTH_INCREMENT_PERCENT => 32

    /**
     * Native name: TXFS_RM_FLAG_LOG_AUTO_SHRINK_PERCENTAGE
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_LOG_AUTO_SHRINK_PERCENTAGE => 64

    /**
     * Native name: TXFS_RM_FLAG_LOG_NO_CONTAINER_COUNT_MAX
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_LOG_NO_CONTAINER_COUNT_MAX => 128

    /**
     * Native name: TXFS_RM_FLAG_LOG_NO_CONTAINER_COUNT_MIN
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_LOG_NO_CONTAINER_COUNT_MIN => 256

    /**
     * Native name: TXFS_RM_FLAG_GROW_LOG
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_GROW_LOG => 1024

    /**
     * Native name: TXFS_RM_FLAG_SHRINK_LOG
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_SHRINK_LOG => 2048

    /**
     * Native name: TXFS_RM_FLAG_ENFORCE_MINIMUM_SIZE
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_ENFORCE_MINIMUM_SIZE => 4096

    /**
     * Native name: TXFS_RM_FLAG_PRESERVE_CHANGES
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_PRESERVE_CHANGES => 8192

    /**
     * Native name: TXFS_RM_FLAG_RESET_RM_AT_NEXT_START
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_RESET_RM_AT_NEXT_START => 16384

    /**
     * Native name: TXFS_RM_FLAG_DO_NOT_RESET_RM_AT_NEXT_START
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_DO_NOT_RESET_RM_AT_NEXT_START => 32768

    /**
     * Native name: TXFS_RM_FLAG_PREFER_CONSISTENCY
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_PREFER_CONSISTENCY => 65536

    /**
     * Native name: TXFS_RM_FLAG_PREFER_AVAILABILITY
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_PREFER_AVAILABILITY => 131072
}
