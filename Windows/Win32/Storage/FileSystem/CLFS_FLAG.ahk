#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class CLFS_FLAG extends Win32BitflagEnum {

    /**
     * Native name: CLFS_FLAG_FORCE_APPEND
     * @type {Integer (UInt32)}
     */
    static FORCE_APPEND => 1

    /**
     * Native name: CLFS_FLAG_FORCE_FLUSH
     * @type {Integer (UInt32)}
     */
    static FORCE_FLUSH => 2

    /**
     * Native name: CLFS_FLAG_NO_FLAGS
     * @type {Integer (UInt32)}
     */
    static NO_FLAGS => 0

    /**
     * Native name: CLFS_FLAG_USE_RESERVATION
     * @type {Integer (UInt32)}
     */
    static USE_RESERVATION => 4
}
