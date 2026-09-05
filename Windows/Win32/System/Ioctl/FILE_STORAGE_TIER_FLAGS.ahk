#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class FILE_STORAGE_TIER_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: FILE_STORAGE_TIER_FLAG_NO_SEEK_PENALTY
     * @type {Integer (UInt32)}
     */
    static FLAG_NO_SEEK_PENALTY => 131072
}
