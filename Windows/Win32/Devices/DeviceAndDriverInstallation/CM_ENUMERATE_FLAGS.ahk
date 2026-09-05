#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_ENUMERATE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CM_ENUMERATE_CLASSES_INSTALLER
     * @type {Integer (UInt32)}
     */
    static CLASSES_INSTALLER => 0

    /**
     * Native name: CM_ENUMERATE_CLASSES_INTERFACE
     * @type {Integer (UInt32)}
     */
    static CLASSES_INTERFACE => 1

    /**
     * Native name: CM_ENUMERATE_CLASSES_BITS
     * @type {Integer (UInt32)}
     */
    static CLASSES_BITS => 1
}
