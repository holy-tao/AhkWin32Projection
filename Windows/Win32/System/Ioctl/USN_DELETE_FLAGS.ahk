#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class USN_DELETE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: USN_DELETE_FLAG_DELETE
     * @type {Integer (UInt32)}
     */
    static FLAG_DELETE => 1

    /**
     * Native name: USN_DELETE_FLAG_NOTIFY
     * @type {Integer (UInt32)}
     */
    static FLAG_NOTIFY => 2
}
