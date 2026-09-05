#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_REQUEST_SIZING_TYPE extends Win32Enum {

    /**
     * Native name: HttpRequestSizingTypeTlsHandshakeLeg1ClientData
     * @type {Integer (Int32)}
     */
    static TlsHandshakeLeg1ClientData => 0

    /**
     * Native name: HttpRequestSizingTypeTlsHandshakeLeg1ServerData
     * @type {Integer (Int32)}
     */
    static TlsHandshakeLeg1ServerData => 1

    /**
     * Native name: HttpRequestSizingTypeTlsHandshakeLeg2ClientData
     * @type {Integer (Int32)}
     */
    static TlsHandshakeLeg2ClientData => 2

    /**
     * Native name: HttpRequestSizingTypeTlsHandshakeLeg2ServerData
     * @type {Integer (Int32)}
     */
    static TlsHandshakeLeg2ServerData => 3

    /**
     * Native name: HttpRequestSizingTypeHeaders
     * @type {Integer (Int32)}
     */
    static Headers => 4

    /**
     * Native name: HttpRequestSizingTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 5
}
