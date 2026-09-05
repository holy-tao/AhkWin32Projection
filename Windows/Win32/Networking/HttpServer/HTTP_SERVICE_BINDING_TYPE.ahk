#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HTTP_SERVICE_BINDING_TYPE enumerated type specifies the string type for service names.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_service_binding_type
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_SERVICE_BINDING_TYPE extends Win32Enum {

    /**
     * No type.
     * Native name: HttpServiceBindingTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Unicode.
     * Native name: HttpServiceBindingTypeW
     * @type {Integer (Int32)}
     */
    static TypeW => 1

    /**
     * ASCII
     * Native name: HttpServiceBindingTypeA
     * @type {Integer (Int32)}
     */
    static TypeA => 2
}
