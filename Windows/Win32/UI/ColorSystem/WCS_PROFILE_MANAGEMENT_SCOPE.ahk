#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the scope of a profile management operation, such as associating a profile with a device.
 * @see https://learn.microsoft.com/windows/win32/api/icm/ne-icm-wcs_profile_management_scope
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct WCS_PROFILE_MANAGEMENT_SCOPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
