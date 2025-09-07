#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags that specify the current redirection capabilities of a known folder. Used by IKnownFolder::GetRedirectionCapabilities.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirection_capabilities
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _KF_REDIRECTION_CAPABILITIES{

    /**
     * The folder can be redirected if any of the bits in the lower byte of the value are set but no DENY flag is set. DENY flags are found in the upper byte of the value.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_ALLOW_ALL => 255

    /**
     * The folder can be redirected. Currently, redirection exists for only common and user folders; fixed and virtual folders cannot be redirected.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_REDIRECTABLE => 1

    /**
     * Redirection is not allowed.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_DENY_ALL => 1048320

    /**
     * The folder cannot be redirected because it is already redirected by group policy.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_DENY_POLICY_REDIRECTED => 256

    /**
     * The folder cannot be redirected because the policy prohibits redirecting this folder.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_DENY_POLICY => 512

    /**
     * The folder cannot be redirected because the calling application does not have sufficient permissions.
     * @type {Integer (Int32)}
     */
    static KF_REDIRECTION_CAPABILITIES_DENY_PERMISSIONS => 1024
}
