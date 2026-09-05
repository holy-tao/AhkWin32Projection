#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
class SW_DEVICE_LIFETIME extends Win32Enum {

    /**
     * Native name: SWDeviceLifetimeHandle
     * @type {Integer (Int32)}
     */
    static Handle => 0

    /**
     * Native name: SWDeviceLifetimeParentPresent
     * @type {Integer (Int32)}
     */
    static ParentPresent => 1

    /**
     * Native name: SWDeviceLifetimeMax
     * @type {Integer (Int32)}
     */
    static Max => 2
}
