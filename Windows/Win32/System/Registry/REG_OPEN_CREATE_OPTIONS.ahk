#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 */
class REG_OPEN_CREATE_OPTIONS{

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_RESERVED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_NON_VOLATILE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_VOLATILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_CREATE_LINK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_BACKUP_RESTORE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_OPEN_LINK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static REG_OPTION_DONT_VIRTUALIZE => 16
}
