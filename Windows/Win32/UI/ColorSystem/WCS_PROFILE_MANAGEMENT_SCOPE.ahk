#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the scope of a profile management operation, such as associating a profile with a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/icm/ne-icm-wcs_profile_management_scope
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class WCS_PROFILE_MANAGEMENT_SCOPE{

    /**
     * Indicates that the profile management operation affects all users.
     * @type {Integer (Int32)}
     */
    static WCS_PROFILE_MANAGEMENT_SCOPE_SYSTEM_WIDE => 0

    /**
     * Indicates that the profile management operation affects only the current user.
     * @type {Integer (Int32)}
     */
    static WCS_PROFILE_MANAGEMENT_SCOPE_CURRENT_USER => 1
}
