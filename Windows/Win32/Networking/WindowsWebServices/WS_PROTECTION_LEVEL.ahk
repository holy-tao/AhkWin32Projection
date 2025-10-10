#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the required integrity and confidentiality levels for sent and received messages.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_protection_level
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_PROTECTION_LEVEL{

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
