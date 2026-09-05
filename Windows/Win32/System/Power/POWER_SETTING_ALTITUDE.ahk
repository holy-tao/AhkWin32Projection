#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class POWER_SETTING_ALTITUDE extends Win32Enum {

    /**
     * Native name: ALTITUDE_GROUP_POLICY
     * @type {Integer (Int32)}
     */
    static GROUP_POLICY => 0

    /**
     * Native name: ALTITUDE_USER
     * @type {Integer (Int32)}
     */
    static USER => 1

    /**
     * Native name: ALTITUDE_RUNTIME_OVERRIDE
     * @type {Integer (Int32)}
     */
    static RUNTIME_OVERRIDE => 2

    /**
     * Native name: ALTITUDE_PROVISIONING
     * @type {Integer (Int32)}
     */
    static PROVISIONING => 3

    /**
     * Native name: ALTITUDE_OEM_CUSTOMIZATION
     * @type {Integer (Int32)}
     */
    static OEM_CUSTOMIZATION => 4

    /**
     * Native name: ALTITUDE_INTERNAL_OVERRIDE
     * @type {Integer (Int32)}
     */
    static INTERNAL_OVERRIDE => 5

    /**
     * Native name: ALTITUDE_OS_DEFAULT
     * @type {Integer (Int32)}
     */
    static OS_DEFAULT => 6
}
