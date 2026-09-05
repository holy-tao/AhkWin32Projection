#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class POWER_ACTION_POLICY_EVENT_CODE extends Win32BitflagEnum {

    /**
     * Native name: POWER_FORCE_TRIGGER_RESET
     * @type {Integer (UInt32)}
     */
    static FORCE_TRIGGER_RESET => 2147483648

    /**
     * Native name: POWER_LEVEL_USER_NOTIFY_EXEC
     * @type {Integer (UInt32)}
     */
    static LEVEL_USER_NOTIFY_EXEC => 4

    /**
     * Native name: POWER_LEVEL_USER_NOTIFY_SOUND
     * @type {Integer (UInt32)}
     */
    static LEVEL_USER_NOTIFY_SOUND => 2

    /**
     * Native name: POWER_LEVEL_USER_NOTIFY_TEXT
     * @type {Integer (UInt32)}
     */
    static LEVEL_USER_NOTIFY_TEXT => 1

    /**
     * Native name: POWER_USER_NOTIFY_BUTTON
     * @type {Integer (UInt32)}
     */
    static USER_NOTIFY_BUTTON => 8

    /**
     * Native name: POWER_USER_NOTIFY_SHUTDOWN
     * @type {Integer (UInt32)}
     */
    static USER_NOTIFY_SHUTDOWN => 16
}
