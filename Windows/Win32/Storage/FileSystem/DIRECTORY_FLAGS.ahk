#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class DIRECTORY_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static DIRECTORY_FLAGS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DIRECTORY_FLAGS_DISALLOW_PATH_REDIRECTS => 1
}
