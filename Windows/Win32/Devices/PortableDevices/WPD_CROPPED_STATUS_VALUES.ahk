#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_CROPPED\_STATUS\_VALUES enumeration type describes the cropping status of an image.
 * @remarks
 * Indicates the cropped status of an image. This enumeration is used by the [WPD\_IMAGE\_CROPPED\_STATUS](image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-cropped-status-values
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_CROPPED_STATUS_VALUES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CROPPED_STATUS_NOT_CROPPED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CROPPED_STATUS_CROPPED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CROPPED_STATUS_SHOULD_NOT_BE_CROPPED => 2
}
