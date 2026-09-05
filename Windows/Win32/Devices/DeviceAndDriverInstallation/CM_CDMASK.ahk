#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_CDMASK extends Win32BitflagEnum {

    /**
     * Native name: CM_CDMASK_DEVINST
     * @type {Integer (UInt32)}
     */
    static DEVINST => 1

    /**
     * Native name: CM_CDMASK_RESDES
     * @type {Integer (UInt32)}
     */
    static RESDES => 2

    /**
     * Native name: CM_CDMASK_FLAGS
     * @type {Integer (UInt32)}
     */
    static FLAGS => 4

    /**
     * Native name: CM_CDMASK_DESCRIPTION
     * @type {Integer (UInt32)}
     */
    static DESCRIPTION => 8

    /**
     * Native name: CM_CDMASK_VALID
     * @type {Integer (UInt32)}
     */
    static VALID => 15
}
