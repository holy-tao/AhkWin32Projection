#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the vendor of the console that the game is running on.
 * @remarks
 * This is a Win32 API that's supported in both Win32 and UWP apps. While it works on any device family, it's only really of value on Xbox devices.
 * @see https://learn.microsoft.com/windows/win32/api/gamingdeviceinformation/ne-gamingdeviceinformation-gaming_device_vendor_id
 * @namespace Windows.Win32.Gaming
 */
class GAMING_DEVICE_VENDOR_ID extends Win32Enum {

    /**
     * The vendor of the device is not known.
     * Native name: GAMING_DEVICE_VENDOR_ID_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The vendor of the device is Microsoft.
     * Native name: GAMING_DEVICE_VENDOR_ID_MICROSOFT
     * @type {Integer (Int32)}
     */
    static MICROSOFT => -1024700366
}
