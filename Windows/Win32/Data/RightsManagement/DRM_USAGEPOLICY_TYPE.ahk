#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used with the DRMGetUsagePolicy and DRMSetUsagePolicy functions to specify a type of usage policy.
 * @see https://docs.microsoft.com/windows/win32/api//msdrmdefs/ne-msdrmdefs-drm_usagepolicy_type
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRM_USAGEPOLICY_TYPE{

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
