#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Registry
 */
class REG_OPEN_CREATE_OPTIONS extends Win32BitflagEnum {

    /**
     * Native name: REG_OPTION_RESERVED
     * @type {Integer (UInt32)}
     */
    static OPTION_RESERVED => 0

    /**
     * Native name: REG_OPTION_NON_VOLATILE
     * @type {Integer (UInt32)}
     */
    static OPTION_NON_VOLATILE => 0

    /**
     * Native name: REG_OPTION_VOLATILE
     * @type {Integer (UInt32)}
     */
    static OPTION_VOLATILE => 1

    /**
     * Native name: REG_OPTION_CREATE_LINK
     * @type {Integer (UInt32)}
     */
    static OPTION_CREATE_LINK => 2

    /**
     * Native name: REG_OPTION_BACKUP_RESTORE
     * @type {Integer (UInt32)}
     */
    static OPTION_BACKUP_RESTORE => 4

    /**
     * Native name: REG_OPTION_OPEN_LINK
     * @type {Integer (UInt32)}
     */
    static OPTION_OPEN_LINK => 8

    /**
     * Native name: REG_OPTION_DONT_VIRTUALIZE
     * @type {Integer (UInt32)}
     */
    static OPTION_DONT_VIRTUALIZE => 16
}
