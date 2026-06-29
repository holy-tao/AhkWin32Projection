#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The units of the maximum power threshold.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_device_power_cap_units
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_POWER_CAP_UNITS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
