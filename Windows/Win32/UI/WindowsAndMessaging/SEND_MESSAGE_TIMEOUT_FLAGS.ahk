#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class SEND_MESSAGE_TIMEOUT_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static SMTO_ABORTIFHUNG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SMTO_BLOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SMTO_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SMTO_NOTIMEOUTIFNOTHUNG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SMTO_ERRORONEXIT => 32
}
