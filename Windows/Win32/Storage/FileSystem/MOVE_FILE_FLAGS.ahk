#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class MOVE_FILE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_COPY_ALLOWED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_CREATE_HARDLINK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_DELAY_UNTIL_REBOOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_REPLACE_EXISTING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_WRITE_THROUGH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MOVEFILE_FAIL_IF_NOT_TRACKABLE => 32
}
