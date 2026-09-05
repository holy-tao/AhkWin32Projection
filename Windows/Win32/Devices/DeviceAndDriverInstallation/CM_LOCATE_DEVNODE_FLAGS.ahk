#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_LOCATE_DEVNODE_FLAGS extends Win32Enum {

    /**
     * Native name: CM_LOCATE_DEVNODE_NORMAL
     * @type {Integer (UInt32)}
     */
    static NORMAL => 0

    /**
     * Native name: CM_LOCATE_DEVNODE_PHANTOM
     * @type {Integer (UInt32)}
     */
    static PHANTOM => 1

    /**
     * Native name: CM_LOCATE_DEVNODE_CANCELREMOVE
     * @type {Integer (UInt32)}
     */
    static CANCELREMOVE => 2

    /**
     * Native name: CM_LOCATE_DEVNODE_NOVALIDATION
     * @type {Integer (UInt32)}
     */
    static NOVALIDATION => 4

    /**
     * Native name: CM_LOCATE_DEVNODE_BITS
     * @type {Integer (UInt32)}
     */
    static BITS => 7
}
