#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_REENUMERATE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CM_REENUMERATE_NORMAL
     * @type {Integer (UInt32)}
     */
    static NORMAL => 0

    /**
     * Native name: CM_REENUMERATE_SYNCHRONOUS
     * @type {Integer (UInt32)}
     */
    static SYNCHRONOUS => 1

    /**
     * Native name: CM_REENUMERATE_RETRY_INSTALLATION
     * @type {Integer (UInt32)}
     */
    static RETRY_INSTALLATION => 2

    /**
     * Native name: CM_REENUMERATE_ASYNCHRONOUS
     * @type {Integer (UInt32)}
     */
    static ASYNCHRONOUS => 4

    /**
     * Native name: CM_REENUMERATE_BITS
     * @type {Integer (UInt32)}
     */
    static BITS => 7
}
