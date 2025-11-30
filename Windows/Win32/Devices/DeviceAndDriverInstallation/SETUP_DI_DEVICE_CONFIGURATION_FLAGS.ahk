#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUP_DI_DEVICE_CONFIGURATION_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_REMOVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_MANUAL_INSTALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_IGNORE_BOOT_LC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_NET_BOOT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_REINSTALL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_FAILEDINSTALL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_CANTSTOPACHILD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_OKREMOVEROM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_NOREMOVEEXIT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_FINISH_INSTALL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_NEEDS_FORCED_CONFIG => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_NETBOOT_CARD => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_PARTIAL_LOG_CONF => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_SUPPRESS_SURPRISE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_VERIFY_HARDWARE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_FINISHINSTALL_UI => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_FINISHINSTALL_ACTION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_BOOT_DEVICE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CONFIGFLAG_NEEDS_CLASS_CONFIG => 524288
}
