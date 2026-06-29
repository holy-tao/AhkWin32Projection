#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the required integrity and confidentiality levels for sent and received messages.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_protection_level
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_PROTECTION_LEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No signing or encryption.
     * @type {Integer (Int32)}
     */
    static WS_PROTECTION_LEVEL_NONE => 1

    /**
     * Only signing.
     * @type {Integer (Int32)}
     */
    static WS_PROTECTION_LEVEL_SIGN => 2

    /**
     * Signing and encryption.
     * @type {Integer (Int32)}
     */
    static WS_PROTECTION_LEVEL_SIGN_AND_ENCRYPT => 3
}
