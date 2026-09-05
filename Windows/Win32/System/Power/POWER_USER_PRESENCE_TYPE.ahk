#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class POWER_USER_PRESENCE_TYPE extends Win32Enum {

    /**
     * Native name: UserNotPresent
     * @type {Integer (Int32)}
     */
    static NotPresent => 0

    /**
     * Native name: UserPresent
     * @type {Integer (Int32)}
     */
    static Present => 1

    /**
     * Native name: UserUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 255
}
