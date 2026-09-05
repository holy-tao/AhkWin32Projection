#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class FILE_COMPRESSION_TYPE extends Win32BitflagEnum {

    /**
     * Native name: FILE_COMPRESSION_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: FILE_COMPRESSION_WINLZA
     * @type {Integer (UInt32)}
     */
    static WINLZA => 1

    /**
     * Native name: FILE_COMPRESSION_MSZIP
     * @type {Integer (UInt32)}
     */
    static MSZIP => 2

    /**
     * Native name: FILE_COMPRESSION_NTCAB
     * @type {Integer (UInt32)}
     */
    static NTCAB => 3
}
