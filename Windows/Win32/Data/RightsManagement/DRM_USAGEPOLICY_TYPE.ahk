#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used with the DRMGetUsagePolicy and DRMSetUsagePolicy functions to specify a type of usage policy.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drm_usagepolicy_type
 * @namespace Windows.Win32.Data.RightsManagement
 */
class DRM_USAGEPOLICY_TYPE extends Win32Enum {

    /**
     * The usage policy is tied to an application name.
     * Native name: DRM_USAGEPOLICY_TYPE_BYNAME
     * @type {Integer (Int32)}
     */
    static BYNAME => 0

    /**
     * The usage policy is tied to an application's public key.
     * Native name: DRM_USAGEPOLICY_TYPE_BYPUBLICKEY
     * @type {Integer (Int32)}
     */
    static BYPUBLICKEY => 1

    /**
     * The usage policy is tied to a digest of an application.
     * Native name: DRM_USAGEPOLICY_TYPE_BYDIGEST
     * @type {Integer (Int32)}
     */
    static BYDIGEST => 2

    /**
     * The usage policy is tied to an operating system.
     * Native name: DRM_USAGEPOLICY_TYPE_OSEXCLUSION
     * @type {Integer (Int32)}
     */
    static OSEXCLUSION => 3
}
