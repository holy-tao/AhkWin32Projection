#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes property information for a delegate request.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_delegate_request_property_id
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_DELEGATE_REQUEST_PROPERTY_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This property is reserved.
     * @type {Integer (Int32)}
     */
    static DelegateRequestReservedProperty => 0

    /**
     * Specifies the property that provides the target url to which a delegated request should be delivered.
     * @type {Integer (Int32)}
     */
    static DelegateRequestDelegateUrlProperty => 1
}
