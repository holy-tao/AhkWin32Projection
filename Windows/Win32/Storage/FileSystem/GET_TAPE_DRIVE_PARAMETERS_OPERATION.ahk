#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class GET_TAPE_DRIVE_PARAMETERS_OPERATION extends Win32Enum {

    /**
     * Native name: GET_TAPE_DRIVE_INFORMATION
     * @type {Integer (UInt32)}
     */
    static INFORMATION => 1

    /**
     * Native name: GET_TAPE_MEDIA_INFORMATION
     * @type {Integer (UInt32)}
     */
    static MEDIA_INFORMATION => 0
}
