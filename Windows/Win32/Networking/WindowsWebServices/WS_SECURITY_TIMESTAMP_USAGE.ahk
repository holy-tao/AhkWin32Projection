#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * With message security and mixed-mode security, this defines when a timestamp element should be generated and demanded in the WS-Security header.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_security_timestamp_usage
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_TIMESTAMP_USAGE extends Win32Enum{

    /**
     * Always generate a timestamp in each outgoing message and demand a
     * timestamp be present in each incoming message, whether those messages
     * are requests or replies.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_TIMESTAMP_USAGE_ALWAYS => 1

    /**
     * Do not use timestamps in requests or replies.  It is an error to
     * specify this value when a mixed-mode message signature is required in
     * the WS-Security header.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_TIMESTAMP_USAGE_NEVER => 2

    /**
     * Generate and demand timestamps in client to server request messages,
     * but not in server to client reply messages.  This value may be used in
     * mixed-mode security.
     * @type {Integer (Int32)}
     */
    static WS_SECURITY_TIMESTAMP_USAGE_REQUESTS_ONLY => 3
}
