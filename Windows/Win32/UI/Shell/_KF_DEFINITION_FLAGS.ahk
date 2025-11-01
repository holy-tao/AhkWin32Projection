#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_definition_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _KF_DEFINITION_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static KFDF_LOCAL_REDIRECT_ONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static KFDF_ROAMABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static KFDF_PRECREATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static KFDF_STREAM => 16

    /**
     * @type {Integer (Int32)}
     */
    static KFDF_PUBLISHEXPANDEDPATH => 32

    /**
     * @type {Integer (Int32)}
     */
    static KFDF_NO_REDIRECT_UI => 64
}
