#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates to the authenticator method the amount of time to wait for user input after the packet is sent. The timeout value can be set to none.
 * @see https://learn.microsoft.com/windows/win32/api/eapauthenticatortypes/ne-eapauthenticatortypes-eap_authenticator_send_timeout
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_AUTHENTICATOR_SEND_TIMEOUT extends Win32Enum{

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
