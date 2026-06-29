#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_VERB.ahk" { HTTP_VERB }
#Import ".\HTTP_LOG_DATA_TYPE.ahk" { HTTP_LOG_DATA_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\HTTP_LOG_DATA.ahk" { HTTP_LOG_DATA }

/**
 * Used to pass the fields that are logged for an HTTP response when WC3 logging is enabled.
 * @remarks
 * The <b>HTTP_LOG_FIELDS_DATA</b> structure is an optional parameter (pLogData) in the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendresponseentitybody">HttpSendResponseEntityBody</a> and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a> functions starting with the HTTP version 2.0 API. The <b>HTTP_LOG_FIELDS_DATA</b> structure specifies which fields are logged in the response.
 * 
 * Unless this structure is passed, the response will not be logged, even when the server logging property is set on a URL group or  a server session. Requests will not be logged unless the application passes the <b>HTTP_LOG_FIELDS_DATA</b> structure with each response and the logging property is set on the server session or URL Group. Most of the fields in the <b>HTTP_LOG_FIELDS_DATA</b> structure can be initialized from the corresponding field in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure, however, some of the log fields are only known to the application; for example, Win32Status and SubStatus. This structure enables applications to alter the fields that are logged. The application passes a <b>NULL</b> pointer and a zero length for the corresponding member to disable logging for that field.
 * 
 *  Applications must provide the <b>HTTP_LOG_FIELDS_DATA</b> structure with the last send call.  If a response is sent with a single call to <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a>, the log data must be provided in this call. If the response is sent over multiple send calls, the data must be provided with the last call to <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendresponseentitybody">HttpSendResponseEntityBody</a>.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_log_fields_data
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_LOG_FIELDS_DATA {
    #StructPack 8

    /**
     * Initialize this member to the <b>HttpLogDataTypeFields</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_log_data_type">HTTP_LOG_DATA_TYPE</a> enumeration.
     */
    Base : HTTP_LOG_DATA

    /**
     * The size, in bytes, of the user name member.
     */
    UserNameLength : UInt16

    /**
     * The size, in bytes, of the URI stem member.
     */
    UriStemLength : UInt16

    /**
     * The size, in bytes, of the client IP address member.
     */
    ClientIpLength : UInt16

    /**
     * The size, in bytes, of the server name member.
     */
    ServerNameLength : UInt16

    ServiceNameLength : UInt16

    /**
     * The size, in bytes, of the server IP address member.
     */
    ServerIpLength : UInt16

    /**
     * The size, in bytes, of the HTTP method member.
     */
    MethodLength : UInt16

    /**
     * The size, in bytes, of the URI query member.
     */
    UriQueryLength : UInt16

    /**
     * The size, in bytes, of the host name member.
     */
    HostLength : UInt16

    /**
     * The size, in bytes, of the user agent member.
     */
    UserAgentLength : UInt16

    /**
     * The size, in bytes, of the cookie member.
     */
    CookieLength : UInt16

    /**
     * The size, in bytes, of the referrer member.
     */
    ReferrerLength : UInt16

    /**
     * The name of the  user.
     */
    UserName : PWSTR

    /**
     * The URI stem.
     */
    UriStem : PWSTR

    /**
     * The IP address of the client.
     */
    ClientIp : PSTR

    /**
     * The name of the server.
     */
    ServerName : PSTR

    /**
     * The name of the service.
     */
    ServiceName : PSTR

    /**
     * The IP address of the server.
     */
    ServerIp : PSTR

    /**
     * The HTTP method.
     */
    Method : PSTR

    /**
     * The URI query.
     */
    UriQuery : PSTR

    /**
     * The host information from the request.
     */
    Host : PSTR

    /**
     * The user agent name.
     */
    UserAgent : PSTR

    /**
     * The cookie provided by the application.
     */
    Cookie : PSTR

    /**
     * The referrer.
     */
    Referrer : PSTR

    /**
     * The port for the server.
     */
    ServerPort : UInt16

    /**
     * The protocol status.
     */
    ProtocolStatus : UInt16

    /**
     * The win32 status.
     */
    Win32Status : UInt32

    /**
     * The method number.
     */
    MethodNum : HTTP_VERB

    /**
     * The sub status.
     */
    SubStatus : UInt16

}
