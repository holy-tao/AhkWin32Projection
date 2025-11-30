#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUP_DI_DEVICE_CREATION_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DICD_GENERATE_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DICD_INHERIT_CLASSDRVS => 2
}
