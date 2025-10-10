#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the NTSAMPROPERTIES enumeration type specify properties related to the NT Security Accounts Manager (SAM).
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-ntsamproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class NTSAMPROPERTIES{

    /**
     * Specifies whether to allow NT LAN Manager (NTLM) authentication.
     * @type {Integer (Int32)}
     */
    static PROPERTY_NTSAM_ALLOW_LM_AUTHENTICATION => 1026
}
