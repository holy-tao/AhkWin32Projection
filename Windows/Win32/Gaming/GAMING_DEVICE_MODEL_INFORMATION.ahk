#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GAMING_DEVICE_DEVICE_ID.ahk" { GAMING_DEVICE_DEVICE_ID }
#Import ".\GAMING_DEVICE_VENDOR_ID.ahk" { GAMING_DEVICE_VENDOR_ID }

/**
 * Contains information about the device that the game is running on.
 * @remarks
 * This is a Win32 API that's supported in both Win32 and UWP apps. While it works on any device family, it's only really of value on Xbox devices.
 * @see https://learn.microsoft.com/windows/win32/api/gamingdeviceinformation/ns-gamingdeviceinformation-gaming_device_model_information
 * @namespace Windows.Win32.Gaming
 */
export default struct GAMING_DEVICE_MODEL_INFORMATION {
    #StructPack 4

    /**
     * The vendor of the device.
     */
    vendorId : GAMING_DEVICE_VENDOR_ID

    /**
     * The type of device.
     */
    deviceId : GAMING_DEVICE_DEVICE_ID

}
