#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class SW_DEVICE_CAPABILITIES{

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
