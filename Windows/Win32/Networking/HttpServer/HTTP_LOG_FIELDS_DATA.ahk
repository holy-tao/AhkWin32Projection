#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_LOG_DATA.ahk

/**
 * Used to pass the fields that are logged for an HTTP response when WC3 logging is enabled.
 * @remarks
 * 
  * The <b>HTTP_LOG_FIELDS_DATA</b> structure is an optional parameter (pLogData) in the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendresponseentitybody">HttpSendResponseEntityBody</a> and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a> functions starting with the HTTP version 2.0 API. The <b>HTTP_LOG_FIELDS_DATA</b> structure specifies which fields are logged in the response.
  * 
  * Unless this structure is passed, the response will not be logged, even when the server logging property is set on a URL group or  a server session. Requests will not be logged unless the application passes the <b>HTTP_LOG_FIELDS_DATA</b> structure with each response and the logging property is set on the server session or URL Group. Most of the fields in the <b>HTTP_LOG_FIELDS_DATA</b> structure can be initialized from the corresponding field in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure, however, some of the log fields are only known to the application; for example, Win32Status and SubStatus. This structure enables applications to alter the fields that are logged. The application passes a <b>NULL</b> pointer and a zero length for the corresponding member to disable logging for that field.
  * 
  *  Applications must provide the <b>HTTP_LOG_FIELDS_DATA</b> structure with the last send call.  If a response is sent with a single call to <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a>, the log data must be provided in this call. If the response is sent over multiple send calls, the data must be provided with the last call to <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendresponseentitybody">HttpSendResponseEntityBody</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_log_fields_data
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_LOG_FIELDS_DATA extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Initialize this member to the <b>HttpLogDataTypeFields</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_log_data_type">HTTP_LOG_DATA_TYPE</a> enumeration.
     * @type {HTTP_LOG_DATA}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := HTTP_LOG_DATA(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * The size, in bytes, of the user name member.
     * @type {Integer}
     */
    UserNameLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The size, in bytes, of the URI stem member.
     * @type {Integer}
     */
    UriStemLength {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The size, in bytes, of the client IP address member.
     * @type {Integer}
     */
    ClientIpLength {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The size, in bytes, of the server name member.
     * @type {Integer}
     */
    ServerNameLength {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * 
     * @type {Integer}
     */
    ServiceNameLength {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * The size, in bytes, of the server IP address member.
     * @type {Integer}
     */
    ServerIpLength {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * The size, in bytes, of the HTTP method member.
     * @type {Integer}
     */
    MethodLength {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The size, in bytes, of the URI query member.
     * @type {Integer}
     */
    UriQueryLength {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * The size, in bytes, of the host name member.
     * @type {Integer}
     */
    HostLength {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * The size, in bytes, of the user agent member.
     * @type {Integer}
     */
    UserAgentLength {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * The size, in bytes, of the cookie member.
     * @type {Integer}
     */
    CookieLength {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * The size, in bytes, of the referrer member.
     * @type {Integer}
     */
    ReferrerLength {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * The name of the  user.
     * @type {Pointer<Char>}
     */
    UserName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The URI stem.
     * @type {Pointer<Char>}
     */
    UriStem {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The IP address of the client.
     * @type {Pointer<Byte>}
     */
    ClientIp {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The name of the server.
     * @type {Pointer<Byte>}
     */
    ServerName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The name of the service.
     * @type {Pointer<Byte>}
     */
    ServiceName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The IP address of the server.
     * @type {Pointer<Byte>}
     */
    ServerIp {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The HTTP method.
     * @type {Pointer<Byte>}
     */
    Method {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The URI query.
     * @type {Pointer<Byte>}
     */
    UriQuery {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The host information from the request.
     * @type {Pointer<Byte>}
     */
    Host {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * The user agent name.
     * @type {Pointer<Byte>}
     */
    UserAgent {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * The cookie provided by the application.
     * @type {Pointer<Byte>}
     */
    Cookie {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * The referrer.
     * @type {Pointer<Byte>}
     */
    Referrer {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * The port for the server.
     * @type {Integer}
     */
    ServerPort {
        get => NumGet(this, 128, "ushort")
        set => NumPut("ushort", value, this, 128)
    }

    /**
     * The protocol status.
     * @type {Integer}
     */
    ProtocolStatus {
        get => NumGet(this, 130, "ushort")
        set => NumPut("ushort", value, this, 130)
    }

    /**
     * The win32 status.
     * @type {Integer}
     */
    Win32Status {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * The method number.
     * @type {Integer}
     */
    MethodNum {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * The sub status.
     * @type {Integer}
     */
    SubStatus {
        get => NumGet(this, 140, "ushort")
        set => NumPut("ushort", value, this, 140)
    }
}
