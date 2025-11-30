#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_CDMASK extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDMASK_DEVINST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDMASK_RESDES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDMASK_FLAGS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDMASK_DESCRIPTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_CDMASK_VALID => 15
}
