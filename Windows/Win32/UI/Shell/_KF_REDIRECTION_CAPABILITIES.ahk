#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirection_capabilities
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _KF_REDIRECTION_CAPABILITIES{

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_ALLOW_ALL => 255

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_REDIRECTABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_DENY_ALL => 1048320

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_DENY_POLICY_REDIRECTED => 256

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_DENY_POLICY => 512

    /**
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_DENY_PERMISSIONS => 1024
}
