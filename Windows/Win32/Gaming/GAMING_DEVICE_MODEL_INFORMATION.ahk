#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information about the device that the game is running on.
 * @remarks
 * 
  * This is a Win32 API that's supported in both Win32 and UWP apps. While it works on any device family, it's only really of value on Xbox devices.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gamingdeviceinformation/ns-gamingdeviceinformation-gaming_device_model_information
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class GAMING_DEVICE_MODEL_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The vendor of the device.
     * @type {Integer}
     */
    vendorId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The type of device.
     * @type {Integer}
     */
    deviceId {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
