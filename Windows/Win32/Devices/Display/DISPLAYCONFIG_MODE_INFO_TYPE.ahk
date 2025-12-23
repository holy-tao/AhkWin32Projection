#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DISPLAYCONFIG_MODE_INFO_TYPE enumeration specifies that the information that is contained within the DISPLAYCONFIG_MODE_INFO structure is either source or target mode.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ne-wingdi-displayconfig_mode_info_type
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_MODE_INFO_TYPE extends Win32Enum{

    /**
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_mode_info">DISPLAYCONFIG_MODE_INFO</a> structure contains source mode information.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_MODE_INFO_TYPE_SOURCE => 1

    /**
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_mode_info">DISPLAYCONFIG_MODE_INFO</a> structure contains target mode information.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_MODE_INFO_TYPE_TARGET => 2

    /**
     * Indicates that the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_mode_info">DISPLAYCONFIG_MODE_INFO</a> structure contains a valid <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_desktop_image_info">DISPLAYCONFIG_DESKTOP_IMAGE_INFO</a> structure. Supported starting in Windows 10.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_MODE_INFO_TYPE_DESKTOP_IMAGE => 3
}
