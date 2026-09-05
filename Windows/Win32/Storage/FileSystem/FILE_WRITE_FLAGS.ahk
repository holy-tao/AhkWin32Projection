#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_WRITE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: FILE_WRITE_FLAGS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: FILE_WRITE_FLAGS_WRITE_THROUGH
     * @type {Integer (Int32)}
     */
    static WRITE_THROUGH => 1
}
