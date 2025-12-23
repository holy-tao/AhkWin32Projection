#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Security association (SA) role for Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) Main Mode or Quick Mode negotiations.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_sa_role
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_SA_ROLE extends Win32Enum{

    /**
     * SA is the initiator.
     * @type {Integer (Int32)}
     */
    static IKEEXT_SA_ROLE_INITIATOR => 0

    /**
     * SA is the responder.
     * @type {Integer (Int32)}
     */
    static IKEEXT_SA_ROLE_RESPONDER => 1

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_SA_ROLE_MAX => 2
}
