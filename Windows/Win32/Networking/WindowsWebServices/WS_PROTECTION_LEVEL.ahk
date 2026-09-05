#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the required integrity and confidentiality levels for sent and received messages.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_protection_level
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_PROTECTION_LEVEL extends Win32Enum {

    /**
     * No signing or encryption.
     * Native name: WS_PROTECTION_LEVEL_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 1

    /**
     * Only signing.
     * Native name: WS_PROTECTION_LEVEL_SIGN
     * @type {Integer (Int32)}
     */
    static SIGN => 2

    /**
     * Signing and encryption.
     * Native name: WS_PROTECTION_LEVEL_SIGN_AND_ENCRYPT
     * @type {Integer (Int32)}
     */
    static SIGN_AND_ENCRYPT => 3
}
