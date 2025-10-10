#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of log data.
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_log_data_type
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_LOG_DATA_TYPE{

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_log_fields_data">HTTP_LOG_FIELDS_DATA</a> structure is used for logging a request. This structure is passed to an <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a> or <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendresponseentitybody">HttpSendResponseEntityBody</a> call.
     * @type {Integer (Int32)}
     */
    static HttpLogDataTypeFields => 0
}
