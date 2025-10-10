#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the WS-SecureConversation specification version to be used with message security and mixed-mode security.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_secure_conversation_version
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURE_CONVERSATION_VERSION{

    /**
     * WS-SecureConversation with the specification URI of http://schemas.xmlsoap.org/ws/2005/02/sc
     * @type {Integer (Int32)}
     */
    static WS_SECURE_CONVERSATION_VERSION_FEBRUARY_2005 => 1

    /**
     * WS-SecureConversation 1.3 with the specification URI of http://docs.oasis-open.org/ws-sx/ws-secureconversation/200512
     * @type {Integer (Int32)}
     */
    static WS_SECURE_CONVERSATION_VERSION_1_3 => 2
}
