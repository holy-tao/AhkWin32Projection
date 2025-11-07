#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines how a message security binding attaches the security token corresponding to it to a message using WS-Security mechanisms.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_message_security_usage
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_MESSAGE_SECURITY_USAGE{

    /**
     * The security token obtained security binding is used for client
     * authentication, but not message protection.  Message protection should
     * be provided by a transport security binding or a message security
     * binding with symmetric or asymmetric usage.
     * @type {Integer (Int32)}
     */
    static WS_SUPPORTING_MESSAGE_SECURITY_USAGE => 1
}
