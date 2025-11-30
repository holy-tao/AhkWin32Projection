#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The units of the maximum power threshold.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ne-winioctl-storage_device_power_cap_units
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_POWER_CAP_UNITS extends Win32Enum{

    /**
     * Units in percent.
     * @type {Integer (Int32)}
     */
    static StorageDevicePowerCapUnitsPercent => 0

    /**
     * Units in milliwatts.
     * @type {Integer (Int32)}
     */
    static StorageDevicePowerCapUnitsMilliwatts => 1
}
