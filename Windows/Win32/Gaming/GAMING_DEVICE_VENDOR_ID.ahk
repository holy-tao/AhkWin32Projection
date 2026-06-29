#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the vendor of the console that the game is running on.
 * @remarks
 * This is a Win32 API that's supported in both Win32 and UWP apps. While it works on any device family, it's only really of value on Xbox devices.
 * @see https://learn.microsoft.com/windows/win32/api/gamingdeviceinformation/ne-gamingdeviceinformation-gaming_device_vendor_id
 * @namespace Windows.Win32.Gaming
 */
export default struct GAMING_DEVICE_VENDOR_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
