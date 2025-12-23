#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_SETTING_ALTITUDE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_GROUP_POLICY => 0

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_USER => 1

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_RUNTIME_OVERRIDE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_PROVISIONING => 3

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_OEM_CUSTOMIZATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_INTERNAL_OVERRIDE => 5

    /**
     * @type {Integer (Int32)}
     */
    static ALTITUDE_OS_DEFAULT => 6
}
