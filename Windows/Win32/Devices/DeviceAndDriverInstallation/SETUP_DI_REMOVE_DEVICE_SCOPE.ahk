#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class SETUP_DI_REMOVE_DEVICE_SCOPE extends Win32Enum {

    /**
     * Native name: DI_REMOVEDEVICE_GLOBAL
     * @type {Integer (UInt32)}
     */
    static REMOVEDEVICE_GLOBAL => 1

    /**
     * Native name: DI_REMOVEDEVICE_CONFIGSPECIFIC
     * @type {Integer (UInt32)}
     */
    static REMOVEDEVICE_CONFIGSPECIFIC => 2
}
