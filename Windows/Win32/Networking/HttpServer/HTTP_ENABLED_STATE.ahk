#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the state of a request queue, server session, or URL Group.
 * @remarks
 * The default state of a request queue is enabled. Typically this enumeration is used to temporarily disable a request queue.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_enabled_state
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_ENABLED_STATE extends Win32Enum{

    /**
     * The HTTP Server API object is enabled.
     * @type {Integer (Int32)}
     */
    static HttpEnabledStateActive => 0

    /**
     * The HTTP Server API object is disabled.
     * @type {Integer (Int32)}
     */
    static HttpEnabledStateInactive => 1
}
