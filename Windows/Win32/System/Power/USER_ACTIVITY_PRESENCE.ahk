#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class USER_ACTIVITY_PRESENCE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PowerUserPresent => 0

    /**
     * @type {Integer (Int32)}
     */
    static PowerUserNotPresent => 1

    /**
     * @type {Integer (Int32)}
     */
    static PowerUserInactive => 2

    /**
     * @type {Integer (Int32)}
     */
    static PowerUserMaximum => 3

    /**
     * @type {Integer (Int32)}
     */
    static PowerUserInvalid => 3
}
