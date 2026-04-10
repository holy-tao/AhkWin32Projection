#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class FILE_STORAGE_TIER_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_STORAGE_TIER_FLAG_NO_SEEK_PENALTY => 131072
}
