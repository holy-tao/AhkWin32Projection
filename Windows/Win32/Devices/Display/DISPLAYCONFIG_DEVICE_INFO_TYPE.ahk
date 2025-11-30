#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DISPLAYCONFIG_DEVICE_INFO_TYPE enumeration specifies the type of display device info to configure or obtain through the DisplayConfigSetDeviceInfo or DisplayConfigGetDeviceInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ne-wingdi-displayconfig_device_info_type
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_DEVICE_INFO_TYPE extends Win32Enum{

    /**
     * Specifies the source name of the display device. If the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a> function is successful, <b>DisplayConfigGetDeviceInfo</b> returns the source name in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_source_device_name">DISPLAYCONFIG_SOURCE_DEVICE_NAME</a> structure.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME => 1

    /**
     * Specifies information about the monitor. If the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a> function is successful, <b>DisplayConfigGetDeviceInfo</b> returns info about the monitor in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_target_device_name">DISPLAYCONFIG_TARGET_DEVICE_NAME</a> structure.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_NAME => 2

    /**
     * Specifies information about the preferred mode of a monitor. If the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a> function is successful, <b>DisplayConfigGetDeviceInfo</b> returns info about the preferred mode of a monitor in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_target_preferred_mode">DISPLAYCONFIG_TARGET_PREFERRED_MODE</a> structure.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_PREFERRED_MODE => 3

    /**
     * Specifies the graphics adapter name. If the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a> function is successful, <b>DisplayConfigGetDeviceInfo</b> returns the adapter name in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_adapter_name">DISPLAYCONFIG_ADAPTER_NAME</a> structure.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_GET_ADAPTER_NAME => 4

    /**
     * Specifies how to set the monitor. If the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfigsetdeviceinfo">DisplayConfigSetDeviceInfo</a> function is successful, <b>DisplayConfigSetDeviceInfo</b> uses info in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_set_target_persistence">DISPLAYCONFIG_SET_TARGET_PERSISTENCE</a> structure to force the output in a boot-persistent manner.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_SET_TARGET_PERSISTENCE => 5

    /**
     * Specifies how to set the base output technology for a given target ID. If the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a> function is successful, <b>DisplayConfigGetDeviceInfo</b> returns base output technology info in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_target_base_type">DISPLAYCONFIG_TARGET_BASE_TYPE</a> structure.
     * 
     * Supported by WDDM 1.3 and later user-mode display drivers running on Windows 8.1 and later.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_BASE_TYPE => 6

    /**
     * Specifies the state of virtual mode support. If the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a> function is successful, <b>DisplayConfigGetDeviceInfo</b> returns virtual mode support information in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_support_virtual_resolution">DISPLAYCONFIG_SUPPORT_VIRTUAL_RESOLUTION</a> structure. Supported starting in Windows 10.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_GET_SUPPORT_VIRTUAL_RESOLUTION => 7

    /**
     * Specifies how to set the state of virtual mode support. If the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfigsetdeviceinfo">DisplayConfigGetDeviceInfo</a> function is successful, <b>DisplayConfigGetDeviceInfo</b> uses info in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_support_virtual_resolution">DISPLAYCONFIG_SUPPORT_VIRTUAL_RESOLUTION</a> structure to change the state of virtual mode support. Supported starting in Windows 10.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_SET_SUPPORT_VIRTUAL_RESOLUTION => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_GET_ADVANCED_COLOR_INFO => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_SET_ADVANCED_COLOR_STATE => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_GET_SDR_WHITE_LEVEL => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_GET_MONITOR_SPECIALIZATION => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_SET_MONITOR_SPECIALIZATION => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_SET_RESERVED1 => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_GET_ADVANCED_COLOR_INFO_2 => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_SET_HDR_STATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_DEVICE_INFO_SET_WCG_STATE => 17
}
