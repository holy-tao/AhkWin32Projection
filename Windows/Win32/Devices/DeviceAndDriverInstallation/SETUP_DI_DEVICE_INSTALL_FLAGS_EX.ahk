#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUP_DI_DEVICE_INSTALL_FLAGS_EX{

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_RESERVED2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_RESERVED3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_CI_FAILED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_FINISHINSTALL_ACTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_DIDINFOLIST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_DIDCOMPATINFO => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_FILTERCLASSES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_SETFAILEDINSTALL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_DEVICECHANGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_ALWAYSWRITEIDS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_PROPCHANGE_PENDING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_ALLOWEXCLUDEDDRVS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_NOUIONQUERYREMOVE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_USECLASSFORCOMPAT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_RESERVED4 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_NO_DRVREG_MODIFY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_IN_SYSTEM_SETUP => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_INET_DRIVER => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_APPENDDRIVERLIST => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_PREINSTALLBACKUP => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_BACKUPONREPLACE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_DRIVERLIST_FROM_URL => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_RESERVED1 => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_EXCLUDE_OLD_INET_DRIVERS => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_POWERPAGE_ADDED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_FILTERSIMILARDRIVERS => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_INSTALLEDDRIVER => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_NO_CLASSLIST_NODE_MERGE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_ALTPLATFORM_DRVSEARCH => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_RESTART_DEVICE_ONLY => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_RECURSIVESEARCH => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DI_FLAGSEX_SEARCH_PUBLISHED_INFS => 2147483648
}
