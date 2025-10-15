#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_LOG_DATA.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk

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
     * @type {PWSTR}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := PWSTR(this.ptr + 32)
            return this.__UserName
        }
    }

    /**
     * The URI stem.
     * @type {PWSTR}
     */
    UriStem{
        get {
            if(!this.HasProp("__UriStem"))
                this.__UriStem := PWSTR(this.ptr + 40)
            return this.__UriStem
        }
    }

    /**
     * The IP address of the client.
     * @type {PSTR}
     */
    ClientIp{
        get {
            if(!this.HasProp("__ClientIp"))
                this.__ClientIp := PSTR(this.ptr + 48)
            return this.__ClientIp
        }
    }

    /**
     * The name of the server.
     * @type {PSTR}
     */
    ServerName{
        get {
            if(!this.HasProp("__ServerName"))
                this.__ServerName := PSTR(this.ptr + 56)
            return this.__ServerName
        }
    }

    /**
     * The name of the service.
     * @type {PSTR}
     */
    ServiceName{
        get {
            if(!this.HasProp("__ServiceName"))
                this.__ServiceName := PSTR(this.ptr + 64)
            return this.__ServiceName
        }
    }

    /**
     * The IP address of the server.
     * @type {PSTR}
     */
    ServerIp{
        get {
            if(!this.HasProp("__ServerIp"))
                this.__ServerIp := PSTR(this.ptr + 72)
            return this.__ServerIp
        }
    }

    /**
     * The HTTP method.
     * @type {PSTR}
     */
    Method{
        get {
            if(!this.HasProp("__Method"))
                this.__Method := PSTR(this.ptr + 80)
            return this.__Method
        }
    }

    /**
     * The URI query.
     * @type {PSTR}
     */
    UriQuery{
        get {
            if(!this.HasProp("__UriQuery"))
                this.__UriQuery := PSTR(this.ptr + 88)
            return this.__UriQuery
        }
    }

    /**
     * The host information from the request.
     * @type {PSTR}
     */
    Host{
        get {
            if(!this.HasProp("__Host"))
                this.__Host := PSTR(this.ptr + 96)
            return this.__Host
        }
    }

    /**
     * The user agent name.
     * @type {PSTR}
     */
    UserAgent{
        get {
            if(!this.HasProp("__UserAgent"))
                this.__UserAgent := PSTR(this.ptr + 104)
            return this.__UserAgent
        }
    }

    /**
     * The cookie provided by the application.
     * @type {PSTR}
     */
    Cookie{
        get {
            if(!this.HasProp("__Cookie"))
                this.__Cookie := PSTR(this.ptr + 112)
            return this.__Cookie
        }
    }

    /**
     * The referrer.
     * @type {PSTR}
     */
    Referrer{
        get {
            if(!this.HasProp("__Referrer"))
                this.__Referrer := PSTR(this.ptr + 120)
            return this.__Referrer
        }
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
