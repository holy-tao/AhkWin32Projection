#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_POWERUP_REASON_TYPE extends Win32Enum {

    /**
     * Native name: StoragePowerupUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: StoragePowerupIO
     * @type {Integer (Int32)}
     */
    static PowerupIO => 1

    /**
     * Native name: StoragePowerupDeviceAttention
     * @type {Integer (Int32)}
     */
    static DeviceAttention => 2
}
