#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.TpmBaseServices
 * @version v4.0.30319
 */
class TBS_COMMAND_PRIORITY{

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_PRIORITY_LOW => 100

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_PRIORITY_NORMAL => 200

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_PRIORITY_SYSTEM => 400

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_PRIORITY_HIGH => 300

    /**
     * @type {Integer (UInt32)}
     */
    static TBS_COMMAND_PRIORITY_MAX => 2147483648
}
