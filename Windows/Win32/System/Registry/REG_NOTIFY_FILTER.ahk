#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Registry
 */
class REG_NOTIFY_FILTER extends Win32BitflagEnum {

    /**
     * Native name: REG_NOTIFY_CHANGE_NAME
     * @type {Integer (UInt32)}
     */
    static CHANGE_NAME => 1

    /**
     * Native name: REG_NOTIFY_CHANGE_ATTRIBUTES
     * @type {Integer (UInt32)}
     */
    static CHANGE_ATTRIBUTES => 2

    /**
     * Native name: REG_NOTIFY_CHANGE_LAST_SET
     * @type {Integer (UInt32)}
     */
    static CHANGE_LAST_SET => 4

    /**
     * Native name: REG_NOTIFY_CHANGE_SECURITY
     * @type {Integer (UInt32)}
     */
    static CHANGE_SECURITY => 8

    /**
     * Native name: REG_NOTIFY_THREAD_AGNOSTIC
     * @type {Integer (UInt32)}
     */
    static THREAD_AGNOSTIC => 268435456
}
