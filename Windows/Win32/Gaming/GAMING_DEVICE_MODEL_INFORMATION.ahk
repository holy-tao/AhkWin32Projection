#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\GAMING_DEVICE_VENDOR_ID.ahk
#Include .\GAMING_DEVICE_DEVICE_ID.ahk

/**
 * Contains information about the device that the game is running on.
 * @remarks
 * This is a Win32 API that's supported in both Win32 and UWP apps. While it works on any device family, it's only really of value on Xbox devices.
 * @see https://learn.microsoft.com/windows/win32/api/gamingdeviceinformation/ns-gamingdeviceinformation-gaming_device_model_information
 * @namespace Windows.Win32.Gaming
 */
class GAMING_DEVICE_MODEL_INFORMATION extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * The vendor of the device.
     * @type {GAMING_DEVICE_VENDOR_ID}
     */
    vendorId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The type of device.
     * @type {GAMING_DEVICE_DEVICE_ID}
     */
    deviceId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
