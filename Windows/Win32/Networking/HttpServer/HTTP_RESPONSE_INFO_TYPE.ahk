#Requires AutoHotkey v2.0.0 64-bit

/**
 * The HTTP_RESPONSE_INFO_TYPE enumeration defines the type of information contained in the HTTP_RESPONSE_INFO structure.This enumeration is used in the HTTP_RESPONSE_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_response_info_type
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_RESPONSE_INFO_TYPE{

    /**
     * The response information type is authentication.
 * 
 * The <b>pInfo</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_response_info">HTTP_RESPONSE_INFO</a> structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_multiple_known_headers">HTTP_MULTIPLE_KNOWN_HEADERS</a> structure.
     * @type {Integer (Int32)}
     */
    static HttpResponseInfoTypeMultipleKnownHeaders => 0

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static HttpResponseInfoTypeAuthenticationProperty => 1

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_qos_setting_info">HTTP_QOS_SETTING_INFO</a> structure that contains information about a QOS setting.
     * @type {Integer (Int32)}
     */
    static HttpResponseInfoTypeQoSProperty => 2

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_channel_bind_info">HTTP_CHANNEL_BIND_INFO</a> structure that contains information on the channel binding token.
     * @type {Integer (Int32)}
     */
    static HttpResponseInfoTypeChannelBind => 3
}
