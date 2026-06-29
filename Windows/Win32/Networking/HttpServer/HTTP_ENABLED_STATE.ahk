#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the state of a request queue, server session, or URL Group.
 * @remarks
 * The default state of a request queue is enabled. Typically this enumeration is used to temporarily disable a request queue.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_enabled_state
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_ENABLED_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
