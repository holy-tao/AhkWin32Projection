#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The HTTP_HEADER_ID enumeration type lists known headers for HTTP requests and responses, and associates an array index with each such header.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_header_id
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_HEADER_ID extends Win32Enum {

    /**
     * Used to specify caching behavior along the request or response chain, overriding the default caching algorithm.
     * Native name: HttpHeaderCacheControl
     * @type {Integer (Int32)}
     */
    static CacheControl => 0

    /**
     * Allows the sender to specify options that are desired for that particular connection. These are used for a single connection only and must not be communicated by proxies over further connections.
     * Native name: HttpHeaderConnection
     * @type {Integer (Int32)}
     */
    static Connection => 1

    /**
     * The Date is a general header field that indicates the time that the request or response was sent.
     * Native name: HttpHeaderDate
     * @type {Integer (Int32)}
     */
    static Date => 2

    /**
     * Based on the keepalive XML element (see <a href="https://www.ietf.org/rfc/rfc2518.txt">RFC 2518</a>, section 12.12.1, page 66); a list of URIs included in the KeepAlive
     *    header must be "live" after they are copied
     *    (moved) to the destination.
     * Native name: HttpHeaderKeepAlive
     * @type {Integer (Int32)}
     */
    static KeepAlive => 3

    /**
     * Used to include optional, implementation-specific directives that might apply to any recipient along the request/response chain.
     * Native name: HttpHeaderPragma
     * @type {Integer (Int32)}
     */
    static Pragma => 4

    /**
     * Indicates that specified header fields are present in the trailer of a message encoded with chunked transfer-coding.
     * Native name: HttpHeaderTrailer
     * @type {Integer (Int32)}
     */
    static Trailer => 5

    /**
     * Indicates what, if any, transformations have been applied to the message body in transit.
     * Native name: HttpHeaderTransferEncoding
     * @type {Integer (Int32)}
     */
    static TransferEncoding => 6

    /**
     * Allows the client to specify one or more other communication protocols it would prefer to use if the server can comply.
     * Native name: HttpHeaderUpgrade
     * @type {Integer (Int32)}
     */
    static Upgrade => 7

    /**
     * The Via header field indicates the path taken by the request.
     * Native name: HttpHeaderVia
     * @type {Integer (Int32)}
     */
    static Via => 8

    /**
     * This is a response header that contains the 3-digit warn code along with the reason phrase.
     * Native name: HttpHeaderWarning
     * @type {Integer (Int32)}
     */
    static Warning => 9

    /**
     * Lists the set of methods supported by the resource identified by the Request-URI.
     * Native name: HttpHeaderAllow
     * @type {Integer (Int32)}
     */
    static Allow => 10

    /**
     * The size of the message body in decimal bytes.
     * Native name: HttpHeaderContentLength
     * @type {Integer (Int32)}
     */
    static ContentLength => 11

    /**
     * The media type of the message body.
     * Native name: HttpHeaderContentType
     * @type {Integer (Int32)}
     */
    static ContentType => 12

    /**
     * The encoding scheme for the message body.
     * Native name: HttpHeaderContentEncoding
     * @type {Integer (Int32)}
     */
    static ContentEncoding => 13

    /**
     * Provides the natural language of the intended audience.
     * Native name: HttpHeaderContentLanguage
     * @type {Integer (Int32)}
     */
    static ContentLanguage => 14

    /**
     * Location of the resource for the entity enclosed in the message when that entity is accessible from a location separate from the requested resource's URI.
     * Native name: HttpHeaderContentLocation
     * @type {Integer (Int32)}
     */
    static ContentLocation => 15

    /**
     * An MD5 digest of the entity-body used to provide end-to-end message integrity check (MIC) of the entity-body.
     * Native name: HttpHeaderContentMd5
     * @type {Integer (Int32)}
     */
    static ContentMd5 => 16

    /**
     * The content range header is sent with a partial entity body to specify where in the full entity body the partial body should be applied.
     * Native name: HttpHeaderContentRange
     * @type {Integer (Int32)}
     */
    static ContentRange => 17

    /**
     * The date and time after which the message content expires.
     * Native name: HttpHeaderExpires
     * @type {Integer (Int32)}
     */
    static Expires => 18

    /**
     * Indicates the date and time at which the origin server believes the variant was last modified.
     * Native name: HttpHeaderLastModified
     * @type {Integer (Int32)}
     */
    static LastModified => 19

    /**
     * Used with the INVITE, OPTIONS, and REGISTER methods to indicate what media types are acceptable in the response.
     * Native name: HttpHeaderAccept
     * @type {Integer (Int32)}
     */
    static Accept => 20

    /**
     * Indicates the character sets that are acceptable for the response.
     * Native name: HttpHeaderAcceptCharset
     * @type {Integer (Int32)}
     */
    static AcceptCharset => 21

    /**
     * The content encodings that are acceptable in the response.
     * Native name: HttpHeaderAcceptEncoding
     * @type {Integer (Int32)}
     */
    static AcceptEncoding => 22

    /**
     * Used by the client to indicate to the server which language it would prefer to receive reason phrases, session descriptions, or status responses.
     * Native name: HttpHeaderAcceptLanguage
     * @type {Integer (Int32)}
     */
    static AcceptLanguage => 23

    /**
     * The user-agent can authenticate itself with a server by sending the Authorization request header field with the request. The field contains the credentials for the domain that the user is requesting.
     * Native name: HttpHeaderAuthorization
     * @type {Integer (Int32)}
     */
    static Authorization => 24

    /**
     * The cookie request header contains data used to maintain client state with the server. Cookie data is obtained from a response sent with <b>HttpHeaderSetCookie</b>.
     * Native name: HttpHeaderCookie
     * @type {Integer (Int32)}
     */
    static Cookie => 25

    /**
     * Indicates the specific server behaviors that are required by the client.
     * Native name: HttpHeaderExpect
     * @type {Integer (Int32)}
     */
    static Expect => 26

    /**
     * The From header field specifies the initiator of the SIP request or response message.
     * Native name: HttpHeaderFrom
     * @type {Integer (Int32)}
     */
    static From => 27

    /**
     * Specifies the Internet host and port number of the requested resource. This is obtained from the original URI given by the user or referring resource.
     * Native name: HttpHeaderHost
     * @type {Integer (Int32)}
     */
    static Host => 28

    /**
     * The If-Match request header field is used with a method to make it conditional. A client that has one or more entities previously obtained from the resource can verify that one of those entities is current by including a list of their associated entity tags in the If-Match header field.
     * Native name: HttpHeaderIfMatch
     * @type {Integer (Int32)}
     */
    static IfMatch => 29

    /**
     * The If-Modified-Since request header field is used with a method to make it conditional. If the requested variant has not been modified since the time specified in this field, an entity is  not  returned from the server; instead, a 304 (not modified) response is returned without any message-body.
     * Native name: HttpHeaderIfModifiedSince
     * @type {Integer (Int32)}
     */
    static IfModifiedSince => 30

    /**
     * The If-None-Match request-header field is used with a method to make
     *    it conditional. When a client has obtained one or more entities from a resource, it can verify that none of those entities is
     *    current by including a list of their associated entity tags in the
     *    If-None-Match header field. The purpose of this feature is to allow
     *    efficient updates of cached information with a minimum amount of
     *    transaction overhead, and to prevent a method such as PUT
     *    from inadvertently modifying an existing resource when the client
     *    believes that the resource does not exist.
     * Native name: HttpHeaderIfNoneMatch
     * @type {Integer (Int32)}
     */
    static IfNoneMatch => 31

    /**
     * If a client has a partial copy of an entity in its cache, and wishes
     *    to obtain an up-to-date copy of the entire entity, it
     *    can use the If-Range header. Informally, its meaning is, "if the entity is unchanged, send
     *    me the part(s) I am missing; otherwise, send me the entire new
     *    entity."
     * Native name: HttpHeaderIfRange
     * @type {Integer (Int32)}
     */
    static IfRange => 32

    /**
     * The If-Unmodified-Since request-header field is used with a method to
     *    make it conditional. If the requested resource has not been modified
     *    since the time specified in this field, the server performs the
     *    requested operation as if the If-Unmodified-Since header were not
     *    present, but
     * 
     *    if the requested resource has been modified,
     *    the server returns
     *    a 412 error (Precondition Failed).
     * Native name: HttpHeaderIfUnmodifiedSince
     * @type {Integer (Int32)}
     */
    static IfUnmodifiedSince => 33

    /**
     * The maximum number of proxies or gateways that can forward the request.
     * Native name: HttpHeaderMaxForwards
     * @type {Integer (Int32)}
     */
    static MaxForwards => 34

    /**
     * This header field is used by the client to identify itself with a proxy.
     * Native name: HttpHeaderProxyAuthorization
     * @type {Integer (Int32)}
     */
    static ProxyAuthorization => 35

    /**
     * Allows the client to specify, for the server's benefit, the address (URI) of the resource from which the Request-URI was obtained.
     * Native name: HttpHeaderReferer
     * @type {Integer (Int32)}
     */
    static Referer => 36

    /**
     * Allows a client to request a part of an entity instead of the whole.
     * Native name: HttpHeaderRange
     * @type {Integer (Int32)}
     */
    static Range => 37

    /**
     * This header field contains the recipient of the SIP request or response message.
     * Native name: HttpHeaderTe
     * @type {Integer (Int32)}
     */
    static Te => 38

    /**
     * Allows the client to specify whether it wants the source representation or programmatic interpretation of the requested content.
     * Native name: HttpHeaderTranslate
     * @type {Integer (Int32)}
     */
    static Translate => 39

    /**
     * Indicates what extension transfer-codings the client accepts in the response and whether or not the client  accepts trailer fields in a chunked transfer-coding.
     * Native name: HttpHeaderUserAgent
     * @type {Integer (Int32)}
     */
    static UserAgent => 40

    /**
     * Not a value that actually designates a header; instead, it is used to count the enumerated Request headers.
     * Native name: HttpHeaderRequestMaximum
     * @type {Integer (Int32)}
     */
    static RequestMaximum => 41

    /**
     * Allows the server to indicate its acceptance of range requests for a resource.
     * Native name: HttpHeaderAcceptRanges
     * @type {Integer (Int32)}
     */
    static AcceptRanges => 20

    /**
     * Conveys the sender's estimate of the amount of time since the response (or its revalidation) was generated at the origin server.
     * Native name: HttpHeaderAge
     * @type {Integer (Int32)}
     */
    static Age => 21

    /**
     * Provides the current value of the entity tag for the requested variant.
     * Native name: HttpHeaderEtag
     * @type {Integer (Int32)}
     */
    static Etag => 22

    /**
     * Used to redirect the recipient to a location other than the Request-URI for completion of the request or identification of a new resource.
     * Native name: HttpHeaderLocation
     * @type {Integer (Int32)}
     */
    static Location => 23

    /**
     * The response field that must be included as a part of the 407 response. The field includes the authentication scheme and parameters that apply to the proxy for this Request-URI.
     * Native name: HttpHeaderProxyAuthenticate
     * @type {Integer (Int32)}
     */
    static ProxyAuthenticate => 24

    /**
     * The length of time that the service is expected to be unavailable to the requesting client.
     * Native name: HttpHeaderRetryAfter
     * @type {Integer (Int32)}
     */
    static RetryAfter => 25

    /**
     * This is a response header field that contains information about the server that is handling the request.
     * Native name: HttpHeaderServer
     * @type {Integer (Int32)}
     */
    static Server => 26

    /**
     * The <b>set-cookie</b> response header contains data used to maintain client state in future requests sent with <b>HttpHeaderCookie</b>.
     * Native name: HttpHeaderSetCookie
     * @type {Integer (Int32)}
     */
    static SetCookie => 27

    /**
     * Indicates the set of request header fields that fully determines, while the response is fresh, whether a cache is permitted to use the response to reply to a subsequent request without revalidation.
     * Native name: HttpHeaderVary
     * @type {Integer (Int32)}
     */
    static Vary => 28

    /**
     * The WWW_Authenticate header field contains the authentication schemes and parameters applicable to the Request-URI.
     * Native name: HttpHeaderWwwAuthenticate
     * @type {Integer (Int32)}
     */
    static WwwAuthenticate => 29

    /**
     * Not a value that actually designates a header; instead, it is used to count the enumerated Response headers.
     * Native name: HttpHeaderResponseMaximum
     * @type {Integer (Int32)}
     */
    static ResponseMaximum => 30

    /**
     * Not a value that actually designates a header; instead, it is used to count all the enumerated headers.
     * Native name: HttpHeaderMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 41
}
