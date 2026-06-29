#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of possible reasons that describe the results returned by an EAP method to a supplicant.
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeermethodresultreason
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapHostPeerMethodResultReason {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Authentication was successful.
     * @type {Integer (Int32)}
     */
    static EapHostPeerMethodResultAltSuccessReceived => 1

    /**
     * The method timed out waiting for a response.
     * @type {Integer (Int32)}
     */
    static EapHostPeerMethodResultTimeout => 2

    /**
     * The  authentication process was completely normally.
     * @type {Integer (Int32)}
     */
    static EapHostPeerMethodResultFromMethod => 3
}
