#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates to the authenticator method the amount of time to wait for user input after the packet is sent. The timeout value can be set to none.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatortypes/ne-eapauthenticatortypes-eap_authenticator_send_timeout
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_AUTHENTICATOR_SEND_TIMEOUT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Sends the packet and never times out; the user can enter a response at any time.
     * @type {Integer (Int32)}
     */
    static EAP_AUTHENTICATOR_SEND_TIMEOUT_NONE => 0

    /**
     * Sends the packet and waits for a standard period of time for a response.
     * @type {Integer (Int32)}
     */
    static EAP_AUTHENTICATOR_SEND_TIMEOUT_BASIC => 1

    /**
     * Sends the packet and waits for a response for a longer period of time to allow for an interactive session.
     * @type {Integer (Int32)}
     */
    static EAP_AUTHENTICATOR_SEND_TIMEOUT_INTERACTIVE => 2
}
