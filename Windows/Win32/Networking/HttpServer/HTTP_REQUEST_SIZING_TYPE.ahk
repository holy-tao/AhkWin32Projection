#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_REQUEST_SIZING_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeTlsHandshakeLeg1ClientData => 0

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeTlsHandshakeLeg1ServerData => 1

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeTlsHandshakeLeg2ClientData => 2

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeTlsHandshakeLeg2ServerData => 3

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeHeaders => 4

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeMax => 5
}
