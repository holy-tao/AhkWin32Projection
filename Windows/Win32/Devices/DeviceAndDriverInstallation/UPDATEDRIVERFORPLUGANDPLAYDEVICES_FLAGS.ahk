#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class UPDATEDRIVERFORPLUGANDPLAYDEVICES_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALLFLAG_FORCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALLFLAG_READONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALLFLAG_NONINTERACTIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INSTALLFLAG_BITS => 7
}
