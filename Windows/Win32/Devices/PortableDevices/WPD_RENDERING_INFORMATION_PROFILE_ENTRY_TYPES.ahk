#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_RENDERING\_INFORMATION\_PROFILE\_ENTRY\_TYPES enumeration type indicates whether the rendering information profile entry corresponds to an Object or a Resource.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-rendering-information-profile-entry-types
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPES extends Win32Enum {

    /**
     * Native name: WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE_OBJECT
     * @type {Integer (Int32)}
     */
    static TYPE_OBJECT => 0

    /**
     * Native name: WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE_RESOURCE
     * @type {Integer (Int32)}
     */
    static TYPE_RESOURCE => 1
}
