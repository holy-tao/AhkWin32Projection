#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Security association (SA) role for Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) Main Mode or Quick Mode negotiations.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_sa_role
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_SA_ROLE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
