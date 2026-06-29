#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * HTTP_SERVICE_BINDING_TYPE enumerated type specifies the string type for service names.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_service_binding_type
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_BINDING_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
