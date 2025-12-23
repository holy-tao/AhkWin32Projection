#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_POWER\_SOURCES enumeration type describes the power source that a device is using.
 * @remarks
 * This enumeration is used by the [WPD\_DEVICE\_POWER\_SOURCE](device-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-power-sources
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_POWER_SOURCES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_POWER_SOURCE_BATTERY => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_POWER_SOURCE_EXTERNAL => 1
}
