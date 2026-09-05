#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_PROB extends Win32Enum {

    /**
     * Native name: CM_PROB_NOT_CONFIGURED
     * @type {Integer (UInt32)}
     */
    static NOT_CONFIGURED => 1

    /**
     * Native name: CM_PROB_DEVLOADER_FAILED
     * @type {Integer (UInt32)}
     */
    static DEVLOADER_FAILED => 2

    /**
     * Native name: CM_PROB_OUT_OF_MEMORY
     * @type {Integer (UInt32)}
     */
    static OUT_OF_MEMORY => 3

    /**
     * Native name: CM_PROB_ENTRY_IS_WRONG_TYPE
     * @type {Integer (UInt32)}
     */
    static ENTRY_IS_WRONG_TYPE => 4

    /**
     * Native name: CM_PROB_LACKED_ARBITRATOR
     * @type {Integer (UInt32)}
     */
    static LACKED_ARBITRATOR => 5

    /**
     * Native name: CM_PROB_BOOT_CONFIG_CONFLICT
     * @type {Integer (UInt32)}
     */
    static BOOT_CONFIG_CONFLICT => 6

    /**
     * Native name: CM_PROB_FAILED_FILTER
     * @type {Integer (UInt32)}
     */
    static FAILED_FILTER => 7

    /**
     * Native name: CM_PROB_DEVLOADER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DEVLOADER_NOT_FOUND => 8

    /**
     * Native name: CM_PROB_INVALID_DATA
     * @type {Integer (UInt32)}
     */
    static INVALID_DATA => 9

    /**
     * Native name: CM_PROB_FAILED_START
     * @type {Integer (UInt32)}
     */
    static FAILED_START => 10

    /**
     * Native name: CM_PROB_LIAR
     * @type {Integer (UInt32)}
     */
    static LIAR => 11

    /**
     * Native name: CM_PROB_NORMAL_CONFLICT
     * @type {Integer (UInt32)}
     */
    static NORMAL_CONFLICT => 12

    /**
     * Native name: CM_PROB_NOT_VERIFIED
     * @type {Integer (UInt32)}
     */
    static NOT_VERIFIED => 13

    /**
     * Native name: CM_PROB_NEED_RESTART
     * @type {Integer (UInt32)}
     */
    static NEED_RESTART => 14

    /**
     * Native name: CM_PROB_REENUMERATION
     * @type {Integer (UInt32)}
     */
    static REENUMERATION => 15

    /**
     * Native name: CM_PROB_PARTIAL_LOG_CONF
     * @type {Integer (UInt32)}
     */
    static PARTIAL_LOG_CONF => 16

    /**
     * Native name: CM_PROB_UNKNOWN_RESOURCE
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_RESOURCE => 17

    /**
     * Native name: CM_PROB_REINSTALL
     * @type {Integer (UInt32)}
     */
    static REINSTALL => 18

    /**
     * Native name: CM_PROB_REGISTRY
     * @type {Integer (UInt32)}
     */
    static REGISTRY => 19

    /**
     * Native name: CM_PROB_VXDLDR
     * @type {Integer (UInt32)}
     */
    static VXDLDR => 20

    /**
     * Native name: CM_PROB_WILL_BE_REMOVED
     * @type {Integer (UInt32)}
     */
    static WILL_BE_REMOVED => 21

    /**
     * Native name: CM_PROB_DISABLED
     * @type {Integer (UInt32)}
     */
    static DISABLED => 22

    /**
     * Native name: CM_PROB_DEVLOADER_NOT_READY
     * @type {Integer (UInt32)}
     */
    static DEVLOADER_NOT_READY => 23

    /**
     * Native name: CM_PROB_DEVICE_NOT_THERE
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOT_THERE => 24

    /**
     * Native name: CM_PROB_MOVED
     * @type {Integer (UInt32)}
     */
    static MOVED => 25

    /**
     * Native name: CM_PROB_TOO_EARLY
     * @type {Integer (UInt32)}
     */
    static TOO_EARLY => 26

    /**
     * Native name: CM_PROB_NO_VALID_LOG_CONF
     * @type {Integer (UInt32)}
     */
    static NO_VALID_LOG_CONF => 27

    /**
     * Native name: CM_PROB_FAILED_INSTALL
     * @type {Integer (UInt32)}
     */
    static FAILED_INSTALL => 28

    /**
     * Native name: CM_PROB_HARDWARE_DISABLED
     * @type {Integer (UInt32)}
     */
    static HARDWARE_DISABLED => 29

    /**
     * Native name: CM_PROB_CANT_SHARE_IRQ
     * @type {Integer (UInt32)}
     */
    static CANT_SHARE_IRQ => 30

    /**
     * Native name: CM_PROB_FAILED_ADD
     * @type {Integer (UInt32)}
     */
    static FAILED_ADD => 31

    /**
     * Native name: CM_PROB_DISABLED_SERVICE
     * @type {Integer (UInt32)}
     */
    static DISABLED_SERVICE => 32

    /**
     * Native name: CM_PROB_TRANSLATION_FAILED
     * @type {Integer (UInt32)}
     */
    static TRANSLATION_FAILED => 33

    /**
     * Native name: CM_PROB_NO_SOFTCONFIG
     * @type {Integer (UInt32)}
     */
    static NO_SOFTCONFIG => 34

    /**
     * Native name: CM_PROB_BIOS_TABLE
     * @type {Integer (UInt32)}
     */
    static BIOS_TABLE => 35

    /**
     * Native name: CM_PROB_IRQ_TRANSLATION_FAILED
     * @type {Integer (UInt32)}
     */
    static IRQ_TRANSLATION_FAILED => 36

    /**
     * Native name: CM_PROB_FAILED_DRIVER_ENTRY
     * @type {Integer (UInt32)}
     */
    static FAILED_DRIVER_ENTRY => 37

    /**
     * Native name: CM_PROB_DRIVER_FAILED_PRIOR_UNLOAD
     * @type {Integer (UInt32)}
     */
    static DRIVER_FAILED_PRIOR_UNLOAD => 38

    /**
     * Native name: CM_PROB_DRIVER_FAILED_LOAD
     * @type {Integer (UInt32)}
     */
    static DRIVER_FAILED_LOAD => 39

    /**
     * Native name: CM_PROB_DRIVER_SERVICE_KEY_INVALID
     * @type {Integer (UInt32)}
     */
    static DRIVER_SERVICE_KEY_INVALID => 40

    /**
     * Native name: CM_PROB_LEGACY_SERVICE_NO_DEVICES
     * @type {Integer (UInt32)}
     */
    static LEGACY_SERVICE_NO_DEVICES => 41

    /**
     * Native name: CM_PROB_DUPLICATE_DEVICE
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_DEVICE => 42

    /**
     * Native name: CM_PROB_FAILED_POST_START
     * @type {Integer (UInt32)}
     */
    static FAILED_POST_START => 43

    /**
     * Native name: CM_PROB_HALTED
     * @type {Integer (UInt32)}
     */
    static HALTED => 44

    /**
     * Native name: CM_PROB_PHANTOM
     * @type {Integer (UInt32)}
     */
    static PHANTOM => 45

    /**
     * Native name: CM_PROB_SYSTEM_SHUTDOWN
     * @type {Integer (UInt32)}
     */
    static SYSTEM_SHUTDOWN => 46

    /**
     * Native name: CM_PROB_HELD_FOR_EJECT
     * @type {Integer (UInt32)}
     */
    static HELD_FOR_EJECT => 47

    /**
     * Native name: CM_PROB_DRIVER_BLOCKED
     * @type {Integer (UInt32)}
     */
    static DRIVER_BLOCKED => 48

    /**
     * Native name: CM_PROB_REGISTRY_TOO_LARGE
     * @type {Integer (UInt32)}
     */
    static REGISTRY_TOO_LARGE => 49

    /**
     * Native name: CM_PROB_SETPROPERTIES_FAILED
     * @type {Integer (UInt32)}
     */
    static SETPROPERTIES_FAILED => 50

    /**
     * Native name: CM_PROB_WAITING_ON_DEPENDENCY
     * @type {Integer (UInt32)}
     */
    static WAITING_ON_DEPENDENCY => 51

    /**
     * Native name: CM_PROB_UNSIGNED_DRIVER
     * @type {Integer (UInt32)}
     */
    static UNSIGNED_DRIVER => 52

    /**
     * Native name: CM_PROB_USED_BY_DEBUGGER
     * @type {Integer (UInt32)}
     */
    static USED_BY_DEBUGGER => 53

    /**
     * Native name: CM_PROB_DEVICE_RESET
     * @type {Integer (UInt32)}
     */
    static DEVICE_RESET => 54

    /**
     * Native name: CM_PROB_CONSOLE_LOCKED
     * @type {Integer (UInt32)}
     */
    static CONSOLE_LOCKED => 55

    /**
     * Native name: CM_PROB_NEED_CLASS_CONFIG
     * @type {Integer (UInt32)}
     */
    static NEED_CLASS_CONFIG => 56

    /**
     * Native name: CM_PROB_GUEST_ASSIGNMENT_FAILED
     * @type {Integer (UInt32)}
     */
    static GUEST_ASSIGNMENT_FAILED => 57
}
