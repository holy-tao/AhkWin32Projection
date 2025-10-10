#Requires AutoHotkey v2.0.0 64-bit

/**
 * Server Hardening level.
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_authentication_hardening_levels
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_AUTHENTICATION_HARDENING_LEVELS{

    /**
     * Server is not hardened and operates without Channel Binding Token (CBT) support.
     * @type {Integer (Int32)}
     */
    static HttpAuthenticationHardeningLegacy => 0

    /**
     * Server is partially hardened.  Clients that support CBT are serviced appropriately.  Legacy clients are also serviced.
     * @type {Integer (Int32)}
     */
    static HttpAuthenticationHardeningMedium => 1

    /**
     * Server is hardened.  Only clients that supported CBT are serviced.
     * @type {Integer (Int32)}
     */
    static HttpAuthenticationHardeningStrict => 2
}
