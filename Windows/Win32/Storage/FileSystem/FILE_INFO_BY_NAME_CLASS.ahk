#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_INFO_BY_NAME_CLASS extends Win32Enum {

    /**
     * Native name: FileStatByNameInfo
     * @type {Integer (Int32)}
     */
    static StatByNameInfo => 0

    /**
     * Native name: FileStatLxByNameInfo
     * @type {Integer (Int32)}
     */
    static StatLxByNameInfo => 1

    /**
     * Native name: FileCaseSensitiveByNameInfo
     * @type {Integer (Int32)}
     */
    static CaseSensitiveByNameInfo => 2

    /**
     * Native name: FileStatBasicByNameInfo
     * @type {Integer (Int32)}
     */
    static StatBasicByNameInfo => 3

    /**
     * @type {Integer (Int32)}
     */
    static MaximumFileInfoByNameClass => 4
}
