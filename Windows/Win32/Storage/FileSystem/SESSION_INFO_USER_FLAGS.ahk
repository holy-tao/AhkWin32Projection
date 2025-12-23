#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SESSION_INFO_USER_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SESS_GUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SESS_NOENCRYPTION => 2
}
