#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUP_DI_GET_CLASS_DEVS_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_PRESENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_ALLCLASSES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_PROFILE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_DEVICEINTERFACE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIGCF_INTERFACEDEVICE => 16
}
