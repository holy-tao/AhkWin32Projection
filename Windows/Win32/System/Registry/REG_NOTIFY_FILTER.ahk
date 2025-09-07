#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 */
class REG_NOTIFY_FILTER{

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NOTIFY_CHANGE_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NOTIFY_CHANGE_ATTRIBUTES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NOTIFY_CHANGE_LAST_SET => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NOTIFY_CHANGE_SECURITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static REG_NOTIFY_THREAD_AGNOSTIC => 268435456
}
