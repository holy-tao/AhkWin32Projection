#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the DRMGetUsagePolicy and DRMSetUsagePolicy functions to specify a type of usage policy.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drm_usagepolicy_type
 * @namespace Windows.Win32.Data.RightsManagement
 */
export default struct DRM_USAGEPOLICY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The usage policy is tied to an application name.
     * @type {Integer (Int32)}
     */
    static DRM_USAGEPOLICY_TYPE_BYNAME => 0

    /**
     * The usage policy is tied to an application's public key.
     * @type {Integer (Int32)}
     */
    static DRM_USAGEPOLICY_TYPE_BYPUBLICKEY => 1

    /**
     * The usage policy is tied to a digest of an application.
     * @type {Integer (Int32)}
     */
    static DRM_USAGEPOLICY_TYPE_BYDIGEST => 2

    /**
     * The usage policy is tied to an operating system.
     * @type {Integer (Int32)}
     */
    static DRM_USAGEPOLICY_TYPE_OSEXCLUSION => 3
}
