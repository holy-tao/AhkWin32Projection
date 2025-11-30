#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_REENUMERATE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REENUMERATE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REENUMERATE_SYNCHRONOUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REENUMERATE_RETRY_INSTALLATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REENUMERATE_ASYNCHRONOUS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_REENUMERATE_BITS => 7
}
