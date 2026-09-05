#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class DISKQUOTA_USERNAME_RESOLVE extends Win32Enum {

    /**
     * Native name: DISKQUOTA_USERNAME_RESOLVE_ASYNC
     * @type {Integer (UInt32)}
     */
    static ASYNC => 2

    /**
     * Native name: DISKQUOTA_USERNAME_RESOLVE_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: DISKQUOTA_USERNAME_RESOLVE_SYNC
     * @type {Integer (UInt32)}
     */
    static SYNC => 1
}
