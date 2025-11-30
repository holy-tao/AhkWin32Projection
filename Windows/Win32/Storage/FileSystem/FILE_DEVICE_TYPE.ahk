#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_DEVICE_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_CD_ROM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_DISK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_TAPE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DEVICE_DVD => 51
}
