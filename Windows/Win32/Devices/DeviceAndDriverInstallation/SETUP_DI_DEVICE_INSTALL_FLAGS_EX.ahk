#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class SETUP_DI_DEVICE_INSTALL_FLAGS_EX extends Win32BitflagEnum {

    /**
     * Native name: DI_FLAGSEX_RESERVED2
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_RESERVED2 => 1

    /**
     * Native name: DI_FLAGSEX_RESERVED3
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_RESERVED3 => 2

    /**
     * Native name: DI_FLAGSEX_CI_FAILED
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_CI_FAILED => 4

    /**
     * Native name: DI_FLAGSEX_FINISHINSTALL_ACTION
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_FINISHINSTALL_ACTION => 8

    /**
     * Native name: DI_FLAGSEX_DIDINFOLIST
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_DIDINFOLIST => 16

    /**
     * Native name: DI_FLAGSEX_DIDCOMPATINFO
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_DIDCOMPATINFO => 32

    /**
     * Native name: DI_FLAGSEX_FILTERCLASSES
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_FILTERCLASSES => 64

    /**
     * Native name: DI_FLAGSEX_SETFAILEDINSTALL
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_SETFAILEDINSTALL => 128

    /**
     * Native name: DI_FLAGSEX_DEVICECHANGE
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_DEVICECHANGE => 256

    /**
     * Native name: DI_FLAGSEX_ALWAYSWRITEIDS
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_ALWAYSWRITEIDS => 512

    /**
     * Native name: DI_FLAGSEX_PROPCHANGE_PENDING
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_PROPCHANGE_PENDING => 1024

    /**
     * Native name: DI_FLAGSEX_ALLOWEXCLUDEDDRVS
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_ALLOWEXCLUDEDDRVS => 2048

    /**
     * Native name: DI_FLAGSEX_NOUIONQUERYREMOVE
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_NOUIONQUERYREMOVE => 4096

    /**
     * Native name: DI_FLAGSEX_USECLASSFORCOMPAT
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_USECLASSFORCOMPAT => 8192

    /**
     * Native name: DI_FLAGSEX_RESERVED4
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_RESERVED4 => 16384

    /**
     * Native name: DI_FLAGSEX_NO_DRVREG_MODIFY
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_NO_DRVREG_MODIFY => 32768

    /**
     * Native name: DI_FLAGSEX_IN_SYSTEM_SETUP
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_IN_SYSTEM_SETUP => 65536

    /**
     * Native name: DI_FLAGSEX_INET_DRIVER
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_INET_DRIVER => 131072

    /**
     * Native name: DI_FLAGSEX_APPENDDRIVERLIST
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_APPENDDRIVERLIST => 262144

    /**
     * Native name: DI_FLAGSEX_PREINSTALLBACKUP
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_PREINSTALLBACKUP => 524288

    /**
     * Native name: DI_FLAGSEX_BACKUPONREPLACE
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_BACKUPONREPLACE => 1048576

    /**
     * Native name: DI_FLAGSEX_DRIVERLIST_FROM_URL
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_DRIVERLIST_FROM_URL => 2097152

    /**
     * Native name: DI_FLAGSEX_RESERVED1
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_RESERVED1 => 4194304

    /**
     * Native name: DI_FLAGSEX_EXCLUDE_OLD_INET_DRIVERS
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_EXCLUDE_OLD_INET_DRIVERS => 8388608

    /**
     * Native name: DI_FLAGSEX_POWERPAGE_ADDED
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_POWERPAGE_ADDED => 16777216

    /**
     * Native name: DI_FLAGSEX_FILTERSIMILARDRIVERS
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_FILTERSIMILARDRIVERS => 33554432

    /**
     * Native name: DI_FLAGSEX_INSTALLEDDRIVER
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_INSTALLEDDRIVER => 67108864

    /**
     * Native name: DI_FLAGSEX_NO_CLASSLIST_NODE_MERGE
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_NO_CLASSLIST_NODE_MERGE => 134217728

    /**
     * Native name: DI_FLAGSEX_ALTPLATFORM_DRVSEARCH
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_ALTPLATFORM_DRVSEARCH => 268435456

    /**
     * Native name: DI_FLAGSEX_RESTART_DEVICE_ONLY
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_RESTART_DEVICE_ONLY => 536870912

    /**
     * Native name: DI_FLAGSEX_RECURSIVESEARCH
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_RECURSIVESEARCH => 1073741824

    /**
     * Native name: DI_FLAGSEX_SEARCH_PUBLISHED_INFS
     * @type {Integer (UInt32)}
     */
    static FLAGSEX_SEARCH_PUBLISHED_INFS => 2147483648
}
