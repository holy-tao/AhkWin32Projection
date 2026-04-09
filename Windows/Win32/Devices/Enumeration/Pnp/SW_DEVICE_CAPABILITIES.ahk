#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
class SW_DEVICE_CAPABILITIES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SWDeviceCapabilitiesNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static SWDeviceCapabilitiesRemovable => 1

    /**
     * @type {Integer (Int32)}
     */
    static SWDeviceCapabilitiesSilentInstall => 2

    /**
     * @type {Integer (Int32)}
     */
    static SWDeviceCapabilitiesNoDisplayInUI => 4

    /**
     * @type {Integer (Int32)}
     */
    static SWDeviceCapabilitiesDriverRequired => 8
}
