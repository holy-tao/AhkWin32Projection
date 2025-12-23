#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUP_DI_REMOVE_DEVICE_SCOPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DI_REMOVEDEVICE_GLOBAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DI_REMOVEDEVICE_CONFIGSPECIFIC => 2
}
