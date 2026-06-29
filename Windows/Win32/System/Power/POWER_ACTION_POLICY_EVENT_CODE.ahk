#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_ACTION_POLICY_EVENT_CODE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_FORCE_TRIGGER_RESET => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_LEVEL_USER_NOTIFY_EXEC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_LEVEL_USER_NOTIFY_SOUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_LEVEL_USER_NOTIFY_TEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_USER_NOTIFY_BUTTON => 8

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_USER_NOTIFY_SHUTDOWN => 16
}
