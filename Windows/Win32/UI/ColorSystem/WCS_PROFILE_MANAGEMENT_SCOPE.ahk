#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the scope of a profile management operation, such as associating a profile with a device.
 * @see https://learn.microsoft.com/windows/win32/api/icm/ne-icm-wcs_profile_management_scope
 * @namespace Windows.Win32.UI.ColorSystem
 */
class WCS_PROFILE_MANAGEMENT_SCOPE extends Win32Enum {

    /**
     * Indicates that the profile management operation affects all users.
     * Native name: WCS_PROFILE_MANAGEMENT_SCOPE_SYSTEM_WIDE
     * @type {Integer (Int32)}
     */
    static SYSTEM_WIDE => 0

    /**
     * Indicates that the profile management operation affects only the current user.
     * Native name: WCS_PROFILE_MANAGEMENT_SCOPE_CURRENT_USER
     * @type {Integer (Int32)}
     */
    static CURRENT_USER => 1
}
