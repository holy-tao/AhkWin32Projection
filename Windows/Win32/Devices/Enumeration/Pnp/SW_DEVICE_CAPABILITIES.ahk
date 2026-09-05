#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
class SW_DEVICE_CAPABILITIES extends Win32Enum {

    /**
     * Native name: SWDeviceCapabilitiesNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: SWDeviceCapabilitiesRemovable
     * @type {Integer (Int32)}
     */
    static Removable => 1

    /**
     * Native name: SWDeviceCapabilitiesSilentInstall
     * @type {Integer (Int32)}
     */
    static SilentInstall => 2

    /**
     * Native name: SWDeviceCapabilitiesNoDisplayInUI
     * @type {Integer (Int32)}
     */
    static NoDisplayInUI => 4

    /**
     * Native name: SWDeviceCapabilitiesDriverRequired
     * @type {Integer (Int32)}
     */
    static DriverRequired => 8
}
