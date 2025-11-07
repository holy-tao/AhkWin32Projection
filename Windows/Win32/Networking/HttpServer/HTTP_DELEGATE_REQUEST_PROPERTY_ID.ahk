#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes property information for a delegate request.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_delegate_request_property_id
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_DELEGATE_REQUEST_PROPERTY_ID{

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
