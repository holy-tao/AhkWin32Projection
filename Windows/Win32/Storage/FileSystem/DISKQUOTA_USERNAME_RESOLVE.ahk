#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class DISKQUOTA_USERNAME_RESOLVE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DISKQUOTA_USERNAME_RESOLVE_ASYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DISKQUOTA_USERNAME_RESOLVE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISKQUOTA_USERNAME_RESOLVE_SYNC => 1
}
