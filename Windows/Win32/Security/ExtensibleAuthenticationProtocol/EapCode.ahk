#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of EAP packet types.
 * @see https://learn.microsoft.com/windows/win32/api/eapmethodtypes/ne-eapmethodtypes-eapcode
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EapCode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The lowest possible value for an EAP packet type code.
     * @type {Integer (Int32)}
     */
    static EapCodeMinimum => 1

    /**
     * A request packet sent by the authenticator to the supplicant.
     * @type {Integer (Int32)}
     */
    static EapCodeRequest => 1

    /**
     * A response packet sent by the supplicant to the authenticator.
     * @type {Integer (Int32)}
     */
    static EapCodeResponse => 2

    /**
     * A successful authentication attempt.
     * @type {Integer (Int32)}
     */
    static EapCodeSuccess => 3

    /**
     * A failed authentication attempt.
     * @type {Integer (Int32)}
     */
    static EapCodeFailure => 4

    /**
     * The highest possible value for an EAP packet type code.
     * @type {Integer (Int32)}
     */
    static EapCodeMaximum => 4
}
