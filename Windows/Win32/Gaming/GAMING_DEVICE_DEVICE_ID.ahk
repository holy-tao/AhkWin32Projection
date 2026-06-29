#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the type of device that the game is running on.
 * @remarks
 * This is a Win32 API that's supported in both Win32 and UWP apps. While it works on any device family, it's only really of value on Xbox devices.
 * @see https://learn.microsoft.com/windows/win32/api/gamingdeviceinformation/ne-gamingdeviceinformation-gaming_device_device_id
 * @namespace Windows.Win32.Gaming
 */
export default struct GAMING_DEVICE_DEVICE_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The device is not in the Xbox family.
     * @type {Integer (Int32)}
     */
    static GAMING_DEVICE_DEVICE_ID_NONE => 0

    /**
     * The device is an Xbox One (original).
     * @type {Integer (Int32)}
     */
    static GAMING_DEVICE_DEVICE_ID_XBOX_ONE => 1988865574

    /**
     * The device is an Xbox One S.
     * @type {Integer (Int32)}
     */
    static GAMING_DEVICE_DEVICE_ID_XBOX_ONE_S => 712204761

    /**
     * The device is an Xbox One X.
     * @type {Integer (Int32)}
     */
    static GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X => 1523980231

    /**
     * The device is an Xbox One X dev kit.
     * @type {Integer (Int32)}
     */
    static GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X_DEVKIT => 284675555

    /**
     * @type {Integer (Int32)}
     */
    static GAMING_DEVICE_DEVICE_ID_XBOX_SERIES_S => 489159355

    /**
     * @type {Integer (Int32)}
     */
    static GAMING_DEVICE_DEVICE_ID_XBOX_SERIES_X => 796540415

    /**
     * @type {Integer (Int32)}
     */
    static GAMING_DEVICE_DEVICE_ID_XBOX_SERIES_X_DEVKIT => -561359263
}
