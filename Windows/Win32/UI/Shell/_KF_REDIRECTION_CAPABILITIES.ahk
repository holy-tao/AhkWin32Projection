#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags that specify the current redirection capabilities of a known folder. Used by IKnownFolder::GetRedirectionCapabilities.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirection_capabilities
 * @namespace Windows.Win32.UI.Shell
 */
class _KF_REDIRECTION_CAPABILITIES extends Win32Enum {

    /**
     * The folder can be redirected if any of the bits in the lower byte of the value are set but no DENY flag is set. DENY flags are found in the upper byte of the value.
     * Native name: KF_REDIRECTION_CAPABILITIES_ALLOW_ALL
     * @type {Integer (Int32)}
     */
    static ALLOW_ALL => 255

    /**
     * The folder can be redirected. Currently, redirection exists for only common and user folders; fixed and virtual folders cannot be redirected.
     * Native name: KF_REDIRECTION_CAPABILITIES_REDIRECTABLE
     * @type {Integer (Int32)}
     */
    static REDIRECTABLE => 1

    /**
     * Redirection is not allowed.
     * Native name: KF_REDIRECTION_CAPABILITIES_DENY_ALL
     * @type {Integer (Int32)}
     */
    static DENY_ALL => 1048320

    /**
     * The folder cannot be redirected because it is already redirected by group policy.
     * Native name: KF_REDIRECTION_CAPABILITIES_DENY_POLICY_REDIRECTED
     * @type {Integer (Int32)}
     */
    static DENY_POLICY_REDIRECTED => 256

    /**
     * The folder cannot be redirected because the policy prohibits redirecting this folder.
     * Native name: KF_REDIRECTION_CAPABILITIES_DENY_POLICY
     * @type {Integer (Int32)}
     */
    static DENY_POLICY => 512

    /**
     * The folder cannot be redirected because the calling application does not have sufficient permissions.
     * Native name: KF_REDIRECTION_CAPABILITIES_DENY_PERMISSIONS
     * @type {Integer (Int32)}
     */
    static DENY_PERMISSIONS => 1024
}
