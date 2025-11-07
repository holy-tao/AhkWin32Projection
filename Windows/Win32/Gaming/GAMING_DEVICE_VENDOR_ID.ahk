#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the vendor of the console that the game is running on.
 * @remarks
 * 
 * This is a Win32 API that's supported in both Win32 and UWP apps. While it works on any device family, it's only really of value on Xbox devices.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gamingdeviceinformation/ne-gamingdeviceinformation-gaming_device_vendor_id
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class GAMING_DEVICE_VENDOR_ID{

    /**
     * The vendor of the device is not known.
     * @type {Integer (Int32)}
     */
    static GAMING_DEVICE_VENDOR_ID_NONE => 0

    /**
     * The vendor of the device is Microsoft.
     * @type {Integer (Int32)}
     */
    static GAMING_DEVICE_VENDOR_ID_MICROSOFT => -1024700366
}
