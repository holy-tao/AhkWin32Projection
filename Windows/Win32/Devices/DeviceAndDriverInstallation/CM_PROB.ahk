#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_PROB extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_NOT_CONFIGURED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DEVLOADER_FAILED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_OUT_OF_MEMORY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_ENTRY_IS_WRONG_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_LACKED_ARBITRATOR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_BOOT_CONFIG_CONFLICT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_FAILED_FILTER => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DEVLOADER_NOT_FOUND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_INVALID_DATA => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_FAILED_START => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_LIAR => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_NORMAL_CONFLICT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_NOT_VERIFIED => 13

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_NEED_RESTART => 14

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_REENUMERATION => 15

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_PARTIAL_LOG_CONF => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_UNKNOWN_RESOURCE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_REINSTALL => 18

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_REGISTRY => 19

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_VXDLDR => 20

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_WILL_BE_REMOVED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DISABLED => 22

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DEVLOADER_NOT_READY => 23

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DEVICE_NOT_THERE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_MOVED => 25

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_TOO_EARLY => 26

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_NO_VALID_LOG_CONF => 27

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_FAILED_INSTALL => 28

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_HARDWARE_DISABLED => 29

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_CANT_SHARE_IRQ => 30

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_FAILED_ADD => 31

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DISABLED_SERVICE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_TRANSLATION_FAILED => 33

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_NO_SOFTCONFIG => 34

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_BIOS_TABLE => 35

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_IRQ_TRANSLATION_FAILED => 36

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_FAILED_DRIVER_ENTRY => 37

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DRIVER_FAILED_PRIOR_UNLOAD => 38

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DRIVER_FAILED_LOAD => 39

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DRIVER_SERVICE_KEY_INVALID => 40

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_LEGACY_SERVICE_NO_DEVICES => 41

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DUPLICATE_DEVICE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_FAILED_POST_START => 43

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_HALTED => 44

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_PHANTOM => 45

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_SYSTEM_SHUTDOWN => 46

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_HELD_FOR_EJECT => 47

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DRIVER_BLOCKED => 48

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_REGISTRY_TOO_LARGE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_SETPROPERTIES_FAILED => 50

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_WAITING_ON_DEPENDENCY => 51

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_UNSIGNED_DRIVER => 52

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_USED_BY_DEBUGGER => 53

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_DEVICE_RESET => 54

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_CONSOLE_LOCKED => 55

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_NEED_CLASS_CONFIG => 56

    /**
     * @type {Integer (UInt32)}
     */
    static CM_PROB_GUEST_ASSIGNMENT_FAILED => 57
}
