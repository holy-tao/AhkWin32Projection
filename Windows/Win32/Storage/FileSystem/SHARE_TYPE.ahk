#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_TYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_DISKTREE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_PRINTQ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_DEVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_IPC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_SPECIAL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_TEMPORARY => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static STYPE_MASK => 255
}
