#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the type of device that the game is running on.
 * @remarks
 * This is a Win32 API that's supported in both Win32 and UWP apps. While it works on any device family, it's only really of value on Xbox devices.
 * @see https://learn.microsoft.com/windows/win32/api/gamingdeviceinformation/ne-gamingdeviceinformation-gaming_device_device_id
 * @namespace Windows.Win32.Gaming
 */
class GAMING_DEVICE_DEVICE_ID extends Win32Enum {

    /**
     * The device is not in the Xbox family.
     * Native name: GAMING_DEVICE_DEVICE_ID_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The device is an Xbox One (original).
     * Native name: GAMING_DEVICE_DEVICE_ID_XBOX_ONE
     * @type {Integer (Int32)}
     */
    static XBOX_ONE => 1988865574

    /**
     * The device is an Xbox One S.
     * Native name: GAMING_DEVICE_DEVICE_ID_XBOX_ONE_S
     * @type {Integer (Int32)}
     */
    static XBOX_ONE_S => 712204761

    /**
     * The device is an Xbox One X.
     * Native name: GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X
     * @type {Integer (Int32)}
     */
    static XBOX_ONE_X => 1523980231

    /**
     * The device is an Xbox One X dev kit.
     * Native name: GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X_DEVKIT
     * @type {Integer (Int32)}
     */
    static XBOX_ONE_X_DEVKIT => 284675555

    /**
     * Native name: GAMING_DEVICE_DEVICE_ID_XBOX_SERIES_S
     * @type {Integer (Int32)}
     */
    static XBOX_SERIES_S => 489159355

    /**
     * Native name: GAMING_DEVICE_DEVICE_ID_XBOX_SERIES_X
     * @type {Integer (Int32)}
     */
    static XBOX_SERIES_X => 796540415

    /**
     * Native name: GAMING_DEVICE_DEVICE_ID_XBOX_SERIES_X_DEVKIT
     * @type {Integer (Int32)}
     */
    static XBOX_SERIES_X_DEVKIT => -561359263
}
