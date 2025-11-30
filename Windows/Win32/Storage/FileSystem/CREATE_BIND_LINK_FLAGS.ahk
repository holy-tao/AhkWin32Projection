#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CREATE_BIND_LINK_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static CREATE_BIND_LINK_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CREATE_BIND_LINK_FLAG_READ_ONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static CREATE_BIND_LINK_FLAG_MERGED => 2
}
