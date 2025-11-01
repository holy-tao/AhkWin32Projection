#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-color-corrected-status-values
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_COLOR_CORRECTED_STATUS_VALUES{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COLOR_CORRECTED_STATUS_NOT_CORRECTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COLOR_CORRECTED_STATUS_CORRECTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_COLOR_CORRECTED_STATUS_SHOULD_NOT_BE_CORRECTED => 2
}
