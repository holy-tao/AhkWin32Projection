#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class CREATE_BIND_LINK_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CREATE_BIND_LINK_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: CREATE_BIND_LINK_FLAG_READ_ONLY
     * @type {Integer (Int32)}
     */
    static FLAG_READ_ONLY => 1

    /**
     * Native name: CREATE_BIND_LINK_FLAG_MERGED
     * @type {Integer (Int32)}
     */
    static FLAG_MERGED => 2
}
