#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Disable special diagnostics mode for IKE/Authip. This will prevent IKE/AuthIp
  * from accepting unauthenticated notifications from peer, or sending MS_STATUS 
  * notifications to peer.
 * @see https://learn.microsoft.com/windows/win32/api//content/iketypes/ns-iketypes-ikeext_policy0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_POLICY_FLAG extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_DISABLE_DIAGNOSTICS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_NO_MACHINE_LUID_VERIFY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_NO_IMPERSONATION_LUID_VERIFY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_ENABLE_OPTIONAL_DH => 8
}
