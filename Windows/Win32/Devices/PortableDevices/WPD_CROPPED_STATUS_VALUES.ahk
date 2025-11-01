#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-cropped-status-values
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_CROPPED_STATUS_VALUES{

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
