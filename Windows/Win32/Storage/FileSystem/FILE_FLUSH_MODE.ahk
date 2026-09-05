#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_FLUSH_MODE extends Win32Enum {

    /**
     * Native name: FILE_FLUSH_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: FILE_FLUSH_DATA
     * @type {Integer (Int32)}
     */
    static DATA => 1

    /**
     * Native name: FILE_FLUSH_MIN_METADATA
     * @type {Integer (Int32)}
     */
    static MIN_METADATA => 2

    /**
     * Native name: FILE_FLUSH_NO_SYNC
     * @type {Integer (Int32)}
     */
    static NO_SYNC => 3
}
