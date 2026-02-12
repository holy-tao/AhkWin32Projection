#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains the values of status codes defined for HTTP in the response to an HTTP request.
 * @remarks
 * The HttpStatusCode enumeration contains the values of the status codes defined by the IETF in [RFC 2616](https://tools.ietf.org/html/rfc2616) for HTTP 1.1 and related RFCs.
 * 
 * The status of an HTTP request is contained in the [StatusCode](httpresponsemessage_statuscode.md) property on the [HttpResponseMessage](httpresponsemessage.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpstatuscode
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpStatusCode extends Win32Enum{

    /**
     * The client request wasn't successful.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The client should continue with its request.
     * @type {Integer (Int32)}
     */
    static Continue => 100

    /**
     * The HTTP protocol version or protocol is being changed.
     * @type {Integer (Int32)}
     */
    static SwitchingProtocols => 101

    /**
     * The server has received a Web Distributed Authoring and Versioning (WebDAV) request and is processing the request.
     * 
     * This status code is an HTTP extension used with WebDAV. It can only be returned if the client HTTP request included the DAV header in the request. This status code is documented in IETF [RFC 2518](https://tools.ietf.org/html/rfc2518).
     * @type {Integer (Int32)}
     */
    static Processing => 102

    /**
     * The request succeeded and that the requested information is in the response. This is the most common status code to receive.
     * @type {Integer (Int32)}
     */
    static Ok => 200

    /**
     * The request resulted in a new resource created before the response was sent.
     * @type {Integer (Int32)}
     */
    static Created => 201

    /**
     * The request has been accepted for further processing.
     * @type {Integer (Int32)}
     */
    static Accepted => 202

    /**
     * The returned meta-information is from a cached copy instead of the origin server and therefore may be incorrect.
     * @type {Integer (Int32)}
     */
    static NonAuthoritativeInformation => 203

    /**
     * The request has been successfully processed and that the response is intentionally blank.
     * @type {Integer (Int32)}
     */
    static NoContent => 204

    /**
     * The client should reset (not reload) the current resource.
     * @type {Integer (Int32)}
     */
    static ResetContent => 205

    /**
     * The response is a partial response as requested by a **GET** request that includes a byte range.
     * @type {Integer (Int32)}
     */
    static PartialContent => 206

    /**
     * The response provides status for multiple independent operations. Specific error messages appear in the body of the multi- status response.
     * 
     * This status code is an HTTP extension used with Web Distributed Authoring and Versioning (WebDAV). This status code is documented in IETF [RFC 4918](https://tools.ietf.org/html/rfc4918).
     * @type {Integer (Int32)}
     */
    static MultiStatus => 207

    /**
     * Some of the results of the requested operation were already reported.
     * 
     * This status code is an HTTP extension used with Web Distributed Authoring and Versioning (WebDAV). It can only be returned if the client HTTP request included the DAV header in the request. This status code is documented in IETF [RFC 5842](https://tools.ietf.org/html/rfc5842).
     * @type {Integer (Int32)}
     */
    static AlreadyReported => 208

    /**
     * The server has fulfilled a **GET** request for the resource and the response is the result of one or more actions applied to the current instance.
     * 
     * This status code is documented in IETF [RFC 3229](https://tools.ietf.org/html/rfc3229).
     * @type {Integer (Int32)}
     */
    static IMUsed => 226

    /**
     * The requested information has multiple representations. The default action is to treat this status as a redirect and follow the contents of the **Location** header associated with this response.
     * @type {Integer (Int32)}
     */
    static MultipleChoices => 300

    /**
     * The requested information has been moved to the URI specified in the **Location** header. The default action when this status is received is to follow the **Location** header associated with the response.
     * @type {Integer (Int32)}
     */
    static MovedPermanently => 301

    /**
     * The requested information is located at the URI specified in the **Location** header. The default action when this status is received is to follow the **Location** header associated with the response. When the original request method was **POST**, the redirected request will use the **GET** method.
     * @type {Integer (Int32)}
     */
    static Found => 302

    /**
     * Automatically redirects the client to the URI specified in the **Location** header as the result of a **POST**. The request to the resource specified by the **Location** header will be made with the **GET** method.
     * @type {Integer (Int32)}
     */
    static SeeOther => 303

    /**
     * The client's cached copy is up to date. The contents of the resource are not transferred.
     * @type {Integer (Int32)}
     */
    static NotModified => 304

    /**
     * The request should use the proxy server at the URI specified in the **Location** header.
     * @type {Integer (Int32)}
     */
    static UseProxy => 305

    /**
     * The request information is located at the URI specified in the **Location** header. The default action when this status is received is to follow the **Location** header associated with the response. When the original request method was **POST**, the redirected request will also use the **POST** method.
     * @type {Integer (Int32)}
     */
    static TemporaryRedirect => 307

    /**
     * The target resource has been assigned a new permanent URI and any future references to this resource should use one of the returned URIs specified in the **Location** header.
     * 
     * This status code is documented in IETF draft [draft-reschke-http-status-308](https://tools.ietf.org/html/draft-reschke-http-status-308-07).
     * @type {Integer (Int32)}
     */
    static PermanentRedirect => 308

    /**
     * The request could not be understood by the server. This status code is sent when no other error is applicable, or if the exact error is unknown or does not have its own error code.
     * @type {Integer (Int32)}
     */
    static BadRequest => 400

    /**
     * The requested resource requires authentication. The **WWW-Authenticate** header contains the details of how to perform the authentication.
     * @type {Integer (Int32)}
     */
    static Unauthorized => 401

    /**
     * This code is reserved for future use.
     * @type {Integer (Int32)}
     */
    static PaymentRequired => 402

    /**
     * The server refuses to fulfill the request.
     * @type {Integer (Int32)}
     */
    static Forbidden => 403

    /**
     * The requested resource does not exist on the server.
     * @type {Integer (Int32)}
     */
    static NotFound => 404

    /**
     * The HTTP method in the request is not allowed on the requested resource.
     * @type {Integer (Int32)}
     */
    static MethodNotAllowed => 405

    /**
     * The client has indicated with **Accept** headers that it will not accept any of the available representations of the resource.
     * @type {Integer (Int32)}
     */
    static NotAcceptable => 406

    /**
     * The requested proxy requires authentication. The **Proxy-Authenticate** header contains the details of how to perform the authentication.
     * @type {Integer (Int32)}
     */
    static ProxyAuthenticationRequired => 407

    /**
     * The client did not send a request within the time the server was expecting the request.
     * @type {Integer (Int32)}
     */
    static RequestTimeout => 408

    /**
     * The request could not be carried out because of a conflict on the server.
     * @type {Integer (Int32)}
     */
    static Conflict => 409

    /**
     * The requested resource is no longer available.
     * @type {Integer (Int32)}
     */
    static Gone => 410

    /**
     * The required **Content-Length** header is missing.
     * @type {Integer (Int32)}
     */
    static LengthRequired => 411

    /**
     * A condition set for this request failed, and the request cannot be carried out. Conditions are set with conditional request headers like **If-Match**, **If-None-Match**, or **If-Unmodified-Since**.
     * @type {Integer (Int32)}
     */
    static PreconditionFailed => 412

    /**
     * The request is too large for the server to process.
     * @type {Integer (Int32)}
     */
    static RequestEntityTooLarge => 413

    /**
     * The URI is too long.
     * @type {Integer (Int32)}
     */
    static RequestUriTooLong => 414

    /**
     * The request is an unsupported type.
     * @type {Integer (Int32)}
     */
    static UnsupportedMediaType => 415

    /**
     * The range of data requested from the resource cannot be returned, either because the beginning of the range is before the beginning of the resource, or the end of the range is after the end of the resource.
     * @type {Integer (Int32)}
     */
    static RequestedRangeNotSatisfiable => 416

    /**
     * An expectation given in an **Expect** header could not be met by the server.
     * @type {Integer (Int32)}
     */
    static ExpectationFailed => 417

    /**
     * The server understands the content type of the request entity and the syntax of the request entity is correct, but the server was unable to process the contained instructions.
     * 
     * This status code is an HTTP extension used with Web Distributed Authoring and Versioning (WebDAV). This status code is documented in IETF [RFC 4918](https://tools.ietf.org/html/rfc4918).
     * @type {Integer (Int32)}
     */
    static UnprocessableEntity => 422

    /**
     * The source or destination resource of a method is locked. This response should contain an appropriate precondition or post-condition code.
     * 
     * This status code is an HTTP extension used with Web Distributed Authoring and Versioning (WebDAV). This status code is documented in IETF [RFC 4918](https://tools.ietf.org/html/rfc4918).
     * @type {Integer (Int32)}
     */
    static Locked => 423

    /**
     * The method could not be performed on the resource because the requested action depended on another action and that action failed.
     * 
     * This status code is an HTTP extension used with Web Distributed Authoring and Versioning (WebDAV). This status code is documented in IETF [RFC 4918](https://tools.ietf.org/html/rfc4918).
     * @type {Integer (Int32)}
     */
    static FailedDependency => 424

    /**
     * The client should switch to a different protocol such as TLS/1.0.
     * 
     * This status code is documented in IETF [RFC 2917](https://tools.ietf.org/html/rfc2817).
     * @type {Integer (Int32)}
     */
    static UpgradeRequired => 426

    /**
     * The origin server requires the request to be conditional.
     * 
     * This status code is documented in IETF [RFC 6585](https://tools.ietf.org/html/rfc6585).
     * @type {Integer (Int32)}
     */
    static PreconditionRequired => 428

    /**
     * The user has sent too many requests in a given amount of time. The response should include details explaining the condition, and may include a **Retry-After** header indicating how long to wait before making a new request.
     * 
     * This status code is documented in IETF [RFC 6585](https://tools.ietf.org/html/rfc6585).
     * @type {Integer (Int32)}
     */
    static TooManyRequests => 429

    /**
     * The server is unwilling to process the request because its header fields are too large. The request may be resubmitted after reducing the size of the request header fields.
     * 
     * This status code is documented in IETF [RFC 6585](https://tools.ietf.org/html/rfc6585).
     * @type {Integer (Int32)}
     */
    static RequestHeaderFieldsTooLarge => 431

    /**
     * A generic error has occurred on the server.
     * @type {Integer (Int32)}
     */
    static InternalServerError => 500

    /**
     * The server does not support the requested function.
     * @type {Integer (Int32)}
     */
    static NotImplemented => 501

    /**
     * An intermediate proxy server received a bad response from another proxy or the origin server.
     * @type {Integer (Int32)}
     */
    static BadGateway => 502

    /**
     * The server is temporarily unavailable, usually due to high load or maintenance.
     * @type {Integer (Int32)}
     */
    static ServiceUnavailable => 503

    /**
     * An intermediate proxy server timed out while waiting for a response from another proxy or the origin server.
     * @type {Integer (Int32)}
     */
    static GatewayTimeout => 504

    /**
     * The requested HTTP version is not supported by the server.
     * @type {Integer (Int32)}
     */
    static HttpVersionNotSupported => 505

    /**
     * The server has an internal configuration error. The chosen variant resource is configured to engage in transparent content negotiation itself, and is therefore not a proper end point in the negotiation process.
     * 
     * This status code is documented in IETF [RFC 2295](https://tools.ietf.org/html/rfc2295).
     * @type {Integer (Int32)}
     */
    static VariantAlsoNegotiates => 506

    /**
     * The method could not be performed on the resource because the server is unable to store the representation needed to successfully complete the request. This condition is considered to be temporary.
     * 
     * This status code is an HTTP extension used with Web Distributed Authoring and Versioning (WebDAV). This status code is documented in IETF [RFC 4918](https://tools.ietf.org/html/rfc4918).
     * @type {Integer (Int32)}
     */
    static InsufficientStorage => 507

    /**
     * The server terminated an operation because it encountered an infinite loop while processing a request. This status indicates that the entire operation failed.
     * 
     * This status code is an HTTP extension used with Web Distributed Authoring and Versioning (WebDAV). It can only be returned if the client HTTP request included the DAV header in the request. This status code is documented in IETF [RFC 5842](https://tools.ietf.org/html/rfc5842).
     * @type {Integer (Int32)}
     */
    static LoopDetected => 508

    /**
     * The policy for accessing the resource has not been met in the request.
     * 
     * This status code is documented in IETF [RFC 2774](https://tools.ietf.org/html/rfc2774).
     * @type {Integer (Int32)}
     */
    static NotExtended => 510

    /**
     * The server indicates that the client needs to authenticate to gain network access. The response should contain a link to a resource that allows the user to submit credentials.
     * 
     * This status code is documented in IETF [RFC 6585](https://tools.ietf.org/html/rfc6585).
     * @type {Integer (Int32)}
     */
    static NetworkAuthenticationRequired => 511
}
