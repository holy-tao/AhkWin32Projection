#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_DEVICE_TYPE extends Win32Enum {

    /**
     * Native name: FILE_DEVICE_CD_ROM
     * @type {Integer (UInt32)}
     */
    static CD_ROM => 2

    /**
     * Native name: FILE_DEVICE_DISK
     * @type {Integer (UInt32)}
     */
    static DISK => 7

    /**
     * Native name: FILE_DEVICE_TAPE
     * @type {Integer (UInt32)}
     */
    static TAPE => 31

    /**
     * Native name: FILE_DEVICE_DVD
     * @type {Integer (UInt32)}
     */
    static DVD => 51
}
