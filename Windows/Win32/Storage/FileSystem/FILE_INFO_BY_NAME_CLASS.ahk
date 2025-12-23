#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_INFO_BY_NAME_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FileStatByNameInfo => 0

    /**
     * @type {Integer (Int32)}
     */
    static FileStatLxByNameInfo => 1

    /**
     * @type {Integer (Int32)}
     */
    static FileCaseSensitiveByNameInfo => 2

    /**
     * @type {Integer (Int32)}
     */
    static FileStatBasicByNameInfo => 3

    /**
     * @type {Integer (Int32)}
     */
    static MaximumFileInfoByNameClass => 4
}
