#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-rendering-information-profile-entry-types
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE_OBJECT => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE_RESOURCE => 1
}
