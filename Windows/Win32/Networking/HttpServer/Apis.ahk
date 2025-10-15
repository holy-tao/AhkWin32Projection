#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HttpServer {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_DEMAND_CBT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_MAX_SERVER_QUEUE_LENGTH => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_MIN_SERVER_QUEUE_LENGTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_AUTH_ENABLE_BASIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_AUTH_ENABLE_DIGEST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_AUTH_ENABLE_NTLM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_AUTH_ENABLE_NEGOTIATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_AUTH_ENABLE_KERBEROS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_AUTH_EX_FLAG_ENABLE_KERBEROS_CREDENTIAL_CACHING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_AUTH_EX_FLAG_CAPTURE_CREDENTIAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_CHANNEL_BIND_PROXY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_CHANNEL_BIND_PROXY_COHOSTING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_CHANNEL_BIND_NO_SERVICE_NAME_CHECK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_CHANNEL_BIND_DOTLESS_SERVICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_CHANNEL_BIND_SECURE_CHANNEL_TOKEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_CHANNEL_BIND_CLIENT_SERVICE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_DATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_TIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_CLIENT_IP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_USER_NAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_SITE_NAME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_COMPUTER_NAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_SERVER_IP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_METHOD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_URI_STEM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_URI_QUERY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_STATUS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_WIN32_STATUS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_BYTES_SENT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_BYTES_RECV => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_TIME_TAKEN => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_SERVER_PORT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_USER_AGENT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_COOKIE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_REFERER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_VERSION => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_HOST => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_SUB_STATUS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_STREAM_ID => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_STREAM_ID_EX => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_TRANSPORT_TYPE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_CLIENT_PORT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_URI => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_SITE_ID => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_REASON => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_QUEUE_NAME => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_CORRELATION_ID => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOG_FIELD_FAULT_CODE => 2147483648

    /**
     * @type {Integer (UInt64)}
     */
    static HTTP_LOG_FIELD_EXT_FAULT_CODE_EXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOGGING_FLAG_LOCAL_TIME_ROLLOVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOGGING_FLAG_USE_UTF8_CONVERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOGGING_FLAG_LOG_ERRORS_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_LOGGING_FLAG_LOG_SUCCESS_ONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_CREATE_REQUEST_QUEUE_FLAG_DELEGATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_RECEIVE_REQUEST_ENTITY_BODY_FLAG_FILL_BUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SEND_RESPONSE_FLAG_DISCONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SEND_RESPONSE_FLAG_MORE_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SEND_RESPONSE_FLAG_BUFFER_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SEND_RESPONSE_FLAG_ENABLE_NAGLING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SEND_RESPONSE_FLAG_PROCESS_RANGES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SEND_RESPONSE_FLAG_OPAQUE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SEND_RESPONSE_FLAG_GOAWAY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SEND_RESPONSE_FLAG_AUTOMATIC_CHUNKING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_FLUSH_RESPONSE_FLAG_RECURSIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_URL_FLAG_REMOVE_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_RECEIVE_SECURE_CHANNEL_TOKEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_RECEIVE_FULL_CHAIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_SIZING_INFO_FLAG_TCP_FAST_OPEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_SIZING_INFO_FLAG_TLS_SESSION_RESUMPTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_SIZING_INFO_FLAG_TLS_FALSE_START => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_SIZING_INFO_FLAG_FIRST_REQUEST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_AUTH_FLAG_TOKEN_FOR_CACHED_CRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_FLAG_MORE_ENTITY_BODY_EXISTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_FLAG_IP_ROUTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_FLAG_HTTP2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_FLAG_HTTP3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_FLAG_FAST_FORWARDING_ALLOWED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_FLAG_FAST_FORWARDING_RESPONSE_ALLOWED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_RESPONSE_FLAG_MULTIPLE_ENCODINGS_AVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_RESPONSE_FLAG_MORE_ENTITY_BODY_EXISTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_RESPONSE_INFO_FLAGS_PRESERVE_ORDER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SSL_CERT_SHA_HASH_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SSL_CERT_STORE_NAME_LENGTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_USE_DS_MAPPER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_NEGOTIATE_CLIENT_CERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_NO_RAW_FILTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_REJECT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_HTTP2 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_QUIC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_TLS13 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_OCSP_STAPLING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_TOKEN_BINDING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_LOG_EXTENDED_EVENTS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_LEGACY_TLS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_SESSION_TICKET => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_TLS12 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_CLIENT_CORRELATION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_DISABLE_SESSION_ID => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_SERVICE_CONFIG_SSL_FLAG_ENABLE_CACHE_CLIENT_HELLO => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_PROPERTY_SNI_HOST_MAX_LENGTH => 255

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_PROPERTY_SNI_FLAG_SNI_USED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_REQUEST_PROPERTY_SNI_FLAG_NO_SNI => 2

    /**
     * @type {String}
     */
    static HTTP_VERSION => "HTTP/1.0"
;@endregion Constants

;@region Methods
    /**
     * The HttpInitialize function initializes the HTTP Server API driver, starts it, if it has not already been started, and allocates data structures for the calling application to support response-queue creation and other operations.
     * @param {HTTPAPI_VERSION} Version HTTP version. This parameter is an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-httpapi_version">HTTPAPI_VERSION</a> structure. For the current version, declare an instance of the structure and set it to the pre-defined value HTTPAPI_VERSION_1 before passing it to 
     * <b>HttpInitialize</b>.
     * @param {Integer} Flags 
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Flags</i> parameter contains an unsupported value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpinitialize
     * @since windows6.0.6000
     */
    static HttpInitialize(Version, Flags) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("HTTPAPI.dll\HttpInitialize", "ptr", Version, "uint", Flags, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Cleans up resources used by the HTTP Server API to process calls by an application.
     * @param {Integer} Flags 
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpterminate
     * @since windows6.0.6000
     */
    static HttpTerminate(Flags) {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("HTTPAPI.dll\HttpTerminate", "uint", Flags, "ptr", pReserved, "uint")
        return result
    }

    /**
     * Creates an HTTP request queue for the calling application and returns a handle to it.
     * @param {Pointer<HANDLE>} RequestQueueHandle A pointer to a variable that receives a handle to the request queue.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DLL_INIT_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application did not call 
     * <a href="/windows/desktop/api/http/nf-http-httpinitialize">HttpInitialize</a> before calling this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpcreatehttphandle
     * @since windows6.0.6000
     */
    static HttpCreateHttpHandle(RequestQueueHandle) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("HTTPAPI.dll\HttpCreateHttpHandle", "ptr", RequestQueueHandle, "uint", Reserved, "uint")
        return result
    }

    /**
     * Creates a new request queue or opens an existing request queue.
     * @param {HTTPAPI_VERSION} Version An HTTPAPI_VERSION structure indicating the request queue version. For  version 2.0, declare an instance of the structure and set it to the predefined value HTTPAPI_VERSION_2 before passing it to <b>HttpCreateRequestQueue</b>.
     * 
     * The version must be 2.0; <b>HttpCreateRequestQueue</b> does not support  version 1.0 request queues.
     * @param {PWSTR} Name The name of the request queue. The length, in bytes, cannot exceed MAX_PATH.
     * 
     *   The optional name parameter allows other processes to access the request queue by name.
     * @param {Pointer<SECURITY_ATTRIBUTES>} SecurityAttributes A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that contains the  access permissions for the request queue.
     * 
     * This parameter must be <b>NULL</b> when opening an existing request queue.
     * @param {Integer} Flags The flags parameter defines the scope of the request queue. This parameter can be one or more of the followng:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER"></a><a id="http_create_request_queue_flag_controller"></a><dl>
     * <dt><b>HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the request queue created using this flag cannot be used to perform I/O operations. This flag can be set only when the request queue  handle is created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING"></a><a id="http_create_request_queue_flag_open_existing"></a><dl>
     * <dt><b>HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The <b>HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING</b> flag allows applications to open an existing request queue by name and retrieve the request 	queue handle. The <i>pName</i> parameter  must contain a valid request queue name; it cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<HANDLE>} RequestQueueHandle A pointer to a variable that receives a handle to the request queue.  This parameter must contain a valid pointer; it cannot be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Version</i> parameter contains an invalid version.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The length, in bytes, of the request queue name cannot exceed MAX_PATH.
     * 
     * The <i>pSecurityAttributes</i> parameter must be <b>NULL</b> when opening an existing request queue.
     * 
     * The <b>HTTP_CREATE_REQUEST_QUEUE_FLAG_CONTROLLER</b> can only be set when the request queue is created.
     * 
     * The <b>HTTP_CREATE_REQUEST_QUEUE_FLAG_OPEN_EXISTING</b> can only be set when the application has permission to open an existing request queue. In this case, the <i>pReqQueueHandle</i> parameter must be a valid pointer, and the <i>pName</i> parameter must contain a valid request queue name; it cannot be <b>NULL</b>.
     * 
     * The <i>pReqQueueHandle</i> parameter returned by <a href="/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a>  is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pName</i> parameter conflicts with an existing request queue  that contains an identical name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling process does not have a permission to open the request queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DLL_INIT_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application has not called <a href="/windows/desktop/api/http/nf-http-httpinitialize">HttpInitialize</a> prior to calling <a href="/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpcreaterequestqueue
     * @since windows6.0.6000
     */
    static HttpCreateRequestQueue(Version, Name, SecurityAttributes, Flags, RequestQueueHandle) {
        Name := Name is String ? StrPtr(Name) : Name

        result := DllCall("HTTPAPI.dll\HttpCreateRequestQueue", "ptr", Version, "ptr", Name, "ptr", SecurityAttributes, "uint", Flags, "ptr", RequestQueueHandle, "uint")
        return result
    }

    /**
     * Closes the handle to the specified request queue created by HttpCreateRequestQueue.
     * @param {HANDLE} RequestQueueHandle The handle to the request queue that is closed. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application does not have permission to close the request queue. Only the application that created the request queue can close it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpcloserequestqueue
     * @since windows6.0.6000
     */
    static HttpCloseRequestQueue(RequestQueueHandle) {
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpCloseRequestQueue", "ptr", RequestQueueHandle, "uint")
        return result
    }

    /**
     * Sets a new property or modifies an existing property on the request queue identified by the specified handle.
     * @param {HANDLE} RequestQueueHandle The handle to the request queue on which the property is set. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * @param {Integer} Property A member of the  <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_server_property">HTTP_SERVER_PROPERTY</a> enumeration describing the property type that is set. This must be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Property</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServer503VerbosityProperty"></a><a id="httpserver503verbosityproperty"></a><a id="HTTPSERVER503VERBOSITYPROPERTY"></a><dl>
     * <dt><b>HttpServer503VerbosityProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modifies or sets the current verbosity level of 503 responses generated for the request queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerQueueLengthProperty"></a><a id="httpserverqueuelengthproperty"></a><a id="HTTPSERVERQUEUELENGTHPROPERTY"></a><dl>
     * <dt><b>HttpServerQueueLengthProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modifies or sets the limit on the number of outstanding requests in the request queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerStateProperty"></a><a id="httpserverstateproperty"></a><a id="HTTPSERVERSTATEPROPERTY"></a><dl>
     * <dt><b>HttpServerStateProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modifies or sets the  state of the request queue. The state must be either active or inactive.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} PropertyInformation A pointer to the buffer that contains the property information.
     * 
     * <i>pPropertyInformation</i> points to one of the following property information types based on the property that is set.<table>
     * <tr>
     * <th>Property</th>
     * <th> Configuration Type</th>
     * </tr>
     * <tr>
     * <td>HttpServerStateProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_enabled_state">HTTP_ENABLED_STATE</a> enumeration</td>
     * </tr>
     * <tr>
     * <td>HttpServerQueueLengthProperty</td>
     * <td>ULONG</td>
     * </tr>
     * <tr>
     * <td>HttpServer503VerbosityProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_503_response_verbosity">HTTP_503_RESPONSE_VERBOSITY</a> enumeration</td>
     * </tr>
     * </table>
     * @param {Integer} PropertyInformationLength The length, in bytes, of the buffer pointed to by the <i>pPropertyInformation</i> parameter.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Reserved</i> parameter is not zero or the  <i>pReserved</i> parameter is not <b>NULL</b>.
     * 
     * The property type specified in the <i>Property</i> parameter is not supported for request queues.
     * 
     * The <i>pPropertyInformation</i> parameter is <b>NULL</b>.
     * 
     * The  <i>PropertyInformationLength</i> parameter is zero.
     * 
     * The application does not have permission to set properties on the request queue. Only the application that created the request queue can set the properties.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the request queue is an HTTP version 1.0 handle. Property management is only supported on HTTP version 2.0 or later request queues.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpsetrequestqueueproperty
     * @since windows6.0.6000
     */
    static HttpSetRequestQueueProperty(RequestQueueHandle, Property, PropertyInformation, PropertyInformationLength) {
        static Reserved1 := 0, Reserved2 := 0 ;Reserved parameters must always be NULL

        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpSetRequestQueueProperty", "ptr", RequestQueueHandle, "int", Property, "ptr", PropertyInformation, "uint", PropertyInformationLength, "uint", Reserved1, "ptr", Reserved2, "uint")
        return result
    }

    /**
     * Queries a property of the request queue identified by the specified handle.
     * @param {HANDLE} RequestQueueHandle 
     * @param {Integer} Property A member of the  <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_server_property">HTTP_SERVER_PROPERTY</a> enumeration that describes the property type that is set. This can be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Property</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServer503VerbosityProperty"></a><a id="httpserver503verbosityproperty"></a><a id="HTTPSERVER503VERBOSITYPROPERTY"></a><dl>
     * <dt><b>HttpServer503VerbosityProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the current verbosity level of 503 responses generated for the requests queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerQueueLengthProperty"></a><a id="httpserverqueuelengthproperty"></a><a id="HTTPSERVERQUEUELENGTHPROPERTY"></a><dl>
     * <dt><b>HttpServerQueueLengthProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the limit on the number of outstanding requests in the request queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerStateProperty"></a><a id="httpserverstateproperty"></a><a id="HTTPSERVERSTATEPROPERTY"></a><dl>
     * <dt><b>HttpServerStateProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the current state of the request queue. The state must be either active or inactive.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} PropertyInformation A pointer to the buffer that receives the property information.
     * 
     * <i>pPropertyInformation</i> points to one of the following property information values based on the property that is set.<table>
     * <tr>
     * <th>Property</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>HttpServerStateProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_enabled_state">HTTP_ENABLED_STATE</a> (enumeration member)</td>
     * </tr>
     * <tr>
     * <td>HttpServerQueueLengthProperty</td>
     * <td>ULONG</td>
     * </tr>
     * <tr>
     * <td>HttpServer503VerbosityProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_503_response_verbosity">HTTP_503_RESPONSE_VERBOSITY</a> (enumeration member)</td>
     * </tr>
     * </table>
     * @param {Integer} PropertyInformationLength The length, in bytes, of the buffer pointed to by the <i>pPropertyInformation</i> parameter.
     * @param {Pointer<UInt32>} ReturnLength The number, in bytes, returned in the  <i>pPropertyInformation</i> buffer if not <b>NULL</b>.
     * 
     * If the output buffer is too small, the call fails with a return value of <b>ERROR_MORE_DATA</b>. The value pointed to by <i>pReturnLength</i> can be used to determine the minimum length of the buffer required for the call to succeed.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>Reserved</i> parameter is not zero or the  <i>pReserved</i> parameter is not <b>NULL</b>.
     * 
     * The property type specified in the <i>Property</i> parameter is not supported on request queues.
     * 
     * The <i>pPropertyInformation</i> parameter is <b>NULL</b>.
     * 
     * The  <i>PropertyInformationLength</i> parameter is zero.
     * 
     * The application does not have permission to open the request queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size, in bytes, of the buffer pointed to by the  <i>pPropertyInformation</i> parameter is too small to receive the property information. Call the function again with a buffer at least as large as the size pointed to by <i>pReturnLength</i> on exit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the request queue is an HTTP version 1.0 handle. Property management is only supported for HTTP version 2.0 and later request queues.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpqueryrequestqueueproperty
     * @since windows6.0.6000
     */
    static HttpQueryRequestQueueProperty(RequestQueueHandle, Property, PropertyInformation, PropertyInformationLength, ReturnLength) {
        static Reserved1 := 0, Reserved2 := 0 ;Reserved parameters must always be NULL

        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpQueryRequestQueueProperty", "ptr", RequestQueueHandle, "int", Property, "ptr", PropertyInformation, "uint", PropertyInformationLength, "uint", Reserved1, "uint*", ReturnLength, "ptr", Reserved2, "uint")
        return result
    }

    /**
     * Sets a new property or modifies an existing property on the specified request.
     * @param {HANDLE} RequestQueueHandle The handle to the request queue on which the request was received. A request queue is created and its handle returned by a call to the [HttpCreateRequestQueue](/windows/desktop/api/http/nf-http-httpcreaterequestqueue) function.
     * @param {Integer} Id The opaque ID of the request. This ID is located in the *RequestId* member of the [HTTP\_REQUEST](/windows/desktop/legacy/aa364545(v=vs.85)) structure returned by [HttpReceiveHttpRequest](/windows/win32/api/http/nf-http-httpreceivehttprequest).
     * @param {Integer} PropertyId A member of the [HTTP\_REQUEST\_PROPERTY](/windows/desktop/api/http/ne-http-http_request_property) enumeration describing the property type that is set. This must be one of the following:
     * 
     * | **Property** | **Meaning** |
     * | HttpRequestPropertyStreamError | Sets a stream error on the request. |
     * @param {Pointer} Input A pointer to the buffer that contains the property information.
     * 
     * It must point to one of the following property information types based on the property that is set.
     * 
     * | **Property** | **Configuration Type** |
     * | HttpRequestPropertyStreamError | [HTTP\_REQUEST\_PROPERTY\_STREAM\_ERROR](/windows/desktop/api/http/ne-http-http_request_property_stream_error) structure |
     * @param {Integer} InputPropertySize The length, in bytes, of the buffer pointed to by the *Input* parameter.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set *pOverlapped* to point to an [OVERLAPPED](/windows/desktop/api/minwinbase/ns-minwinbase-overlapped) structure; for synchronous calls, set it to **NULL**.
     * 
     * A synchronous call blocks until the operation is complete, whereas an asynchronous call immediately returns **ERROR\_IO\_PENDING** and the calling application then uses [GetOverlappedResult](/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult) or I/O completion ports to determine when the operation is completed. For more information about using [OVERLAPPED](/windows/desktop/api/minwinbase/ns-minwinbase-overlapped) structures for synchronization, see [Synchronization and Overlapped Input and Output](/windows/desktop/Sync/synchronization-and-overlapped-input-and-output).
     * @returns {Integer} If the function succeeds, it returns **ERROR\_SUCCESS**.
     * 
     * If the function fails, it returns a [system error code](/windows/desktop/Debug/system-error-codes).
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpsetrequestproperty
     */
    static HttpSetRequestProperty(RequestQueueHandle, Id, PropertyId, Input, InputPropertySize, Overlapped) {
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpSetRequestProperty", "ptr", RequestQueueHandle, "uint", Id, "int", PropertyId, "ptr", Input, "uint", InputPropertySize, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Stops queuing requests for the specified request queue process.
     * @param {HANDLE} RequestQueueHandle The handle to the request queue that is shut down. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ReqQueueHandle</i> parameter does not contain a valid request queue.
     * 
     * The application does not have permission to shut down the request queue.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpshutdownrequestqueue
     * @since windows6.0.6000
     */
    static HttpShutdownRequestQueue(RequestQueueHandle) {
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpShutdownRequestQueue", "ptr", RequestQueueHandle, "uint")
        return result
    }

    /**
     * The HttpReceiveClientCertificate function is used by a server application to retrieve a client SSL certificate or channel binding token (CBT).
     * @param {HANDLE} RequestQueueHandle A handle to the request queue with which the specified SSL client or CBT is associated. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {Integer} ConnectionId A value that identifies the connection to the client. This value is obtained from the <b>ConnectionId</b> element of an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure filled in by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceivehttprequest">HttpReceiveHttpRequest</a> function.
     * @param {Integer} Flags A value that modifies the behavior of the <b>HttpReceiveClientCertificate</b> function
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_RECEIVE_SECURE_CHANNEL_TOKEN"></a><a id="http_receive_secure_channel_token"></a><dl>
     * <dt><b>HTTP_RECEIVE_SECURE_CHANNEL_TOKEN</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSslClientCertInfo</i> parameter will be populated with CBT data.
     * 
     * This value is supported on Windows 7, Windows Server 2008 R2, and later. 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} SslClientCertInfo If the <i>Flags</i> parameter is 0, then this parameter points to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_ssl_client_cert_info">HTTP_SSL_CLIENT_CERT_INFO</a> structure into which the function writes the requested client certificate information. The buffer pointed to by the <i>pSslClientCertInfo</i> should be sufficiently large enough to hold the <b>HTTP_SSL_CLIENT_CERT_INFO</b> structure plus the value of the <b>CertEncodedSize</b> member of this structure.
     * 
     * If the <i>Flags</i> parameter is <b>HTTP_RECEIVE_SECURE_CHANNEL_TOKEN</b>, then this parameter points to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_channel_bind_status">HTTP_REQUEST_CHANNEL_BIND_STATUS</a> structure into which the function writes the requested CBT information. The buffer pointed to by the <i>pSslClientCertInfo</i> should be sufficiently large enough to hold the <b>HTTP_REQUEST_CHANNEL_BIND_STATUS</b>  structure plus the value of the <b>ChannelTokenSize</b> member of this structure.
     * @param {Integer} SslClientCertInfoSize The size, in bytes, of the buffer pointed to by the <i>pSslClientCertInfo</i> parameter.
     * @param {Pointer<UInt32>} BytesReceived An optional pointer to a variable that receives  the number of bytes to be written to the structure pointed to by <i>pSslClientCertInfo</i>. If not used, set it to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * When making an asynchronous call using <i>pOverlapped</i>, set <i>pBytesReceived</i> to <b>NULL</b>. Otherwise, when <i>pOverlapped</i> is set to <b>NULL</b>, <i>pBytesReceived</i> must contain a valid memory address, and not be set to <b>NULL</b>.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, or for synchronous calls, set it to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * A synchronous call blocks until the client certificate is retrieved, whereas an asynchronous call immediately returns <b>ERROR_IO_PENDING</b> and the calling application then uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> or I/O completion ports to determine when the operation is completed. For more information about using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structures for synchronization, see the section 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>.
     * @returns {Integer} <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NO_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function succeeded. 
     * 
     * All the data has been written into the buffer pointed to by the <i>pSslClientCertInfo</i> parameter. The  <i>NumberOfBytesTransferred</i> indicates how many bytes were written into the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function is being used asynchronously. The operation has been initiated and will complete later through normal overlapped I/O completion mechanisms.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pSslClientCertInfo</i> parameter is too small to receive the data and no data was written.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>pSslClientCertInfo</i> parameter is not large enough to receive all the data. Only the basic structure has been written and only partially populated.
     * 
     * When the <i>Flags</i> parameter is 0, the <a href="/windows/desktop/api/http/ns-http-http_ssl_client_cert_info">HTTP_SSL_CLIENT_CERT_INFO</a>structure has been written with the <b>CertEncodedSize</b> member populated. The caller should call the function again with a buffer that is at least the size, in bytes, of  the <b>HTTP_SSL_CLIENT_CERT_INFO</b> structure plus the value of the <b>CertEncodedSize</b> member.
     * 
     * When the <i>Flags</i> parameter is <b>HTTP_RECEIVE_SECURE_CHANNEL_TOKEN</b>, the <a href="/windows/desktop/api/http/ns-http-http_request_channel_bind_status">HTTP_REQUEST_CHANNEL_BIND_STATUS</a>  structure has been written with the <b>ChannelTokenSize</b> member populated. The caller should call the function again with a buffer that is at least the size, in bytes, of the <b>HTTP_REQUEST_CHANNEL_BIND_STATUS</b>  plus  the value of the <b>ChannelTokenSize</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function cannot find the client certificate or CBT.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in the <i>WinError.h</i> header file.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpreceiveclientcertificate
     * @since windows6.0.6000
     */
    static HttpReceiveClientCertificate(RequestQueueHandle, ConnectionId, Flags, SslClientCertInfo, SslClientCertInfoSize, BytesReceived, Overlapped) {
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpReceiveClientCertificate", "ptr", RequestQueueHandle, "uint", ConnectionId, "uint", Flags, "ptr", SslClientCertInfo, "uint", SslClientCertInfoSize, "uint*", BytesReceived, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Creates a server session for the specified version.
     * @param {HTTPAPI_VERSION} Version An HTTPAPI_VERSION structure that indicates the version of the server session. For  version 2.0, declare an instance of the structure and set it to the predefined value <b>HTTPAPI_VERSION_2</b> before passing it to <b>HttpCreateServerSession</b>.
     * 
     * The version must be 2.0; <b>HttpCreateServerSession</b> does not support  version 1.0 request queues.
     * @param {Pointer<UInt64>} ServerSessionId A pointer to the variable that receives the ID of the server session.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version passed is invalid or unsupported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pServerSessionId</i> parameter is null or the  <i>Reserved</i> is non zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpcreateserversession
     * @since windows6.0.6000
     */
    static HttpCreateServerSession(Version, ServerSessionId) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("HTTPAPI.dll\HttpCreateServerSession", "ptr", Version, "uint*", ServerSessionId, "uint", Reserved, "uint")
        return result
    }

    /**
     * Deletes the server session identified by the server session ID.
     * @param {Integer} ServerSessionId The ID of the server session that is closed.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>
     * 
     * If the function fails, it can return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Server Session does not exist.
     * 
     * The application does not have permission to close the server session. Only the application that created the server session can close the session.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpcloseserversession
     * @since windows6.0.6000
     */
    static HttpCloseServerSession(ServerSessionId) {
        result := DllCall("HTTPAPI.dll\HttpCloseServerSession", "uint", ServerSessionId, "uint")
        return result
    }

    /**
     * Queries a server property on the specified server session.
     * @param {Integer} ServerSessionId The server session for which the property setting is returned.
     * @param {Integer} Property A member of the  <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_server_property">HTTP_SERVER_PROPERTY</a> enumeration that describes the property type that is queried. This can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Property</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerStateProperty"></a><a id="httpserverstateproperty"></a><a id="HTTPSERVERSTATEPROPERTY"></a><dl>
     * <dt><b>HttpServerStateProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the current state of the server session.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerTimeoutsProperty"></a><a id="httpservertimeoutsproperty"></a><a id="HTTPSERVERTIMEOUTSPROPERTY"></a><dl>
     * <dt><b>HttpServerTimeoutsProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the server session connection timeout limits.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerQosProperty"></a><a id="httpserverqosproperty"></a><a id="HTTPSERVERQOSPROPERTY"></a><dl>
     * <dt><b>HttpServerQosProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the bandwidth throttling for the server session. By default, the HTTP Server API does not limit bandwidth. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerAuthenticationProperty"></a><a id="httpserverauthenticationproperty"></a><a id="HTTPSERVERAUTHENTICATIONPROPERTY"></a><dl>
     * <dt><b>HttpServerAuthenticationProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries kernel mode server-side authentication for the Basic, NTLM, Negotiate, and Digest authentication schemes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerChannelBindProperty"></a><a id="httpserverchannelbindproperty"></a><a id="HTTPSERVERCHANNELBINDPROPERTY"></a><dl>
     * <dt><b>HttpServerChannelBindProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the channel binding token (CBT) properties.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} PropertyInformation A pointer to the buffer that receives the property data.
     * 
     * <i>pPropertyInformation</i> points to one of the following property data structures based on the property that is set.<table>
     * <tr>
     * <th>Property</th>
     * <th>Structure</th>
     * </tr>
     * <tr>
     * <td>HttpServerStateProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_state_info">HTTP_STATE_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerQosProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_qos_setting_info">HTTP_QOS_SETTING_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerTimeoutsProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_timeout_limit_info">HTTP_TIMEOUT_LIMIT_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerAuthenticationProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_server_authentication_info">HTTP_SERVER_AUTHENTICATION_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerChannelBindProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_channel_bind_info">HTTP_CHANNEL_BIND_INFO</a>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} PropertyInformationLength The length, in bytes, of the buffer pointed to by the <i>pPropertyInformation</i> parameter.
     * @param {Pointer<UInt32>} ReturnLength The number, in  bytes, returned in the  <i>pPropertyInformation</i> buffer.
     * 
     * If the output buffer is too small, the call fails with a return value of <b>ERROR_MORE_DATA</b>. The value pointed to by <i>pReturnLength</i> can be used to determine the minimum length of the buffer required for the call to succeed.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property type specified in the <i>Property</i> parameter is not supported for server sessions.
     * 
     * The <i>ServerSessionId</i> parameter does not contain a valid server session.
     * 
     * The <i>pPropertyInformation</i> parameter is <b>NULL</b>.
     * 
     * The  <i>PropertyInformationLength</i> parameter is zero.
     * 
     * The application does not have permission to query the server session properties. Only the application that created the server session can query the properties.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size, in bytes, of the buffer pointed to by the  <i>pPropertyInformation</i> parameter is too small to receive the property data. On exit call the function again with a buffer at least as large as the size pointed to by <i>pReturnLength</i> on exit.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpqueryserversessionproperty
     * @since windows6.0.6000
     */
    static HttpQueryServerSessionProperty(ServerSessionId, Property, PropertyInformation, PropertyInformationLength, ReturnLength) {
        result := DllCall("HTTPAPI.dll\HttpQueryServerSessionProperty", "uint", ServerSessionId, "int", Property, "ptr", PropertyInformation, "uint", PropertyInformationLength, "uint*", ReturnLength, "uint")
        return result
    }

    /**
     * Sets a new server session property or modifies an existing property on the specified server session.
     * @param {Integer} ServerSessionId The server session for which the property is set.
     * @param {Integer} Property A member of the  <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_server_property">HTTP_SERVER_PROPERTY</a> enumeration that describes the property type that is set. This can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Property</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerStateProperty"></a><a id="httpserverstateproperty"></a><a id="HTTPSERVERSTATEPROPERTY"></a><dl>
     * <dt><b>HttpServerStateProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modifies or sets the state of the server session. The state can be either enabled or disabled; the default state is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerTimeoutsProperty"></a><a id="httpservertimeoutsproperty"></a><a id="HTTPSERVERTIMEOUTSPROPERTY"></a><dl>
     * <dt><b>HttpServerTimeoutsProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modifies or sets the server session connection timeout limits.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerQosProperty"></a><a id="httpserverqosproperty"></a><a id="HTTPSERVERQOSPROPERTY"></a><dl>
     * <dt><b>HttpServerQosProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modifies or sets the bandwidth throttling for the server session. By default, the HTTP Server API does not limit bandwidth. 
     * 
     * <div class="alert"><b>Note</b>  This value maps to the generic <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_qos_setting_info">HTTP_QOS_SETTING_INFO</a> structure with <b>QosType</b> set to <b>HttpQosSettingTypeBandwidth</b>. </div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerLoggingProperty"></a><a id="httpserverloggingproperty"></a><a id="HTTPSERVERLOGGINGPROPERTY"></a><dl>
     * <dt><b>HttpServerLoggingProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables or disables logging for the server session. This property sets only centralized W3C and centralized binary logging.  By default, logging is not enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerAuthenticationProperty"></a><a id="httpserverauthenticationproperty"></a><a id="HTTPSERVERAUTHENTICATIONPROPERTY"></a><dl>
     * <dt><b>HttpServerAuthenticationProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables kernel mode server side authentication for the Basic, NTLM, Negotiate, and Digest authentication schemes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerExtendedAuthenticationProperty"></a><a id="httpserverextendedauthenticationproperty"></a><a id="HTTPSERVEREXTENDEDAUTHENTICATIONPROPERTY"></a><dl>
     * <dt><b>HttpServerExtendedAuthenticationProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables kernel mode server side authentication for the Kerberos authentication scheme.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerChannelBindProperty_"></a><a id="httpserverchannelbindproperty_"></a><a id="HTTPSERVERCHANNELBINDPROPERTY_"></a><dl>
     * <dt><b>HttpServerChannelBindProperty </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables server side authentication that uses a channel binding token (CBT).
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} PropertyInformation A pointer to the buffer that contains the property data.
     * 
     * <i>pPropertyInformation</i> points to a property data structure, listed in the following table, based on the property that is set.<table>
     * <tr>
     * <th>Property</th>
     * <th>Structure</th>
     * </tr>
     * <tr>
     * <td>HttpServerStateProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_state_info">HTTP_STATE_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerLoggingProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_logging_info">HTTP_LOGGING_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerQosProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_qos_setting_info">HTTP_QOS_SETTING_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerTimeoutsProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_timeout_limit_info">HTTP_TIMEOUT_LIMIT_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerAuthenticationProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_server_authentication_info">HTTP_SERVER_AUTHENTICATION_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerExtendedAuthenticationProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_server_authentication_info">HTTP_SERVER_AUTHENTICATION_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerChannelBindProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_channel_bind_info">HTTP_CHANNEL_BIND_INFO</a>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} PropertyInformationLength The length, in bytes, of the buffer pointed to by the <i>pPropertyInformation</i> parameter.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property type specified in the <i>Property</i> parameter is not supported for server sessions.
     * 
     * The <i>pPropertyInformation</i> parameter is <b>NULL</b>.
     * 
     * The  <i>PropertyInformationLength</i> parameter is zero.
     * 
     * The <i>ServerSessionId</i> parameter does not contain a valid server session.
     * 
     * The application does not have permission to set the server session properties. Only the application that created the server session can set the properties.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpsetserversessionproperty
     * @since windows6.0.6000
     */
    static HttpSetServerSessionProperty(ServerSessionId, Property, PropertyInformation, PropertyInformationLength) {
        result := DllCall("HTTPAPI.dll\HttpSetServerSessionProperty", "uint", ServerSessionId, "int", Property, "ptr", PropertyInformation, "uint", PropertyInformationLength, "uint")
        return result
    }

    /**
     * Registers a given URL so that requests that match it are routed to a specified HTTP Server API request queue.
     * @param {HANDLE} RequestQueueHandle The handle to the request queue to which requests for the specified URL are to be routed. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {PWSTR} FullyQualifiedUrl A pointer to a Unicode string that contains a properly formed 
     * <a href="https://docs.microsoft.com/windows/desktop/Http/urlprefix-strings">UrlPrefix string</a> that identifies the URL to be registered.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have permission to register the URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DLL_INIT_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application did not call 
     * <a href="/windows/desktop/api/http/nf-http-httpinitialize">HttpInitialize</a> before calling this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified UrlPrefix conflicts with an existing registration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpaddurl
     * @since windows6.0.6000
     */
    static HttpAddUrl(RequestQueueHandle, FullyQualifiedUrl) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        FullyQualifiedUrl := FullyQualifiedUrl is String ? StrPtr(FullyQualifiedUrl) : FullyQualifiedUrl
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpAddUrl", "ptr", RequestQueueHandle, "ptr", FullyQualifiedUrl, "ptr", Reserved, "uint")
        return result
    }

    /**
     * Causes the system to stop routing requests that match a specified UrlPrefix string to a specified request queue.
     * @param {HANDLE} RequestQueueHandle The handle to the request queue from which the URL registration is to be removed. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {PWSTR} FullyQualifiedUrl A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/Http/urlprefix-strings">UrlPrefix string</a>  registered to the specified request queue. This string must be identical to the one passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpaddurl">HttpAddUrl</a> to register the UrlPrefix; even a nomenclature change in an IPv6 address is not accepted.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application does not have permission to remove the URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient resources to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified UrlPrefix could not be found in the registration database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpremoveurl
     * @since windows6.0.6000
     */
    static HttpRemoveUrl(RequestQueueHandle, FullyQualifiedUrl) {
        FullyQualifiedUrl := FullyQualifiedUrl is String ? StrPtr(FullyQualifiedUrl) : FullyQualifiedUrl
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpRemoveUrl", "ptr", RequestQueueHandle, "ptr", FullyQualifiedUrl, "uint")
        return result
    }

    /**
     * Creates a URL Group under the specified server session.
     * @param {Integer} ServerSessionId The identifier of the server session under which the URL Group is created.
     * @param {Pointer<UInt64>} pUrlGroupId A pointer to the variable that receives the ID of the URL Group.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ServerSessionId</i> parameter indicates  a non-existing Server Session.
     * 
     * The <i>pUrlGroupId</i> parameter is null.
     * 
     * The <i>Reserved</i> parameter is non-zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpcreateurlgroup
     * @since windows6.0.6000
     */
    static HttpCreateUrlGroup(ServerSessionId, pUrlGroupId) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("HTTPAPI.dll\HttpCreateUrlGroup", "uint", ServerSessionId, "uint*", pUrlGroupId, "uint", Reserved, "uint")
        return result
    }

    /**
     * Closes the URL Group identified by the URL Group ID.
     * @param {Integer} UrlGroupId The ID of the URL Group that is deleted.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ID of the URL Group does not exist.
     * 
     * The application does not have permission to close the URL Group. Only the application that created the URL Group can close the group.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpcloseurlgroup
     * @since windows6.0.6000
     */
    static HttpCloseUrlGroup(UrlGroupId) {
        result := DllCall("HTTPAPI.dll\HttpCloseUrlGroup", "uint", UrlGroupId, "uint")
        return result
    }

    /**
     * Adds the specified URL to the URL Group identified by the URL Group ID.
     * @param {Integer} UrlGroupId The group ID for the URL group to which requests for the specified URL are routed. The URL group is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreateurlgroup">HttpCreateUrlGroup</a> function.
     * @param {PWSTR} pFullyQualifiedUrl A pointer to a Unicode string that contains a properly formed <a href="https://docs.microsoft.com/windows/desktop/Http/urlprefix-strings">UrlPrefix String</a> that identifies the URL to be registered.
     * @param {Integer} UrlContext The context that is associated with the URL registered in this call. The URL context is returned in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure with every request received on the URL specified in the <i>pFullyQualifiedUrl</i> parameter.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>UrlGroupId</i> does not exist.
     * 
     *  The <i>Reserved</i> parameter is not zero.
     * 
     * The application does not have permission to add URLs to the Group. Only the application that created the URL Group can add URLs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling process does not have permission to register the URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified URL conflicts with an existing registration.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpaddurltourlgroup
     * @since windows6.0.6000
     */
    static HttpAddUrlToUrlGroup(UrlGroupId, pFullyQualifiedUrl, UrlContext) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        pFullyQualifiedUrl := pFullyQualifiedUrl is String ? StrPtr(pFullyQualifiedUrl) : pFullyQualifiedUrl

        result := DllCall("HTTPAPI.dll\HttpAddUrlToUrlGroup", "uint", UrlGroupId, "ptr", pFullyQualifiedUrl, "uint", UrlContext, "uint", Reserved, "uint")
        return result
    }

    /**
     * Removes the specified URL from the group identified by the URL Group ID.
     * @param {Integer} UrlGroupId The ID of the URL group from which the URL specified in <i>pFullyQualifiedUrl</i> is removed.
     * @param {PWSTR} pFullyQualifiedUrl A pointer to a Unicode string that contains a properly formed <a href="https://docs.microsoft.com/windows/desktop/Http/urlprefix-strings">UrlPrefix String</a> that identifies the URL to be removed.
     * 
     * When <b>HTTP_URL_FLAG_REMOVE_ALL</b> is passed in the <i>Flags</i> parameter, all of the existing URL registrations for the URL Group identified in <i>UrlGroupId</i> are removed from the group. In this case, <i>pFullyQualifiedUrl</i> must be <b>NULL</b>.
     * @param {Integer} Flags The URL flags qualifying the URL that is removed. This  can be one of the following flags:
     * 
     * <table>
     * <tr>
     * <th>URL Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_URL_FLAG_REMOVE_ALL"></a><a id="http_url_flag_remove_all"></a><dl>
     * <dt><b>HTTP_URL_FLAG_REMOVE_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Removes all of the URLs currently registered with the URL Group.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns NO_ERROR.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL Group does not exist.
     * 
     * The Flags parameter contains an invalid combination of flags.
     * 
     * The HTTP_URL_FLAG_REMOVE_ALL flag was set and the <i>pFullyQualifiedUrl</i> parameter was not set to <b>NULL</b>.
     * 
     * The application does not have permission to remove URLs from the Group. Only the application that created the URL Group can remove URLs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling process does not have permission to deregister the URL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified URL is not registered with the URL Group.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpremoveurlfromurlgroup
     * @since windows6.0.6000
     */
    static HttpRemoveUrlFromUrlGroup(UrlGroupId, pFullyQualifiedUrl, Flags) {
        pFullyQualifiedUrl := pFullyQualifiedUrl is String ? StrPtr(pFullyQualifiedUrl) : pFullyQualifiedUrl

        result := DllCall("HTTPAPI.dll\HttpRemoveUrlFromUrlGroup", "uint", UrlGroupId, "ptr", pFullyQualifiedUrl, "uint", Flags, "uint")
        return result
    }

    /**
     * Sets a new property or modifies an existing property on the specified URL Group.
     * @param {Integer} UrlGroupId The ID of the URL Group for which the property is set.
     * @param {Integer} Property A member of the  <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_server_property">HTTP_SERVER_PROPERTY</a> enumeration that describes the property type that is modified or set. This can be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Property</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerAuthenticationProperty"></a><a id="httpserverauthenticationproperty"></a><a id="HTTPSERVERAUTHENTICATIONPROPERTY"></a><dl>
     * <dt><b>HttpServerAuthenticationProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables server-side authentication for the URL Group using the Basic, NTLM, Negotiate, and Digest authentication schemes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerExtendedAuthenticationProperty"></a><a id="httpserverextendedauthenticationproperty"></a><a id="HTTPSERVEREXTENDEDAUTHENTICATIONPROPERTY"></a><dl>
     * <dt><b>HttpServerExtendedAuthenticationProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables server-side authentication for the URL Group using the Kerberos authentication scheme.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerQosProperty"></a><a id="httpserverqosproperty"></a><a id="HTTPSERVERQOSPROPERTY"></a><dl>
     * <dt><b>HttpServerQosProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value maps to the generic <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_qos_setting_info">HTTP_QOS_SETTING_INFO</a> structure with <b>QosType</b> set to either <b>HttpQosSettingTypeBandwidth</b> or  <b>HttpQosSettingTypeConnectionLimit</b>. If <b>HttpQosSettingTypeBandwidth</b>, modifies or sets the bandwidth throttling for the URL Group. If <b>HttpQosSettingTypeConnectionLimit</b>, modifies or sets the maximum number of outstanding connections served for a URL Group at any time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerBindingProperty"></a><a id="httpserverbindingproperty"></a><a id="HTTPSERVERBINDINGPROPERTY"></a><dl>
     * <dt><b>HttpServerBindingProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modifies or sets the URL Group association with a request queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerLoggingProperty"></a><a id="httpserverloggingproperty"></a><a id="HTTPSERVERLOGGINGPROPERTY"></a><dl>
     * <dt><b>HttpServerLoggingProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modifies or sets logging for the URL Group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerStateProperty"></a><a id="httpserverstateproperty"></a><a id="HTTPSERVERSTATEPROPERTY"></a><dl>
     * <dt><b>HttpServerStateProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modifies or sets the state of the URL Group. The state can be either enabled or disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerTimeoutsProperty"></a><a id="httpservertimeoutsproperty"></a><a id="HTTPSERVERTIMEOUTSPROPERTY"></a><dl>
     * <dt><b>HttpServerTimeoutsProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Modifies or sets the  connection timeout limits for the URL Group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerChannelBindProperty_"></a><a id="httpserverchannelbindproperty_"></a><a id="HTTPSERVERCHANNELBINDPROPERTY_"></a><dl>
     * <dt><b>HttpServerChannelBindProperty </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables server side authentication that uses a channel binding token (CBT).
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} PropertyInformation A pointer to the buffer that contains the property information.
     * 
     * <i>pPropertyInformation</i> points to one of the following property information structures based on the property that is set.<table>
     * <tr>
     * <th>Property</th>
     * <th>Structure</th>
     * </tr>
     * <tr>
     * <td>HttpServerAuthenticatonProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_server_authentication_info">HTTP_SERVER_AUTHENTICATION_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerExtendedAuthenticationProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_server_authentication_info">HTTP_SERVER_AUTHENTICATION_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerQosProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_qos_setting_info">HTTP_QOS_SETTING_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerBindingProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_binding_info">HTTP_BINDING_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerLoggingProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_logging_info">HTTP_LOGGING_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerStateProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_state_info">HTTP_STATE_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerTimeoutsProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_timeout_limit_info">HTTP_TIMEOUT_LIMIT_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerChannelBindProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_channel_bind_info">HTTP_CHANNEL_BIND_INFO</a>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} PropertyInformationLength The length, in bytes, of the buffer pointed to by the <i>pPropertyInformation</i> parameter.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property type specified in the <i>Property</i> parameter is not supported for URL Groups.
     * 
     * The <i>pPropertyInformation</i> parameter is <b>NULL</b>.
     * 
     * The  <i>PropertyInformationLength</i> parameter is zero.
     * 
     * The <i>UrlGroupId</i> parameter does not contain a valid server session.
     * 
     * The application does not have permission to set the URL Group properties. Only the application that created the URL Group can set the properties.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpseturlgroupproperty
     * @since windows6.0.6000
     */
    static HttpSetUrlGroupProperty(UrlGroupId, Property, PropertyInformation, PropertyInformationLength) {
        result := DllCall("HTTPAPI.dll\HttpSetUrlGroupProperty", "uint", UrlGroupId, "int", Property, "ptr", PropertyInformation, "uint", PropertyInformationLength, "uint")
        return result
    }

    /**
     * Queries a property on the specified URL Group.
     * @param {Integer} UrlGroupId The ID of the URL Group for which the property setting is returned.
     * @param {Integer} Property A member of the  <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_server_property">HTTP_SERVER_PROPERTY</a> enumeration that describes the property type that is queried. This can be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Property</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerAuthenticationProperty"></a><a id="httpserverauthenticationproperty"></a><a id="HTTPSERVERAUTHENTICATIONPROPERTY"></a><dl>
     * <dt><b>HttpServerAuthenticationProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the enabled server-side authentication schemes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerTimeoutsProperty"></a><a id="httpservertimeoutsproperty"></a><a id="HTTPSERVERTIMEOUTSPROPERTY"></a><dl>
     * <dt><b>HttpServerTimeoutsProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the URL Group connection timeout limits.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerStateProperty"></a><a id="httpserverstateproperty"></a><a id="HTTPSERVERSTATEPROPERTY"></a><dl>
     * <dt><b>HttpServerStateProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the current state of the URL Group. The state can be either enabled or disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerQosProperty"></a><a id="httpserverqosproperty"></a><a id="HTTPSERVERQOSPROPERTY"></a><dl>
     * <dt><b>HttpServerQosProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value maps to the generic <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_qos_setting_info">HTTP_QOS_SETTING_INFO</a> structure with <b>QosType</b> set to either <b>HttpQosSettingTypeBandwidth</b> or  <b>HttpQosSettingTypeConnectionLimit</b>. If <b>HttpQosSettingTypeBandwidth</b>, queries the bandwidth throttling for the URL Group. If <b>HttpQosSettingTypeConnectionLimit</b>, queries the maximum number of outstanding connections served for a URL group at any time.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServerChannelBindProperty"></a><a id="httpserverchannelbindproperty"></a><a id="HTTPSERVERCHANNELBINDPROPERTY"></a><dl>
     * <dt><b>HttpServerChannelBindProperty</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Queries the channel binding token (CBT) properties.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} PropertyInformation A pointer to the buffer that receives the property information.
     * 
     * <i>pPropertyInformation</i> points to one of the following property information structures based on the property that is queried.<table>
     * <tr>
     * <th>Property</th>
     * <th>Structure</th>
     * </tr>
     * <tr>
     * <td>HttpServerStateProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_state_info">HTTP_STATE_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerAuthenticationProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_server_authentication_info">HTTP_SERVER_AUTHENTICATION_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerQosProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_qos_setting_info">HTTP_QOS_SETTING_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerTimeoutsProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_timeout_limit_info">HTTP_TIMEOUT_LIMIT_INFO</a>
     * </td>
     * </tr>
     * <tr>
     * <td>HttpServerChannelBindProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_channel_bind_info">HTTP_CHANNEL_BIND_INFO</a>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} PropertyInformationLength The length, in bytes, of the buffer pointed to by the <i>pPropertyInformation</i> parameter.
     * @param {Pointer<UInt32>} ReturnLength The size, in bytes, returned in the  <i>pPropertyInformation</i> buffer.
     * 
     * If the output buffer is too small, the call fails with a return value of <b>ERROR_MORE_DATA</b>. The value pointed to by <i>pReturnLength</i> can be used to determine the minimum length of the buffer required for the call to succeed.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property type specified in the <i>Property</i> parameter is not supported for URL Groups.
     * 
     * The <i>UrlGroupId</i> parameter does not identify a valid server URL Group.
     * 
     * The <i>pPropertyInformation</i> parameter is <b>NULL</b>.
     * 
     * The  <i>PropertyInformationLength</i> parameter is zero.
     * 
     * The application does not have permission to query the URL Group properties. Only the application that created the URL Group can query the properties.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The size, in bytes, of the buffer pointed to by the  <i>pPropertyInformation</i> parameter is too small to receive the property information. Call the function again with a buffer at least as large as the size pointed to by <i>pReturnLength</i> on exit.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpqueryurlgroupproperty
     * @since windows6.0.6000
     */
    static HttpQueryUrlGroupProperty(UrlGroupId, Property, PropertyInformation, PropertyInformationLength, ReturnLength) {
        result := DllCall("HTTPAPI.dll\HttpQueryUrlGroupProperty", "uint", UrlGroupId, "int", Property, "ptr", PropertyInformation, "uint", PropertyInformationLength, "uint*", ReturnLength, "uint")
        return result
    }

    /**
     * Parses, analyzes, and normalizes a non-normalized Unicode or punycode URL so it is safe and valid to use in other HTTP functions.
     * @param {PWSTR} Url A pointer to a string that represents the non-normalized Unicode or punycode URL to prepare.
     * @param {Pointer<PWSTR>} PreparedUrl On successful output, a pointer to a string that represents the normalized URL.
     * 
     * <div class="alert"><b>Note</b>  Free <i>PreparedUrl</i> using <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapfree">HeapFree</a>.</div>
     * <div> </div>
     * @returns {Integer} If the function succeeds, it returns <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, it returns one of the following or a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpprepareurl
     * @since windows8.0
     */
    static HttpPrepareUrl(Url, PreparedUrl) {
        static Reserved := 0, Flags := 0 ;Reserved parameters must always be NULL

        Url := Url is String ? StrPtr(Url) : Url

        result := DllCall("HTTPAPI.dll\HttpPrepareUrl", "ptr", Reserved, "uint", Flags, "ptr", Url, "ptr", PreparedUrl, "uint")
        return result
    }

    /**
     * Retrieves the next available HTTP request from the specified request queue either synchronously or asynchronously.
     * @param {HANDLE} RequestQueueHandle A handle to the request queue from which to retrieve the next available request. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {Integer} RequestId On the first call to retrieve a request, this parameter should be <b>HTTP_NULL_ID</b>. Then, if more than one call is required to retrieve the entire request, 
     * <b>HttpReceiveHttpRequest</b> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceiverequestentitybody">HttpReceiveRequestEntityBody</a> can be called with <i>RequestID</i> set to the value returned in the <b>RequestId</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure pointed to by <i>pRequestBuffer</i>.
     * @param {Integer} Flags 
     * @param {Pointer} RequestBuffer A pointer to a buffer into which the function copies an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure and entity body for the HTTP request. <b>HTTP_REQUEST.RequestId</b> contains the identifier for this HTTP request, which the application can use in subsequent calls <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceiverequestentitybody">HttpReceiveRequestEntityBody</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendresponseentitybody">HttpSendResponseEntityBody</a>.
     * @param {Integer} RequestBufferLength Size, in bytes, of the  <i>pRequestBuffer</i> buffer.
     * @param {Pointer<UInt32>} BytesReturned Optional. A pointer to a variable that receives the size, in bytes, of the entity body, or of the remaining part of the entity body. 
     * 
     * 
     * 
     * 
     * When making an asynchronous call using <i>pOverlapped</i>, set <i>pBytesReceived</i> to <b>NULL</b>. Otherwise, when <i>pOverlapped</i> is set to <b>NULL</b>, <i>pBytesReceived</i> must contain a valid memory address, and not be set to <b>NULL</b>.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure; for synchronous calls, set it to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * A synchronous call blocks until a request has arrived in the specified queue and some or all of it has been retrieved, whereas an asynchronous call immediately returns <b>ERROR_IO_PENDING</b> and the calling application then uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> or I/O completion ports to determine when the operation is completed. For more information about using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structures for synchronization, see  
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function is being used asynchronously, a return value of <b>ERROR_IO_PENDING</b> indicates that the next request is not yet ready and will be retrieved later through normal overlapped I/O completion mechanisms.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters points to an invalid or unaligned memory buffer.  The <i>pRequestBuffer</i> parameter must point to a valid memory buffer with a memory alignment equal or greater to the memory alignment requirement for an <b>HTTP_REQUEST</b> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>RequestBufferLength</i> is greater than or equal to the size of the request header received, but is not as large as the combined size of the request structure and entity body. The buffer size required to read the remaining part of the entity body is returned in the <i>pBytesReceived</i> parameter if this is non-<b>NULL</b> and if the call is synchronous. Call the function again with a large enough buffer to retrieve all data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HANDLE_EOF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified request has already been completely retrieved; in this case, the value pointed to by <i>pBytesReceived</i> is not meaningful, and <i>pRequestBuffer</i> should not be examined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpreceivehttprequest
     * @since windows6.0.6000
     */
    static HttpReceiveHttpRequest(RequestQueueHandle, RequestId, Flags, RequestBuffer, RequestBufferLength, BytesReturned, Overlapped) {
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpReceiveHttpRequest", "ptr", RequestQueueHandle, "uint", RequestId, "uint", Flags, "ptr", RequestBuffer, "uint", RequestBufferLength, "uint*", BytesReturned, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Receives additional entity body data for a specified HTTP request.
     * @param {HANDLE} RequestQueueHandle The handle to the request queue from which to retrieve the specified entity body data. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {Integer} RequestId The identifier of the HTTP request that contains the retrieved entity body. This value is returned in the <b>RequestId</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceivehttprequest">HttpReceiveHttpRequest</a> function. This value cannot be <b>HTTP_NULL_ID</b>.
     * @param {Integer} Flags This parameter can be the following flag value. 
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>This parameter is reserved and must be zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_RECEIVE_REQUEST_ENTITY_BODY_FLAG_FILL_BUFFER"></a><a id="http_receive_request_entity_body_flag_fill_buffer"></a><dl>
     * <dt><b>HTTP_RECEIVE_REQUEST_ENTITY_BODY_FLAG_FILL_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the buffer will be filled with one or more  entity bodies, unless there are no remaining entity bodies to copy.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} EntityBuffer A pointer to a buffer that receives entity-body data.
     * @param {Integer} EntityBufferLength The size, in bytes, of the buffer pointed to by the <i>pBuffer</i> parameter.
     * @param {Pointer<UInt32>} BytesReturned Optional. A pointer to a variables that receives the size, in bytes, of the entity body data returned in the <i>pBuffer</i> buffer. 
     * 
     * 
     * 
     * 
     * When making an asynchronous call using <i>pOverlapped</i>, set <i>pBytesReceived</i> to <b>NULL</b>. Otherwise, when <i>pOverlapped</i> is set to <b>NULL</b>, <i>pBytesReceived</i> must contain a valid memory address, and not be set to <b>NULL</b>.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure; for synchronous calls, set it to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * A synchronous call blocks until the entity-body data has been retrieved, whereas an asynchronous call immediately returns <b>ERROR_IO_PENDING</b> and the calling application then uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> or I/O completion ports to determine when the operation is completed. For more information about using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structures for synchronization, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function is used asynchronously, a return value of <b>ERROR_IO_PENDING</b> indicates that the next request is not yet ready and is retrieved later through normal overlapped I/O completion mechanisms.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters are in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_HANDLE_EOF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified entity body has already been completely retrieved; in this case, the value pointed to by <i>pBytesReceived</i> is not meaningful, and <i>pBuffer</i> should not be examined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DLL_INIT_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling application did not call 
     * <a href="/windows/desktop/api/http/nf-http-httpinitialize">HttpInitialize</a> before calling this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpreceiverequestentitybody
     * @since windows6.0.6000
     */
    static HttpReceiveRequestEntityBody(RequestQueueHandle, RequestId, Flags, EntityBuffer, EntityBufferLength, BytesReturned, Overlapped) {
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpReceiveRequestEntityBody", "ptr", RequestQueueHandle, "uint", RequestId, "uint", Flags, "ptr", EntityBuffer, "uint", EntityBufferLength, "uint*", BytesReturned, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Sends an HTTP response to the specified HTTP request.
     * @param {HANDLE} RequestQueueHandle A handle to the request queue from which the specified request was retrieved. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {Integer} RequestId An identifier of the HTTP request to which this response corresponds. This value is returned in the <b>RequestId</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceivehttprequest">HttpReceiveHttpRequest</a> function. This value cannot be <b>HTTP_NULL_ID</b>.
     * @param {Integer} Flags This parameter can be a combination of some of the following flag values.  Those that are mutually exclusive are marked accordingly.
     * 
     * <table>
     * <tr>
     * <th>Flags</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_DISCONNECT"></a><a id="http_send_response_flag_disconnect"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_DISCONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection should be disconnected after sending this response, overriding any persistent connection features associated with the version of HTTP in use.<div class="alert"><b>Caution</b>  Combining <b>HTTP_SEND_RESPONSE_FLAG_DISCONNECT</b> and <b>HTTP_SEND_RESPONSE_FLAG_MORE_DATA</b> in a single call to the <b>HttpSendHttpResponse</b> function produces undefined results.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_MORE_DATA"></a><a id="http_send_response_flag_more_data"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Additional entity body data for this response is sent by the application through one or more subsequent calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendresponseentitybody">HttpSendResponseEntityBody</a>. The last call sending entity-body data then sets this flag to zero.
     * 
     * <div class="alert"><b>Caution</b>  Combining <b>HTTP_SEND_RESPONSE_FLAG_DISCONNECT</b> and <b>HTTP_SEND_RESPONSE_FLAG_MORE_DATA</b> in a single call to the <b>HttpSendHttpResponse</b> function produces undefined results.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_BUFFER_DATA"></a><a id="http_send_response_flag_buffer_data"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_BUFFER_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag enables buffering of data in the kernel on a per-response basis.
     * 
     * It should be used by an application doing synchronous I/O or by an application doing asynchronous I/O with no more than one outstanding send at a time.
     * 
     * Applications that use asynchronous I/O and that may have more than one send outstanding at a time should not use this flag.
     * 
     * When this flag is set, it should also be used consistently in calls to the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendresponseentitybody">HttpSendResponseEntityBody</a> function.
     * 
     * <b>Windows Server 2003:  </b>This flag is not supported. This flag is new for Windows Server 2003 with SP1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_ENABLE_NAGLING"></a><a id="http_send_response_flag_enable_nagling"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_ENABLE_NAGLING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables the TCP nagling algorithm for this  send only.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_PROCESS_RANGES"></a><a id="http_send_response_flag_process_ranges"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_PROCESS_RANGES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that for a range request, the full response content is passed and the caller wants the HTTP API to process ranges appropriately.
     * 
     * 
     * <div class="alert"><b>Note</b>  This flag is only supported for responses to HTTP <i>GET</i> requests and offers a limited subset of functionality. Applications that require full range processing should perform it in user mode and not rely on HTTP.sys. It's usage is discouraged.</div>
     * <div> </div>
     * Windows Server 2008 R2 and Windows 7 or later.
     * 
     * <b>Note</b>  This flag is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_OPAQUE"></a><a id="http_send_response_flag_opaque"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_OPAQUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the request/response is not
     * HTTP compliant and all subsequent bytes should be treated as entity-body. Applications specify this flag when it is accepting a Web Socket upgrade request and informing HTTP.sys to treat the connection data as opaque data.
     * 
     * This flag is only allowed when the <b>StatusCode</b> member of <i>pHttpResponse</i> is <b>101</b>, switching protocols. <b>HttpSendHttpResponse</b> returns <b>ERROR_INVALID_PARAMETER</b> for all other HTTP response types if this flag is used.
     * 
     * <b>Windows 8 and later:  </b>This flag is supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<HTTP_RESPONSE_V2>} HttpResponse A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/Http/http-response">HTTP_RESPONSE</a> structure that defines the HTTP response.
     * @param {Pointer<HTTP_CACHE_POLICY>} CachePolicy A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_cache_policy">HTTP_CACHE_POLICY</a> structure used to cache the response.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>This parameter is reserved and must be <b>NULL</b>.
     * @param {Pointer<UInt32>} BytesSent Optional. A pointer to a variable that receives the number, in bytes, sent if the function operates synchronously.
     * 
     * When making an asynchronous call using <i>pOverlapped</i>, set <i>pBytesSent</i> to <b>NULL</b>. Otherwise, when <i>pOverlapped</i> is set to <b>NULL</b>, <i>pBytesSent</i> must contain a valid memory address and not be set to <b>NULL</b>.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure; for synchronous calls, set  to <b>NULL</b>.
     * 
     * A synchronous call blocks until all response data specified in the <i>pHttpResponse</i> parameter is sent, whereas an asynchronous call immediately returns <b>ERROR_IO_PENDING</b> and the calling application then uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> or I/O completion ports to determine when the operation is completed. For more information about using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structures for synchronization, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>.
     * @param {Pointer<HTTP_LOG_DATA>} LogData A pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_log_data">HTTP_LOG_DATA</a> structure used to log the response. Pass a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_log_fields_data">HTTP_LOG_FIELDS_DATA</a> structure and cast it to <b>PHTTP_LOG_DATA</b>.
     * 
     * Be aware that even when logging is enabled on a URL Group, or server session, the response will not be logged unless the application supplies the log fields data structure.
     * 
     * <b>Windows Server 2003 and Windows XP with SP2:  </b>This parameter is reserved and must be <b>NULL</b>.
     * 
     * <b>Windows Vista and Windows Server 2008:  </b>This parameter is new for Windows Vista, and Windows Server 2008
     * @returns {Integer} If the function succeeds, the function returns <b>NO_ERROR</b>.
     * 
     * If the function is used asynchronously, a return value of <b>ERROR_IO_PENDING</b> indicates that the next request is not yet ready and is retrieved later through normal overlapped I/O completion mechanisms.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpsendhttpresponse
     * @since windows6.0.6000
     */
    static HttpSendHttpResponse(RequestQueueHandle, RequestId, Flags, HttpResponse, CachePolicy, BytesSent, Overlapped, LogData) {
        static Reserved1 := 0, Reserved2 := 0 ;Reserved parameters must always be NULL

        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpSendHttpResponse", "ptr", RequestQueueHandle, "uint", RequestId, "uint", Flags, "ptr", HttpResponse, "ptr", CachePolicy, "uint*", BytesSent, "ptr", Reserved1, "uint", Reserved2, "ptr", Overlapped, "ptr", LogData, "uint")
        return result
    }

    /**
     * Sends entity-body data associated with an HTTP response.
     * @param {HANDLE} RequestQueueHandle A handle to the request queue from which the specified request was retrieved. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {Integer} RequestId An identifier of the HTTP request to which this response corresponds. This value is returned in the <b>RequestId</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceivehttprequest">HttpReceiveHttpRequest</a> function. It cannot be <b>HTTP_NULL_ID</b>.
     * @param {Integer} Flags A parameter that can include  one of the following mutually exclusive flag values.
     * 
     * <table>
     * <tr>
     * <th>Flags</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_DISCONNECT"></a><a id="http_send_response_flag_disconnect"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_DISCONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection should be disconnected after sending this response, overriding any persistent connection features associated with the version of HTTP in use. Applications should use this flag to indicate the end of the entity in cases where neither content length nor chunked encoding is used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_MORE_DATA"></a><a id="http_send_response_flag_more_data"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Additional entity body data for this response is sent by the application through one or more subsequent calls to 
     * <b>HttpSendResponseEntityBody</b>. The last call then sets this flag to zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_BUFFER_DATA"></a><a id="http_send_response_flag_buffer_data"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_BUFFER_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag enables buffering of data in the kernel on a per-response basis.
     * 
     * It should be used by an application doing synchronous I/O, or by a an application doing asynchronous I/O with no more than one send outstanding at a time.
     * 
     * Applications using asynchronous I/O which may have more than one send outstanding at a time should not use this flag.
     * 
     * When this flag is set, it should be used consistently in calls to the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a> function as well.
     * 
     * <b>Windows Server 2003:  </b>This flag is not supported. This flag is new for Windows Server 2003 with SP1.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_ENABLE_NAGLING"></a><a id="http_send_response_flag_enable_nagling"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_ENABLE_NAGLING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enables the TCP nagling algorithm for this  send only.
     * 
     * <b>Windows Vista and later:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_PROCESS_RANGES"></a><a id="http_send_response_flag_process_ranges"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_PROCESS_RANGES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that for a range request, the full response content is passed and the caller wants the HTTP API to process ranges appropriately.
     * 
     * 
     * <div class="alert"><b>Note</b>  This flag is only supported for responses to HTTP <i>GET</i> requests and offers a limited subset of functionality. Applications that require full range processing should perform it in user mode and not rely on HTTP.sys. It's usage is discouraged.</div>
     * <div> </div>
     * Windows Server 2008 R2 and Windows 7 or later.
     * 
     * <b>Note</b>  This flag is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_SEND_RESPONSE_FLAG_OPAQUE"></a><a id="http_send_response_flag_opaque"></a><dl>
     * <dt><b>HTTP_SEND_RESPONSE_FLAG_OPAQUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the request/response is not
     * HTTP compliant and all subsequent bytes should be treated as entity-body. Applications specify this flag when it is accepting a Web Socket upgrade request and informing HTTP.sys to treat the connection data as opaque data.
     * 
     * This flag is only allowed when the <b>StatusCode</b> member of <i>pHttpResponse</i> is <b>101</b>, switching protocols. <b>HttpSendResponseEntityBody</b> returns <b>ERROR_INVALID_PARAMETER</b> for all other HTTP response types if this flag is used.
     * 
     * <b>Windows 8 and later:  </b>This flag is supported.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Caution</b>  Combining both flags in a single call to the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a> function produces undefined results.</div>
     * <div> </div>
     * @param {Integer} EntityChunkCount A number of structures in the array pointed to by <i>pEntityChunks</i>. This count cannot exceed 9999.
     * @param {Pointer<HTTP_DATA_CHUNK>} EntityChunks A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_data_chunk">HTTP_DATA_CHUNK</a> structures to be sent as entity-body data.
     * @param {Pointer<UInt32>} BytesSent Optional. A pointer to a variable that receives the number, in bytes, sent if the function operates synchronously.
     * 
     * When making an asynchronous call using <i>pOverlapped</i>, set <i>pBytesSent</i> to <b>NULL</b>. Otherwise, when <i>pOverlapped</i> is set to <b>NULL</b>, <i>pBytesSent</i> must contain a valid memory address, and not be set to <b>NULL</b>.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure; for synchronous calls, set it to <b>NULL</b>.
     * 
     * A synchronous call blocks until all response data specified in the <i>pEntityChunks</i> parameter is sent, whereas an asynchronous call immediately returns <b>ERROR_IO_PENDING</b> and the calling application then uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> or I/O completion ports to determine when the operation is completed. For more information about using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structures for synchronization, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>.
     * @param {Pointer<HTTP_LOG_DATA>} LogData A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_log_data">HTTP_LOG_DATA</a> structure used to log the response. Pass a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_log_fields_data">HTTP_LOG_FIELDS_DATA</a> structure and cast it to <b>PHTTP_LOG_DATA</b>.
     * 
     * Be aware that even when logging is enabled on a URL Group, or server session, the response will not be logged unless the application supplies the log fields data structure.
     * 
     * <b>Windows Server 2003 and Windows XP with SP2:  </b>This parameter is reserved and must be <b>NULL</b>.
     * 
     * <b>Windows Vista and Windows Server 2008:  </b>This parameter is new for Windows Vista, and Windows Server 2008
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function is used asynchronously, a return value of <b>ERROR_IO_PENDING</b> indicates that the next request is not yet ready and is retrieved later through normal overlapped I/O completion mechanisms.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_COMMAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a call pending to <a href="/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a> or <a href="/windows/desktop/api/http/nf-http-httpsendresponseentitybody">HttpSendResponseEntityBody</a> having the same <b>RequestId</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpsendresponseentitybody
     * @since windows6.0.6000
     */
    static HttpSendResponseEntityBody(RequestQueueHandle, RequestId, Flags, EntityChunkCount, EntityChunks, BytesSent, Overlapped, LogData) {
        static Reserved1 := 0, Reserved2 := 0 ;Reserved parameters must always be NULL

        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpSendResponseEntityBody", "ptr", RequestQueueHandle, "uint", RequestId, "uint", Flags, "ushort", EntityChunkCount, "ptr", EntityChunks, "uint*", BytesSent, "ptr", Reserved1, "uint", Reserved2, "ptr", Overlapped, "ptr", LogData, "uint")
        return result
    }

    /**
     * Declares a resource-to-subresource relationship to use for an HTTP server push. HTTP.sys then performs an HTTP 2.0 server push for the given resource, if the underlying protocol, connection, client, and policies allow the push operation.
     * @param {HANDLE} RequestQueueHandle The handle to an HTTP.sys request queue that the  <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function returned.
     * @param {Integer} RequestId The opaque identifier of the request that is declaring the push operation. The request must be from the specified queue handle.
     * @param {Integer} Verb The HTTP verb to use for the push operation. The HTTP.sys push operation only supports <b>HttpVerbGET</b> and <b>HttpVerbHEAD</b>.
     * @param {PWSTR} Path The path portion of the URL for the resource being pushed.
     * @param {PSTR} Query The query portion of the URL for the resource being pushed. This          string should not include the leading question mark (?).
     * @param {Pointer<HTTP_REQUEST_HEADERS>} Headers The request headers for the push operation.
     * 
     * You should not provide a Host header, because HTTP.sys automatically generates the correct Host information.  HTTP.sys does not support cross-origin push operations, so HTTP.sys  enforces and generates Host information that matches the original client-initiated request.
     * 
     * The push request is not allowed to have an entity body, so you cannot include a non-zero Content-Length  header or any Transfer-Encoding header.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>.
     * 
     * If the function fails, it returns a <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpdeclarepush
     * @since windows10.0.10240
     */
    static HttpDeclarePush(RequestQueueHandle, RequestId, Verb, Path, Query, Headers) {
        Path := Path is String ? StrPtr(Path) : Path
        Query := Query is String ? StrPtr(Query) : Query
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpDeclarePush", "ptr", RequestQueueHandle, "uint", RequestId, "int", Verb, "ptr", Path, "ptr", Query, "ptr", Headers, "uint")
        return result
    }

    /**
     * Notifies the application when the connection to an HTTP client is broken for any reason.
     * @param {HANDLE} RequestQueueHandle A handle to the request queue that handles requests from the specified connection. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {Integer} ConnectionId Identifier for the connection to the client computer. This value is returned in the <b>ConnectionID</b> member of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364545(v=vs.85)">HTTP_REQUEST</a> structure by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceivehttprequest">HttpReceiveHttpRequest</a> function.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure; for synchronous calls, set it to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * A synchronous call blocks until the connection is broken, whereas an asynchronous call immediately returns ERROR_IO_PENDING and the calling application then uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> or I/O completion ports to determine when the operation is completed. For information about using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structures for synchronization, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function is used asynchronously, a return value of ERROR_IO_PENDING indicates that the next request is not yet ready and is retrieved later through normal overlapped I/O completion mechanisms.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpwaitfordisconnect
     * @since windows6.0.6000
     */
    static HttpWaitForDisconnect(RequestQueueHandle, ConnectionId, Overlapped) {
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpWaitForDisconnect", "ptr", RequestQueueHandle, "uint", ConnectionId, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * This function is an extension to HttpWaitForDisconnect.
     * @param {HANDLE} RequestQueueHandle 
     * @param {Integer} ConnectionId 
     * @param {Pointer<OVERLAPPED>} Overlapped 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpwaitfordisconnectex
     */
    static HttpWaitForDisconnectEx(RequestQueueHandle, ConnectionId, Overlapped) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpWaitForDisconnectEx", "ptr", RequestQueueHandle, "uint", ConnectionId, "uint", Reserved, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * The HttpCancelHttpRequest function cancels a specified reqest.
     * @param {HANDLE} RequestQueueHandle A handle to the request queue from which the request came.
     * @param {Integer} RequestId The ID of the request to be canceled.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure; for synchronous calls, set it to <b>NULL</b>.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpcancelhttprequest
     * @since windows6.0.6000
     */
    static HttpCancelHttpRequest(RequestQueueHandle, RequestId, Overlapped) {
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpCancelHttpRequest", "ptr", RequestQueueHandle, "uint", RequestId, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Waits for the arrival of a new request that can be served by a new request queue process.
     * @param {HANDLE} RequestQueueHandle A handle to the request queue on which demand start is registered. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure; for synchronous calls, set it to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * A synchronous call blocks until a request has arrived in the specified queue, whereas an asynchronous call immediately returns <b>ERROR_IO_PENDING</b> and the calling application then uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> or I/O completion ports to determine when the operation is completed. For more information about using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structures for synchronization, see  
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>.
     * @returns {Integer} If the function succeeds, it returns <b>NO_ERROR</b>.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ReqQueueHandle</i> parameter does not contain a valid request queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ID_AUTHORITY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling process is not the controller process for this request queue.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling process has already initiated a shutdown on the request queue or has closed the request queue handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A demand start registration already exists for the request queue.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpwaitfordemandstart
     * @since windows6.0.6000
     */
    static HttpWaitForDemandStart(RequestQueueHandle, Overlapped) {
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpWaitForDemandStart", "ptr", RequestQueueHandle, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Checks whether a particular feature is supported.
     * @param {Integer} FeatureId Type: \_In\_ **[HTTP_FEATURE_ID](./ne-http-http_feature_id.md)**
     * 
     * The identifier of the feature.
     * @returns {BOOL} `TRUE` if the feature is supported, otherwise `FALSE`.
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpisfeaturesupported
     */
    static HttpIsFeatureSupported(FeatureId) {
        result := DllCall("HTTPAPI.dll\HttpIsFeatureSupported", "int", FeatureId, "ptr")
        return result
    }

    /**
     * Delegates a request from the source request queue to the target request queue.
     * @param {HANDLE} RequestQueueHandle Type: \_In\_ **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * A handle to the source request queue.
     * @param {HANDLE} DelegateQueueHandle Type: \_In\_ **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * A handle to the target request queue.
     * @param {Integer} RequestId Type: \_In\_ **HTTP_REQUEST_ID**
     * 
     * A unique request ID received with [HttpReceiveHttpRequest](/windows/win32/api/http/nf-http-httpreceivehttprequest).
     * @param {Integer} DelegateUrlGroupId Type: \_In\_ **HTTP_URL_GROUP_ID**
     * 
     * The url group id of the target url group.
     * @param {Integer} PropertyInfoSetSize Type: \_In\_ **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of entries in the *PropertyInfoSet* array.
     * @param {Pointer<HTTP_DELEGATE_REQUEST_PROPERTY_INFO>} PropertyInfoSet Type: \_In\_ [**PHTTP_DELEGATE_REQUEST_PROPERTY_INFO](/windows/win32/api/http/ns-http-http_delegate_request_property_info)**
     * 
     * An array of properties to be set on request when delegating.
     * @returns {Integer} A **[ULONG](/windows/win32/winprog/windows-data-types)** containing an [NTSTATUS](/openspecs/windows_protocols/ms-erref/87fba13e-bf06-450e-83b1-9241dc81e781) completion status.
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpdelegaterequestex
     */
    static HttpDelegateRequestEx(RequestQueueHandle, DelegateQueueHandle, RequestId, DelegateUrlGroupId, PropertyInfoSetSize, PropertyInfoSet) {
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle
        DelegateQueueHandle := DelegateQueueHandle is Win32Handle ? NumGet(DelegateQueueHandle, "ptr") : DelegateQueueHandle

        result := DllCall("HTTPAPI.dll\HttpDelegateRequestEx", "ptr", RequestQueueHandle, "ptr", DelegateQueueHandle, "uint", RequestId, "uint", DelegateUrlGroupId, "uint", PropertyInfoSetSize, "ptr", PropertyInfoSet, "uint")
        return result
    }

    /**
     * Retrieves a URL group ID for a URL and a request queue.
     * @param {PWSTR} FullyQualifiedUrl Type: \_In\_ **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The URL whose URL group to query.
     * @param {HANDLE} RequestQueueHandle Type: \_In\_ **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * The request queue associated with the URL group.
     * @param {Pointer<UInt64>} UrlGroupId Type: \_Out\_ **PHTTP_URL_GROUP_ID**
     * 
     * The matching URL group ID.
     * @returns {Integer} A **[ULONG](/windows/win32/winprog/windows-data-types)** containing an [NTSTATUS](/openspecs/windows_protocols/ms-erref/87fba13e-bf06-450e-83b1-9241dc81e781) completion status.
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpfindurlgroupid
     */
    static HttpFindUrlGroupId(FullyQualifiedUrl, RequestQueueHandle, UrlGroupId) {
        FullyQualifiedUrl := FullyQualifiedUrl is String ? StrPtr(FullyQualifiedUrl) : FullyQualifiedUrl
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpFindUrlGroupId", "ptr", FullyQualifiedUrl, "ptr", RequestQueueHandle, "uint*", UrlGroupId, "uint")
        return result
    }

    /**
     * Removes from the HTTP Server API cache associated with a given request queue all response fragments that have a name whose site portion matches a specified UrlPrefix.
     * @param {HANDLE} RequestQueueHandle Handle to the request queue with which this cache is associated. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {PWSTR} UrlPrefix Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/Http/urlprefix-strings">UrlPrefix string</a> to match against the site portion of fragment names. The application must previously have called <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpaddurl">HttpAddUrl</a> to add this UrlPrefix or a valid prefix of it to the request queue in question, and then called <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpaddfragmenttocache">HttpAddFragmentToCache</a> to cache the associated response fragment.
     * @param {Integer} Flags This parameter can contain the following flag:
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, or for synchronous calls, set it to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * A synchronous call blocks until the cache operation is complete, whereas an asynchronous call immediately returns ERROR_IO_PENDING and the calling application then uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> or I/O completion ports to determine when the operation is completed. For more information about using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structures for synchronization, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function is used asynchronously, a return value of ERROR_IO_PENDING indicates that the cache request is queued and  completes later through normal overlapped I/O completion mechanisms.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpflushresponsecache
     * @since windows6.0.6000
     */
    static HttpFlushResponseCache(RequestQueueHandle, UrlPrefix, Flags, Overlapped) {
        UrlPrefix := UrlPrefix is String ? StrPtr(UrlPrefix) : UrlPrefix
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpFlushResponseCache", "ptr", RequestQueueHandle, "ptr", UrlPrefix, "uint", Flags, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * The HttpAddFragmentToCache function caches a data fragment with a specified name by which it can be retrieved, or updates data cached under a specified name.
     * @param {HANDLE} RequestQueueHandle Handle to the request queue with which this cache is associated. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {PWSTR} UrlPrefix Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/Http/urlprefix-strings">UrlPrefix string</a> that the application uses in subsequent calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a> to identify this cache entry. The application must have called <b>HttpAddUrl</b> previously with the same handle as in the <i>ReqQueueHandle</i> parameter, and with  either  this identical UrlPrefix string or a valid prefix of it.
     * 
     * Like any UrlPrefix, this string must take the form "scheme://host:port/relativeURI"; for example, http://www.mysite.com:80/image1.gif.
     * @param {Pointer<HTTP_DATA_CHUNK>} DataChunk Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_data_chunk">HTTP_DATA_CHUNK</a> structure that specifies an entity body data block to cache under the name pointed to by <i>pUrlPrefix</i>.
     * @param {Pointer<HTTP_CACHE_POLICY>} CachePolicy Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_cache_policy">HTTP_CACHE_POLICY</a> structure that specifies how this data fragment should be cached.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, or for synchronous calls, set it to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * A synchronous call blocks the calling thread until the cache operation is complete, whereas an asynchronous call immediately returns ERROR_IO_PENDING and the calling application then uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> or I/O completion ports to determine when the operation is completed. For more information about using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structures for synchronization, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function is used asynchronously, a return value of ERROR_IO_PENDING indicates that the cache request is queued and will complete later through normal overlapped I/O completion mechanisms.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpaddfragmenttocache
     * @since windows6.0.6000
     */
    static HttpAddFragmentToCache(RequestQueueHandle, UrlPrefix, DataChunk, CachePolicy, Overlapped) {
        UrlPrefix := UrlPrefix is String ? StrPtr(UrlPrefix) : UrlPrefix
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpAddFragmentToCache", "ptr", RequestQueueHandle, "ptr", UrlPrefix, "ptr", DataChunk, "ptr", CachePolicy, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * The HttpReadFragmentFromCache function retrieves a response fragment having a specified name from the HTTP Server API cache.
     * @param {HANDLE} RequestQueueHandle Handle to the request queue with which the specified response fragment is associated. A request queue is created and its handle returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreaterequestqueue">HttpCreateRequestQueue</a> function.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>The handle to the request queue is created by the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpcreatehttphandle">HttpCreateHttpHandle</a> function.
     * @param {PWSTR} UrlPrefix Pointer to a <a href="https://docs.microsoft.com/windows/desktop/Http/urlprefix-strings">UrlPrefix string</a> that contains the name of the fragment to be retrieved. This must match a UrlPrefix string used in a previous successful call to <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpaddfragmenttocache">HttpAddFragmentToCache</a>.
     * @param {Pointer<HTTP_BYTE_RANGE>} ByteRange Optional pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_byte_range">HTTP_BYTE_RANGE</a> structure that indicates a starting offset in the specified fragment and byte-count to be returned. <b>NULL</b> if not used, in which case the entire fragment is returned.
     * @param {Pointer} Buffer Pointer to a buffer into which the function copies the requested fragment.
     * @param {Integer} BufferLength Size, in bytes, of the <i>pBuffer</i> buffer.
     * @param {Pointer<UInt32>} BytesRead Optional pointer to a variable that receives the number of bytes to be written into the output buffer. If <i>BufferLength</i> is less than this number, the call fails with a return of ERROR_INSUFFICIENT_BUFFER, and the value pointed to by <i>pBytesRead</i> can be used to determine the minimum length of buffer required for the call to succeed. 
     * 
     * 
     * 
     * 
     * When making an asynchronous call using <i>pOverlapped</i>, set <i>pBytesRead</i> to <b>NULL</b>. Otherwise, when <i>pOverlapped</i> is set to <b>NULL</b>, <i>pBytesRead</i> must contain a valid memory address, and not be set to <b>NULL</b>.
     * @param {Pointer<OVERLAPPED>} Overlapped For asynchronous calls, set <i>pOverlapped</i> to point to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, or for synchronous calls, set it to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * A synchronous call blocks until the cache operation is complete, whereas an asynchronous call immediately returns ERROR_IO_PENDING and the calling application then uses 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> or I/O completion ports to determine when the operation is completed. For more information about using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structures for synchronization, see <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function is used asynchronously, a return value of ERROR_IO_PENDING indicates that the cache request is queued and  completes later through normal overlapped I/O completion mechanisms.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>pBuffer</i> is too small to receive all the requested data; the size of buffer required is pointed to by <i>pBytesRead</i> unless it was <b>NULL</b> or the call was asynchronous. In the case of an asynchronous call, the value pointed to by the <i>lpNumberOfBytesTransferred</i> parameter of the 
     * <a href="/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverLappedResult</a> function is set to the buffer size required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpreadfragmentfromcache
     * @since windows6.0.6000
     */
    static HttpReadFragmentFromCache(RequestQueueHandle, UrlPrefix, ByteRange, Buffer, BufferLength, BytesRead, Overlapped) {
        UrlPrefix := UrlPrefix is String ? StrPtr(UrlPrefix) : UrlPrefix
        RequestQueueHandle := RequestQueueHandle is Win32Handle ? NumGet(RequestQueueHandle, "ptr") : RequestQueueHandle

        result := DllCall("HTTPAPI.dll\HttpReadFragmentFromCache", "ptr", RequestQueueHandle, "ptr", UrlPrefix, "ptr", ByteRange, "ptr", Buffer, "uint", BufferLength, "uint*", BytesRead, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Creates and sets a configuration record for the HTTP Server API configuration store.
     * @param {Integer} ConfigId 
     * @param {Pointer} pConfigInformation A pointer to a buffer that contains the appropriate data to specify the type of record to be set.
     * 
     * <table>
     * <tr>
     * <th><i>ConfigId</i> value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigIPListenList"></a><a id="httpserviceconfigiplistenlist"></a><a id="HTTPSERVICECONFIGIPLISTENLIST"></a><dl>
     * <dt><b>HttpServiceConfigIPListenList</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ip_listen_param">HTTP_SERVICE_CONFIG_IP_LISTEN_PARAM</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSSLCertInfo"></a><a id="httpserviceconfigsslcertinfo"></a><a id="HTTPSERVICECONFIGSSLCERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSSLCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_set">HTTP_SERVICE_CONFIG_SSL_SET</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigUrlAclInfo"></a><a id="httpserviceconfigurlaclinfo"></a><a id="HTTPSERVICECONFIGURLACLINFO"></a><dl>
     * <dt><b>HttpServiceConfigUrlAclInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_urlacl_set">HTTP_SERVICE_CONFIG_URLACL_SET</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigTimeout"></a><a id="httpserviceconfigtimeout"></a><a id="HTTPSERVICECONFIGTIMEOUT"></a><dl>
     * <dt><b>HttpServiceConfigTimeout</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_timeout_set">HTTP_SERVICE_CONFIG_TIMEOUT_SET</a> structure.
     * 
     * 
     * <b>Windows Vista and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslSniCertInfo"></a><a id="httpserviceconfigsslsnicertinfo"></a><a id="HTTPSERVICECONFIGSSLSNICERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSslSniCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_sni_set">HTTP_SERVICE_CONFIG_SSL_SNI_SET</a> structure. The hostname will be "*" when the SSL central certificate store is queried and wildcard bindings are used, and a host name for regular SNI.
     * 
     * 
     * <b>Windows 8 and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslCcsCertInfo"></a><a id="httpserviceconfigsslccscertinfo"></a><a id="HTTPSERVICECONFIGSSLCCSCERTINFO"></a><dl>
     * <dt><b><b>HttpServiceConfigSslCcsCertInfo</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_set">HTTP_SERVICE_CONFIG_SSL_CCS_SET</a> structure.
     * 
     * 
     * <b>Windows 8 and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ConfigInformationLength Size, in bytes, of the <i>pConfigInformation</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified record already exists, and must be deleted in order for its value to be re-set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size specified in the <i>ConfigInformationLength</i> parameter is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ServiceHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SSL Certificate used is invalid.  This can occur only if the <i>HttpServiceConfigSSLCertInfo</i> parameter is used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpsetserviceconfiguration
     * @since windows5.1.2600
     */
    static HttpSetServiceConfiguration(ConfigId, pConfigInformation, ConfigInformationLength) {
        static ServiceHandle := 0, pOverlapped := 0 ;Reserved parameters must always be NULL

        ServiceHandle := ServiceHandle is Win32Handle ? NumGet(ServiceHandle, "ptr") : ServiceHandle

        result := DllCall("HTTPAPI.dll\HttpSetServiceConfiguration", "ptr", ServiceHandle, "int", ConfigId, "ptr", pConfigInformation, "uint", ConfigInformationLength, "ptr", pOverlapped, "uint")
        return result
    }

    /**
     * Updates atomically a service configuration parameter that specifies a Transport Layer Security (TLS) certificate in a configuration record within the HTTP Server API configuration store.
     * @param {Integer} ConfigId 
     * @param {Pointer} ConfigInfo A pointer to a buffer that contains the appropriate data to specify the type of record to update. The  following table shows the type of data the buffer contains for the different possible values of the <i>ConfigId</i> parameter.
     * 
     * <table>
     * <tr>
     * <th><i>ConfigId</i> value</th>
     * <th>Type of data in the <i>pConfigInfo</i> buffer</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSSLCertInfo"></a><a id="httpserviceconfigsslcertinfo"></a><a id="HTTPSERVICECONFIGSSLCERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSSLCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_set">HTTP_SERVICE_CONFIG_SSL_SET</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslSniCertInfo"></a><a id="httpserviceconfigsslsnicertinfo"></a><a id="HTTPSERVICECONFIGSSLSNICERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSslSniCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_sni_set">HTTP_SERVICE_CONFIG_SSL_SNI_SET</a> structure. The hostname will be "*" when the SSL central certificate store is queried and wildcard bindings are used, and a host name for regular SNI.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslCcsCertInfo"></a><a id="httpserviceconfigsslccscertinfo"></a><a id="HTTPSERVICECONFIGSSLCCSCERTINFO"></a><dl>
     * <dt><b><b>HttpServiceConfigSslCcsCertInfo</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_set">HTTP_SERVICE_CONFIG_SSL_CCS_SET</a> structure. This structure is used to add the CCS store on the specified port, as well as to delete, retrieve, or update an existing SSL CCS record.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ConfigInfoLength The size, in bytes, of the <i>ConfigInfo</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified record does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer size specified in the <i>ConfigInfoLength</i> parameter is insufficient.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ServiceHandle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the supplied parameters is in an unusable form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_SUCH_LOGON_SESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The SSL Certificate used is invalid.  This can occur only if the <i>HttpServiceConfigSSLCertInfo</i> parameter is used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpupdateserviceconfiguration
     * @since windows10.0.15063
     */
    static HttpUpdateServiceConfiguration(ConfigId, ConfigInfo, ConfigInfoLength) {
        static Handle := 0, Overlapped := 0 ;Reserved parameters must always be NULL

        Handle := Handle is Win32Handle ? NumGet(Handle, "ptr") : Handle

        result := DllCall("HTTPAPI.dll\HttpUpdateServiceConfiguration", "ptr", Handle, "int", ConfigId, "ptr", ConfigInfo, "uint", ConfigInfoLength, "ptr", Overlapped, "uint")
        return result
    }

    /**
     * Deletes specified data, such as IP addresses or SSL Certificates, from the HTTP Server API configuration store, one record at a time.
     * @param {Integer} ConfigId Type of configuration. This parameter is one of the  values in 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_service_config_id">HTTP_SERVICE_CONFIG_ID</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th><i>ConfigId</i> value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigIPListenList"></a><a id="httpserviceconfigiplistenlist"></a><a id="HTTPSERVICECONFIGIPLISTENLIST"></a><dl>
     * <dt><b>HttpServiceConfigIPListenList</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deletes a specified IP address from the IP Listen List.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSSLCertInfo"></a><a id="httpserviceconfigsslcertinfo"></a><a id="HTTPSERVICECONFIGSSLCERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSSLCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deletes a specified SSL certificate record.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigUrlAclInfo"></a><a id="httpserviceconfigurlaclinfo"></a><a id="HTTPSERVICECONFIGURLACLINFO"></a><dl>
     * <dt><b>HttpServiceConfigUrlAclInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deletes a specified URL reservation record.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigTimeout"></a><a id="httpserviceconfigtimeout"></a><a id="HTTPSERVICECONFIGTIMEOUT"></a><dl>
     * <dt><b>HttpServiceConfigTimeout</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deletes a specified connection timeout.
     * 
     * 
     * <b>Windows Vista and later:  </b>This enumeration is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslSniCertInfo"></a><a id="httpserviceconfigsslsnicertinfo"></a><a id="HTTPSERVICECONFIGSSLSNICERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSslSniCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deletes a specified SSL Server Name Indication (SNI) certificate record.
     * 
     * <b>Windows 8 and later:  </b>This enumeration value is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslCcsCertInfo"></a><a id="httpserviceconfigsslccscertinfo"></a><a id="HTTPSERVICECONFIGSSLCCSCERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSslCcsCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deletes the   SSL certificate record that specifies that Http.sys should consult the Centralized Certificate Store (CCS) store to find certificates if the port receives a Transport Layer Security (TLS) handshake.  The port is specified by the <b>KeyDesc</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_set">HTTP_SERVICE_CONFIG_SSL_CCS_SET</a> structure that you  pass to the <i>pConfigInformation</i> parameter.
     * 
     * <b>Windows 8 and later:  </b>This enumeration value is supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} pConfigInformation Pointer to a buffer that contains data required for the type of configuration specified in the <i>ConfigId</i> parameter.
     * 
     * <table>
     * <tr>
     * <th><i>ConfigId</i> value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigIPListenList"></a><a id="httpserviceconfigiplistenlist"></a><a id="HTTPSERVICECONFIGIPLISTENLIST"></a><dl>
     * <dt><b>HttpServiceConfigIPListenList</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ip_listen_param">HTTP_SERVICE_CONFIG_IP_LISTEN_PARAM</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSSLCertInfo"></a><a id="httpserviceconfigsslcertinfo"></a><a id="HTTPSERVICECONFIGSSLCERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSSLCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_set">HTTP_SERVICE_CONFIG_SSL_SET</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigUrlAclInfo"></a><a id="httpserviceconfigurlaclinfo"></a><a id="HTTPSERVICECONFIGURLACLINFO"></a><dl>
     * <dt><b>HttpServiceConfigUrlAclInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_urlacl_set">HTTP_SERVICE_CONFIG_URLACL_SET</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigTimeouts"></a><a id="httpserviceconfigtimeouts"></a><a id="HTTPSERVICECONFIGTIMEOUTS"></a><dl>
     * <dt><b>HttpServiceConfigTimeouts</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_service_config_timeout_key">HTTP_SERVICE_CONFIG_TIMEOUT_KEY</a> structure.
     * 
     * 
     * <b>Windows Vista and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslSniCertInfo"></a><a id="httpserviceconfigsslsnicertinfo"></a><a id="HTTPSERVICECONFIGSSLSNICERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSslSniCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_sni_set">HTTP_SERVICE_CONFIG_SSL_SNI_SET</a> structure. The hostname will be "*" when the SSL central certificate store is queried and wildcard bindings are used, and a host name for regular SNI.
     * 
     * 
     * <b>Windows 8 and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslCcsCertInfo"></a><a id="httpserviceconfigsslccscertinfo"></a><a id="HTTPSERVICECONFIGSSLCCSCERTINFO"></a><dl>
     * <dt><b><b>HttpServiceConfigSslCcsCertInfo</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_set">HTTP_SERVICE_CONFIG_SSL_CCS_SET</a> structure.
     * 
     * 
     * <b>Windows 8 and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ConfigInformationLength Size, in bytes, of the <i>pConfigInformation</i> buffer.
     * @returns {Integer} If the function succeeds, the function returns NO_ERROR.
     * 
     * If the function fails, it returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpdeleteserviceconfiguration
     * @since windows6.0.6000
     */
    static HttpDeleteServiceConfiguration(ConfigId, pConfigInformation, ConfigInformationLength) {
        static ServiceHandle := 0, pOverlapped := 0 ;Reserved parameters must always be NULL

        ServiceHandle := ServiceHandle is Win32Handle ? NumGet(ServiceHandle, "ptr") : ServiceHandle

        result := DllCall("HTTPAPI.dll\HttpDeleteServiceConfiguration", "ptr", ServiceHandle, "int", ConfigId, "ptr", pConfigInformation, "uint", ConfigInformationLength, "ptr", pOverlapped, "uint")
        return result
    }

    /**
     * Retrieves one or more HTTP Server API configuration records.
     * @param {Integer} ConfigId 
     * @param {Pointer} pInput A pointer to a structure whose contents further define the query and of the type that correlates with <i>ConfigId</i> in the following table.
     * 
     * <table>
     * <tr>
     * <th><i>ConfigId</i> value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigIPListenList"></a><a id="httpserviceconfigiplistenlist"></a><a id="HTTPSERVICECONFIGIPLISTENLIST"></a><dl>
     * <dt><b>HttpServiceConfigIPListenList</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No input data; set to <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSSLCertInfo"></a><a id="httpserviceconfigsslcertinfo"></a><a id="HTTPSERVICECONFIGSSLCERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSSLCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_query">HTTP_SERVICE_CONFIG_SSL_QUERY</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigUrlAclInfo"></a><a id="httpserviceconfigurlaclinfo"></a><a id="HTTPSERVICECONFIGURLACLINFO"></a><dl>
     * <dt><b>HttpServiceConfigUrlAclInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_urlacl_query">HTTP_SERVICE_CONFIG_URLACL_QUERY</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigTimeout"></a><a id="httpserviceconfigtimeout"></a><a id="HTTPSERVICECONFIGTIMEOUT"></a><dl>
     * <dt><b>HttpServiceConfigTimeout</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_service_config_timeout_key">HTTP_SERVICE_CONFIG_TIMEOUT_KEY</a> structure.
     * 
     * 
     * <b>Windows Vista and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslSniCertInfo"></a><a id="httpserviceconfigsslsnicertinfo"></a><a id="HTTPSERVICECONFIGSSLSNICERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSslSniCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_sni_query">HTTP_SERVICE_CONFIG_SSL_SNI_QUERY</a> structure.
     * 
     * 
     * <b>Windows 8 and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslCcsCertInfo"></a><a id="httpserviceconfigsslccscertinfo"></a><a id="HTTPSERVICECONFIGSSLCCSCERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSslCcsCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_query">HTTP_SERVICE_CONFIG_SSL_CCS_QUERY</a> structure.
     * 
     * 
     * <b>Windows 8 and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information, see the appropriate query structures.
     * @param {Integer} InputLength Size, in bytes, of the <i>pInputConfigInfo</i> buffer.
     * @param {Pointer} pOutput A pointer to a buffer in which the query results are returned. The type of this buffer correlates with <i>ConfigId</i>.
     * 
     * <table>
     * <tr>
     * <th><i>ConfigId</i> value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigIPListenList"></a><a id="httpserviceconfigiplistenlist"></a><a id="HTTPSERVICECONFIGIPLISTENLIST"></a><dl>
     * <dt><b>HttpServiceConfigIPListenList</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ip_listen_query">HTTP_SERVICE_CONFIG_IP_LISTEN_QUERY</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSSLCertInfo"></a><a id="httpserviceconfigsslcertinfo"></a><a id="HTTPSERVICECONFIGSSLCERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSSLCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_set">HTTP_SERVICE_CONFIG_SSL_SET</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigUrlAclInfo"></a><a id="httpserviceconfigurlaclinfo"></a><a id="HTTPSERVICECONFIGURLACLINFO"></a><dl>
     * <dt><b>HttpServiceConfigUrlAclInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_urlacl_set">HTTP_SERVICE_CONFIG_URLACL_SET</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigTimeout"></a><a id="httpserviceconfigtimeout"></a><a id="HTTPSERVICECONFIGTIMEOUT"></a><dl>
     * <dt><b>HttpServiceConfigTimeout</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Http/http-server-api-version-2-0-data-types">HTTP_SERVICE_CONFIG_TIMEOUT_PARAM</a> data type.
     * 
     * 
     * <b>Windows Vista and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslSniCertInfo"></a><a id="httpserviceconfigsslsnicertinfo"></a><a id="HTTPSERVICECONFIGSSLSNICERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSslSniCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_sni_set">HTTP_SERVICE_CONFIG_SSL_SNI_SET</a> structure.
     * 
     * 
     * <b>Windows 8 and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigSslCcsCertInfo"></a><a id="httpserviceconfigsslccscertinfo"></a><a id="HTTPSERVICECONFIGSSLCCSCERTINFO"></a><dl>
     * <dt><b>HttpServiceConfigSslCcsCertInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_set">HTTP_SERVICE_CONFIG_SSL_CCS_SET</a> structure.
     * 
     * 
     * <b>Windows 8 and later:  </b>This structure is supported.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} OutputLength Size, in bytes, of the <i>pOutputConfigInfo</i> buffer.
     * @param {Pointer<UInt32>} pReturnLength A pointer to a variable that receives the number of bytes to be written in the output buffer. If the output buffer is too small, the call fails with a return value of <b>ERROR_INSUFFICIENT_BUFFER</b>. The value pointed to by <i>pReturnLength</i> can be used to determine the minimum length the buffer requires for the call to succeed.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>pOutputConfigInfo</i> is too small to receive the output data. Call the function again with a buffer at least as large as the size pointed to by <i>pReturnLength</i> on exit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error code is only returned when <i>ConfigId</i> is set to <b>HttpServiceConfigTimeout</b>. The buffer pointed to by <i>pOutputConfigInfo</i> is too small to receive the output data. Call the function again with a buffer at least as large as the size pointed to by <i>pReturnLength</i> on exit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more items to return that meet the specified criteria.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <a href="/windows/desktop/Debug/system-error-codes">system error code</a> defined in WinError.h.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//http/nf-http-httpqueryserviceconfiguration
     * @since windows6.0.6000
     */
    static HttpQueryServiceConfiguration(ConfigId, pInput, InputLength, pOutput, OutputLength, pReturnLength) {
        static ServiceHandle := 0, pOverlapped := 0 ;Reserved parameters must always be NULL

        ServiceHandle := ServiceHandle is Win32Handle ? NumGet(ServiceHandle, "ptr") : ServiceHandle

        result := DllCall("HTTPAPI.dll\HttpQueryServiceConfiguration", "ptr", ServiceHandle, "int", ConfigId, "ptr", pInput, "uint", InputLength, "ptr", pOutput, "uint", OutputLength, "uint*", pReturnLength, "ptr", pOverlapped, "uint")
        return result
    }

    /**
     * 
     * @param {HTTPAPI_VERSION} Version 
     * @param {Integer} Extension 
     * @param {Pointer<Void>} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    static HttpGetExtension(Version, Extension, Buffer, BufferSize) {
        result := DllCall("HTTPAPI.dll\HttpGetExtension", "ptr", Version, "uint", Extension, "ptr", Buffer, "uint", BufferSize, "uint")
        return result
    }

;@endregion Methods
}
