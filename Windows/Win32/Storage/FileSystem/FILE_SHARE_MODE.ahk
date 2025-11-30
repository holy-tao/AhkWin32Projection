#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_SHARE_MODE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SHARE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SHARE_DELETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SHARE_READ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SHARE_WRITE => 2
}
