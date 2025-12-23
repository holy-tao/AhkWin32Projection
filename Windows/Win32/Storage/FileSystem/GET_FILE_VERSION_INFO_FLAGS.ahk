#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class GET_FILE_VERSION_INFO_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VER_GET_LOCALISED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VER_GET_NEUTRAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VER_GET_PREFETCHED => 4
}
