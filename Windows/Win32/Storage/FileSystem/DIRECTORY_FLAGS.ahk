#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class DIRECTORY_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: DIRECTORY_FLAGS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: DIRECTORY_FLAGS_DISALLOW_PATH_REDIRECTS
     * @type {Integer (Int32)}
     */
    static DISALLOW_PATH_REDIRECTS => 1
}
