#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class VER_FIND_FILE_STATUS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static VFF_CURNEDEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VFF_FILEINUSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VFF_BUFFTOOSMALL => 4
}
