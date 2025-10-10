#Requires AutoHotkey v2.0.0 64-bit

/**
 * HTTP_SERVICE_BINDING_TYPE enumerated type specifies the string type for service names.
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_service_binding_type
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_BINDING_TYPE{

    /**
     * No type.
     * @type {Integer (Int32)}
     */
    static HttpServiceBindingTypeNone => 0

    /**
     * Unicode.
     * @type {Integer (Int32)}
     */
    static HttpServiceBindingTypeW => 1

    /**
     * ASCII
     * @type {Integer (Int32)}
     */
    static HttpServiceBindingTypeA => 2
}
