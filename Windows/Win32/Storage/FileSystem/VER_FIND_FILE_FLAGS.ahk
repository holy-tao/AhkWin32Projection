#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class VER_FIND_FILE_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static VFFF_ISSHAREDFILE => 1
}
