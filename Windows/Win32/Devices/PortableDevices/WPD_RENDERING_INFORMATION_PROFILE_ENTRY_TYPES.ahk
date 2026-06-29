#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_RENDERING\_INFORMATION\_PROFILE\_ENTRY\_TYPES enumeration type indicates whether the rendering information profile entry corresponds to an Object or a Resource.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-rendering-information-profile-entry-types
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE_OBJECT => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_RENDERING_INFORMATION_PROFILE_ENTRY_TYPE_RESOURCE => 1
}
