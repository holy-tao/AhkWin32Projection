#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines which set of actions to use when negotiating security tokens using WS-Trust.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_request_security_token_action
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_REQUEST_SECURITY_TOKEN_ACTION extends Win32Enum{

    /**
     * Use the "request" action defined in WS-Trust.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_ACTION_ISSUE => 1

    /**
     * Use the "request" action defined in WS-SecureConversation.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_ACTION_NEW_CONTEXT => 2

    /**
     * Use the "renew" action defined in WS-SecureConversation. Requires <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_request_security_token_property_id">WS_REQUEST_SECURITY_TOKEN_PROPERTY_EXISTING_TOKEN</a>.
     * @type {Integer (Int32)}
     */
    static WS_REQUEST_SECURITY_TOKEN_ACTION_RENEW_CONTEXT => 3
}
