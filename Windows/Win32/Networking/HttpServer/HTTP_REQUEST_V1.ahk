#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_TRANSPORT_ADDRESS.ahk" { HTTP_TRANSPORT_ADDRESS }
#Import ".\HTTP_VERSION.ahk" { HTTP_VERSION }
#Import ".\HTTP_SSL_INFO.ahk" { HTTP_SSL_INFO }
#Import ".\HTTP_REQUEST_HEADERS.ahk" { HTTP_REQUEST_HEADERS }
#Import ".\HTTP_UNKNOWN_HEADER.ahk" { HTTP_UNKNOWN_HEADER }
#Import ".\HTTP_KNOWN_HEADER.ahk" { HTTP_KNOWN_HEADER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_COOKED_URL.ahk" { HTTP_COOKED_URL }
#Import "..\WinSock\SOCKADDR.ahk" { SOCKADDR }
#Import ".\HTTP_VERB.ahk" { HTTP_VERB }
#Import ".\HTTP_DATA_CHUNK.ahk" { HTTP_DATA_CHUNK }

/**
 * Uses the HTTP_REQUEST structure to return data associated with a specific request.
 * @remarks
 * The unprocessed URL contained in the <b>pRawUrl</b> member is for tracking and statistical purposes only. For other purposes, use the processed, canonical URL contained in the <b>CookedUrl</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_request_v1
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_V1 {
    #StructPack 8

    /**
     * A combination of zero or more of the following flag values may be combined, with OR, as appropriate.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_REQUEST_FLAG_MORE_ENTITY_BODY_EXISTS"></a><a id="http_request_flag_more_entity_body_exists"></a><dl>
     * <dt><b>HTTP_REQUEST_FLAG_MORE_ENTITY_BODY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is more entity body to be read for this request. This applies only to incoming requests that span multiple reads. 
     * 
     * If this value is not set, either the whole entity body was copied into the buffer specified by <b>pEntityChunks</b> or the request did not include an entity body.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_REQUEST_FLAG_IP_ROUTED"></a><a id="http_request_ip_routed"></a><dl>
     * <dt><b>HTTP_REQUEST_FLAG_IP_ROUTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request was routed based on host and IP binding. The application should  reflect the local IP while flushing kernel
     *  cache entries for this request.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>This flag is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HTTP_REQUEST_FLAG_HTTP2"></a><a id="http_request_flag_http2"></a><dl>
     * <dt><b>HTTP_REQUEST_FLAG_HTTP2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the request was received over HTTP/2.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Flags : UInt32

    /**
     * An identifier for the connection on which the request was received. Use this value when calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpwaitfordisconnect">HttpWaitForDisconnect</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceiveclientcertificate">HttpReceiveClientCertificate</a>.
     */
    ConnectionId : Int64

    /**
     * A value used to identify the request when calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceiverequestentitybody">HttpReceiveRequestEntityBody</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendhttpresponse">HttpSendHttpResponse</a>, and/or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsendresponseentitybody">HttpSendResponseEntityBody</a>.
     */
    RequestId : Int64

    /**
     * The context that is associated with the URL in the <i>pRawUrl</i> parameter.
     * 
     * <b>Windows Server 2003 with SP1 and Windows XP with SP2:  </b>
     */
    UrlContext : Int64

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_version">HTTP_VERSION</a> structure that contains the version of HTTP specified by this request.
     */
    Version : HTTP_VERSION

    /**
     * An HTTP verb associated with this request. This member can be one of the values from the  
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_verb">HTTP_VERB</a> enumeration.
     */
    Verb : HTTP_VERB

    /**
     * If the <b>Verb</b> member contains a value equal to <b>HttpVerbUnknown</b>, the <b>UnknownVerbLength</b> member contains the size, in bytes, of the string pointed to by the <b>pUnknownVerb</b> member, not including the terminating null character. If <b>Verb</b> is not equal to <b>HttpVerbUnknown</b>, <b>UnknownVerbLength</b> is equal to zero.
     */
    UnknownVerbLength : UInt16

    /**
     * The size, in bytes, of the unprocessed URL string pointed to by the <b>pRawUrl</b> member, not including the terminating null character.
     */
    RawUrlLength : UInt16

    /**
     * If the <b>Verb</b> member is equal to <b>HttpVerbUnknown</b>, <b>pUnknownVerb</b>, points to a null-terminated string of octets that contains the HTTP verb for this request; otherwise, the application ignores this parameter.
     */
    pUnknownVerb : PSTR

    /**
     * A pointer to a string of octets that contains the original, unprocessed URL targeted by this request.  Use this unprocessed URL only for tracking or statistical purposes; the  <b>CookedUrl</b> member contains the canonical form of the URL for general use.
     */
    pRawUrl : PSTR

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_cooked_url">HTTP_COOKED_URL</a> structure that contains a parsed canonical wide-character version of the URL targeted by this request. This is the version of the URL HTTP Listeners should act upon, rather than the raw URL.
     */
    CookedUrl : HTTP_COOKED_URL

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_transport_address">HTTP_TRANSPORT_ADDRESS</a> structure that contains the transport addresses for the connection for this request.
     */
    Address : HTTP_TRANSPORT_ADDRESS

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_request_headers">HTTP_REQUEST_HEADERS</a> structure that contains the headers specified in this request.
     */
    Headers : HTTP_REQUEST_HEADERS

    /**
     * The total number of bytes received from the network comprising this request.
     */
    BytesReceived : Int64

    /**
     * The number of elements in the <b>pEntityChunks</b> array. If no entity body was copied, this value is zero.
     */
    EntityChunkCount : UInt16

    /**
     * A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_data_chunk">HTTP_DATA_CHUNK</a> structures that contains the data blocks making up the entity body. 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpreceivehttprequest">HttpReceiveHttpRequest</a> does not copy the entity body unless called with the HTTP_RECEIVE_REQUEST_FLAG_COPY_BODY flag set.
     */
    pEntityChunks : HTTP_DATA_CHUNK.Ptr

    /**
     * Raw connection ID for an Secure Sockets Layer (SSL) request.
     */
    RawConnectionId : Int64

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_ssl_info">HTTP_SSL_INFO</a> structure that contains Secure Sockets Layer (SSL) information about the connection on which the request was received.
     */
    pSslInfo : HTTP_SSL_INFO.Ptr

}
