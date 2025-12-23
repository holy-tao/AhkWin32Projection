#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class PIPE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EVENT_PIPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static READ_DATA_PIPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WRITE_DATA_PIPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ALL_PIPE => 3
}
