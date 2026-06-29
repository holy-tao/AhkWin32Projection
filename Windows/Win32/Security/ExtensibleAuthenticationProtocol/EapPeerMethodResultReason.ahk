#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of results of an EAP authentication session returned by an EAP authenticator method to an EAP peer method.
 * @remarks
 * <b>EapPeerMethodResultReason</b> includes <a href="https://docs.microsoft.com/windows/desktop/NLA/portal">network awareness</a> information for wireless devices.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatoractiondefine/ne-eapauthenticatoractiondefine-eappeermethodresultreason
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapPeerMethodResultReason {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The success or failure of the authentication session is unknown or indeterminate.
     * @type {Integer (Int32)}
     */
    static EapPeerMethodResultUnknown => 1

    /**
     * Authentication was successful.
     * @type {Integer (Int32)}
     */
    static EapPeerMethodResultSuccess => 2

    /**
     * Authentication failed.
     * @type {Integer (Int32)}
     */
    static EapPeerMethodResultFailure => 3
}
