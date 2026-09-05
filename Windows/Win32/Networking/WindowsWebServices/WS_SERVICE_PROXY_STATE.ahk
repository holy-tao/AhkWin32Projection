#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The state of the service proxy.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_service_proxy_state
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_SERVICE_PROXY_STATE extends Win32Enum {

    /**
     * Native name: WS_SERVICE_PROXY_STATE_CREATED
     * @type {Integer (Int32)}
     */
    static CREATED => 0

    /**
     * Native name: WS_SERVICE_PROXY_STATE_OPENING
     * @type {Integer (Int32)}
     */
    static OPENING => 1

    /**
     * Native name: WS_SERVICE_PROXY_STATE_OPEN
     * @type {Integer (Int32)}
     */
    static OPEN => 2

    /**
     * Native name: WS_SERVICE_PROXY_STATE_CLOSING
     * @type {Integer (Int32)}
     */
    static CLOSING => 3

    /**
     * Native name: WS_SERVICE_PROXY_STATE_CLOSED
     * @type {Integer (Int32)}
     */
    static CLOSED => 4

    /**
     * Native name: WS_SERVICE_PROXY_STATE_FAULTED
     * @type {Integer (Int32)}
     */
    static FAULTED => 5
}
