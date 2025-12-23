#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_INFO_FLAGS_PERMISSIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PERM_FILE_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PERM_FILE_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PERM_FILE_CREATE => 4
}
