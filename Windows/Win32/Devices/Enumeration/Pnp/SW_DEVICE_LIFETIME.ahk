#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class SW_DEVICE_LIFETIME extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SWDeviceLifetimeHandle => 0

    /**
     * @type {Integer (Int32)}
     */
    static SWDeviceLifetimeParentPresent => 1

    /**
     * @type {Integer (Int32)}
     */
    static SWDeviceLifetimeMax => 2
}
