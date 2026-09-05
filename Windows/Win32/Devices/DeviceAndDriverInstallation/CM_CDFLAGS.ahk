#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_CDFLAGS extends Win32BitflagEnum {

    /**
     * Native name: CM_CDFLAGS_DRIVER
     * @type {Integer (UInt32)}
     */
    static DRIVER => 1

    /**
     * Native name: CM_CDFLAGS_ROOT_OWNED
     * @type {Integer (UInt32)}
     */
    static ROOT_OWNED => 2

    /**
     * Native name: CM_CDFLAGS_RESERVED
     * @type {Integer (UInt32)}
     */
    static RESERVED => 4
}
