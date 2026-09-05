#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_POWER\_SOURCES enumeration type describes the power source that a device is using.
 * @remarks
 * This enumeration is used by the [WPD\_DEVICE\_POWER\_SOURCE](device-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-power-sources
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_POWER_SOURCES extends Win32Enum {

    /**
     * Native name: WPD_POWER_SOURCE_BATTERY
     * @type {Integer (Int32)}
     */
    static SOURCE_BATTERY => 0

    /**
     * Native name: WPD_POWER_SOURCE_EXTERNAL
     * @type {Integer (Int32)}
     */
    static SOURCE_EXTERNAL => 1
}
