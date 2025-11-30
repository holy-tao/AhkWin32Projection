#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class GET_TAPE_DRIVE_PARAMETERS_OPERATION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GET_TAPE_DRIVE_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GET_TAPE_MEDIA_INFORMATION => 0
}
