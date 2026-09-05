#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Security association (SA) role for Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) Main Mode or Quick Mode negotiations.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_sa_role
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_SA_ROLE extends Win32Enum {

    /**
     * SA is the initiator.
     * Native name: IKEEXT_SA_ROLE_INITIATOR
     * @type {Integer (Int32)}
     */
    static INITIATOR => 0

    /**
     * SA is the responder.
     * Native name: IKEEXT_SA_ROLE_RESPONDER
     * @type {Integer (Int32)}
     */
    static RESPONDER => 1

    /**
     * Maximum value for testing purposes.
     * Native name: IKEEXT_SA_ROLE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
