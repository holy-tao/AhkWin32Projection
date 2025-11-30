#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SYMBOLIC_LINK_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SYMBOLIC_LINK_FLAG_DIRECTORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMBOLIC_LINK_FLAG_ALLOW_UNPRIVILEGED_CREATE => 2
}
