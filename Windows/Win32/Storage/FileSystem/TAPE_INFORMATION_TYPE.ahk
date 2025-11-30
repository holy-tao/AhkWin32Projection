#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TAPE_INFORMATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SET_TAPE_DRIVE_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SET_TAPE_MEDIA_INFORMATION => 0
}
