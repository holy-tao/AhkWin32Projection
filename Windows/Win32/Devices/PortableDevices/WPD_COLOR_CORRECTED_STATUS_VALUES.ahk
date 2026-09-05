#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_COLOR\_CORRECTED\_STATUS\_VALUES enumeration type describes the color correction status of an image or video file.
 * @remarks
 * Indicates the color corrected status of an image. This enumeration is used by the [WPD\_IMAGE\_COLOR\_CORRECTED\_STATUS](image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-color-corrected-status-values
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_COLOR_CORRECTED_STATUS_VALUES extends Win32Enum {

    /**
     * Native name: WPD_COLOR_CORRECTED_STATUS_NOT_CORRECTED
     * @type {Integer (Int32)}
     */
    static NOT_CORRECTED => 0

    /**
     * Native name: WPD_COLOR_CORRECTED_STATUS_CORRECTED
     * @type {Integer (Int32)}
     */
    static CORRECTED => 1

    /**
     * Native name: WPD_COLOR_CORRECTED_STATUS_SHOULD_NOT_BE_CORRECTED
     * @type {Integer (Int32)}
     */
    static SHOULD_NOT_BE_CORRECTED => 2
}
