#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_FLUSH_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FILE_FLUSH_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static FILE_FLUSH_DATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static FILE_FLUSH_MIN_METADATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static FILE_FLUSH_NO_SYNC => 3
}
