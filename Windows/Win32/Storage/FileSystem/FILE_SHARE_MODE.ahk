#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_SHARE_MODE extends Win32BitflagEnum {

    /**
     * Native name: FILE_SHARE_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: FILE_SHARE_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 4

    /**
     * Native name: FILE_SHARE_READ
     * @type {Integer (UInt32)}
     */
    static READ => 1

    /**
     * Native name: FILE_SHARE_WRITE
     * @type {Integer (UInt32)}
     */
    static WRITE => 2
}
