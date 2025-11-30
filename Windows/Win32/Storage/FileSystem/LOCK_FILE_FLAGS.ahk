#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class LOCK_FILE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LOCKFILE_EXCLUSIVE_LOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOCKFILE_FAIL_IMMEDIATELY => 1
}
