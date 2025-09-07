#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WPD\_EFFECT\_MODES enumeration type describes various visual effects that can be applied to an image.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_EFFECT\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-effect-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_EFFECT_MODES{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EFFECT_MODE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EFFECT_MODE_COLOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EFFECT_MODE_BLACK_AND_WHITE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_EFFECT_MODE_SEPIA => 3
}
