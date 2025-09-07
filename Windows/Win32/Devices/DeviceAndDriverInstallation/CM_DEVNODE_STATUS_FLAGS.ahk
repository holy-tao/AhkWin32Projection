#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_DEVNODE_STATUS_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static DN_CHANGEABLE_FLAGS => 1639670464

    /**
     * @type {Integer (UInt32)}
     */
    static DN_ROOT_ENUMERATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DN_DRIVER_LOADED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DN_ENUM_LOADED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DN_STARTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DN_MANUAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DN_NEED_TO_ENUM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DN_NOT_FIRST_TIME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DN_HARDWARE_ENUM => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DN_LIAR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DN_HAS_MARK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DN_HAS_PROBLEM => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DN_FILTERED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DN_MOVED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DN_DISABLEABLE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DN_REMOVABLE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DN_PRIVATE_PROBLEM => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DN_MF_PARENT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DN_MF_CHILD => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DN_WILL_BE_REMOVED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DN_NOT_FIRST_TIMEE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DN_STOP_FREE_RES => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DN_REBAL_CANDIDATE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DN_BAD_PARTIAL => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DN_NT_ENUMERATOR => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DN_NT_DRIVER => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DN_NEEDS_LOCKING => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DN_ARM_WAKEUP => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DN_APM_ENUMERATOR => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DN_APM_DRIVER => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DN_SILENT_INSTALL => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DN_NO_SHOW_IN_DM => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DN_BOOT_LOG_PROB => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DN_NEED_RESTART => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DN_DRIVER_BLOCKED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DN_LEGACY_DRIVER => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DN_CHILD_WITH_INVALID_ID => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DN_DEVICE_DISCONNECTED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DN_QUERY_REMOVE_PENDING => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DN_QUERY_REMOVE_ACTIVE => 131072
}
