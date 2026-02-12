#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines errors encountered during operations involving web services, such as authentication, proxy configuration, and destination URIs.
 * @remarks
 * A WebErrorStatus value is returned by [Windows.Web.WebError.GetStatus](weberror_getstatus_1856274933.md), [Windows.Networking.WebSocketError.GetStatus](../windows.networking.sockets/websocketerror_getstatus_1856274933.md), and [Windows.Networking.BackgroundTransfer.GetStatus](../windows.networking.backgroundtransfer/backgroundtransfererror_getstatus_1856274933.md).
 * 
 * This example demonstrates how to use WebErrorStatus to display a different error message depending on the type of error. In this example, the WebErrorStatus value is returned by [Windows.Networking.WebSocketError.GetStatus](../windows.networking.sockets/websocketerror_getstatus_1856274933.md).
 * 
 * ```csharp
 * using Windows.Web;
 * using Windows.Networking.Sockets;
 * 
 * // Pointer back to the main page. Needed to call methods in MainPage such as NotifyUser()
 * MainPage rootPage = MainPage.Current;
 * 
 * WebErrorStatus status = WebSocketError.GetStatus(ex.GetBaseException().HResult);
 * 
 * if (status == WebErrorStatus.CannotConnect ||
 *     status == WebErrorStatus.NotFound || 
 *     status == WebErrorStatus.RequestTimeout)
 * {
 *     rootPage.NotifyUser("Cannot connect to the server", NotifyType.ErrorMessage);
 * }
 * else
 * {
 *     rootPage.NotifyUser("Error: " + status, NotifyType.ErrorMessage);
 * }
 * ```
 * 
 * ```cppwinrt
 * // Pointer back to the main page. Needed to call methods in MainPage such as NotifyUser().
 * m_rootPage = MainPage::Current();
 * 
 * Windows::Web::WebErrorStatus status{ Windows::Networking::Sockets::WebSocketError::GetStatus(exception.to_abi()) };
 * 
 * if (status == Windows::Web::WebErrorStatus::CannotConnect ||
 *     status == Windows::Web::WebErrorStatus::NotFound ||
 *     status == Windows::Web::WebErrorStatus::RequestTimeout)
 * {
 *     m_rootPage.NotifyUser(L"Cannot connect to the server", NotifyType::ErrorMessage);
 * }
 * else
 * {
 *     m_rootPage.NotifyUser(std::wstring(L"Error: ") + exception.message().c_str(), NotifyType::ErrorMessage);
 * }
 * ```
 * 
 * ```cppcx
 * using namespace Windows::Web;
 * using namespace Windows::Networking::Sockets;
 * 
 * // Pointer back to the main page. Needed to call methods in MainPage such as NotifyUser()
 * rootPage = MainPage::Current;
 * 
 * WebErrorStatus status = WebSocketError::GetStatus(exception->HResult);
 * 
 * if (status == WebErrorStatus::CannotConnect || 
 *     status == WebErrorStatus::NotFound || 
 *     status == WebErrorStatus::RequestTimeout)
 * {
 *     rootPage->NotifyUser("Cannot connect to the server", NotifyType::ErrorMessage);
 * }
 * else
 * {
 *     rootPage->NotifyUser("Error: " + status.ToString(), NotifyType::ErrorMessage);
 * }
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.web.weberrorstatus
 * @namespace Windows.Web
 * @version WindowsRuntime 1.4
 */
class WebErrorStatus extends Win32Enum{

    /**
     * An unknown error has occurred.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The SSL certificate common name does not match the web address.
     * @type {Integer (Int32)}
     */
    static CertificateCommonNameIsIncorrect => 1

    /**
     * The SSL certificate has expired.
     * @type {Integer (Int32)}
     */
    static CertificateExpired => 2

    /**
     * The SSL certificate contains errors.
     * @type {Integer (Int32)}
     */
    static CertificateContainsErrors => 3

    /**
     * The SSL certificate has been revoked.
     * @type {Integer (Int32)}
     */
    static CertificateRevoked => 4

    /**
     * The SSL certificate is invalid.
     * @type {Integer (Int32)}
     */
    static CertificateIsInvalid => 5

    /**
     * The server is not responding.
     * @type {Integer (Int32)}
     */
    static ServerUnreachable => 6

    /**
     * The connection has timed out.
     * @type {Integer (Int32)}
     */
    static Timeout => 7

    /**
     * The server returned an invalid or unrecognized response.
     * @type {Integer (Int32)}
     */
    static ErrorHttpInvalidServerResponse => 8

    /**
     * The connection was aborted.
     * @type {Integer (Int32)}
     */
    static ConnectionAborted => 9

    /**
     * The connection was reset.
     * @type {Integer (Int32)}
     */
    static ConnectionReset => 10

    /**
     * The connection was ended.
     * @type {Integer (Int32)}
     */
    static Disconnected => 11

    /**
     * Redirected from a location to a secure location.
     * @type {Integer (Int32)}
     */
    static HttpToHttpsOnRedirection => 12

    /**
     * Redirected from a secure location to an unsecure location.
     * @type {Integer (Int32)}
     */
    static HttpsToHttpOnRedirection => 13

    /**
     * Cannot connect to destination.
     * @type {Integer (Int32)}
     */
    static CannotConnect => 14

    /**
     * Could not resolve provided host name.
     * @type {Integer (Int32)}
     */
    static HostNameNotResolved => 15

    /**
     * The operation was canceled.
     * @type {Integer (Int32)}
     */
    static OperationCanceled => 16

    /**
     * The request redirect failed.
     * @type {Integer (Int32)}
     */
    static RedirectFailed => 17

    /**
     * An unexpected status code indicating a failure was received.
     * @type {Integer (Int32)}
     */
    static UnexpectedStatusCode => 18

    /**
     * A request was unexpectedly redirected.
     * @type {Integer (Int32)}
     */
    static UnexpectedRedirection => 19

    /**
     * An unexpected client-side error has occurred.
     * @type {Integer (Int32)}
     */
    static UnexpectedClientError => 20

    /**
     * An unexpected server-side error has occurred.
     * @type {Integer (Int32)}
     */
    static UnexpectedServerError => 21

    /**
     * The request does not support the range.
     * @type {Integer (Int32)}
     */
    static InsufficientRangeSupport => 22

    /**
     * The request is mising the file size.
     * @type {Integer (Int32)}
     */
    static MissingContentLengthSupport => 23

    /**
     * The requested URL represents a high level grouping of which lower level selections need to be made.
     * @type {Integer (Int32)}
     */
    static MultipleChoices => 300

    /**
     * This and all future requests should be directed to the given URI.
     * @type {Integer (Int32)}
     */
    static MovedPermanently => 301

    /**
     * The resource was found but is available in a location different from the one included in the request.
     * @type {Integer (Int32)}
     */
    static Found => 302

    /**
     * The response to the request can be found under another URI using a GET method.
     * @type {Integer (Int32)}
     */
    static SeeOther => 303

    /**
     * Indicates the resource has not been modified since last requested.
     * @type {Integer (Int32)}
     */
    static NotModified => 304

    /**
     * The requested resource must be accessed through the proxy given by the Location field.
     * @type {Integer (Int32)}
     */
    static UseProxy => 305

    /**
     * The requested resource resides temporarily under a different URI.
     * @type {Integer (Int32)}
     */
    static TemporaryRedirect => 307

    /**
     * The request cannot be fulfilled due to bad syntax.
     * @type {Integer (Int32)}
     */
    static BadRequest => 400

    /**
     * Authentication has failed or credentials have not yet been provided.
     * @type {Integer (Int32)}
     */
    static Unauthorized => 401

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static PaymentRequired => 402

    /**
     * The server has refused the request.
     * @type {Integer (Int32)}
     */
    static Forbidden => 403

    /**
     * The requested resource could not be found but may be available again in the future.
     * @type {Integer (Int32)}
     */
    static NotFound => 404

    /**
     * A request was made of a resource using a request method not supported by that resource.
     * @type {Integer (Int32)}
     */
    static MethodNotAllowed => 405

    /**
     * The requested resource is only capable of generating content not acceptable according to the Accept headers sent in the request.
     * @type {Integer (Int32)}
     */
    static NotAcceptable => 406

    /**
     * The client must first authenticate itself with the proxy.
     * @type {Integer (Int32)}
     */
    static ProxyAuthenticationRequired => 407

    /**
     * The server timed out waiting for the request.
     * @type {Integer (Int32)}
     */
    static RequestTimeout => 408

    /**
     * Indicates that the request could not be processed because of conflict in the request.
     * @type {Integer (Int32)}
     */
    static Conflict => 409

    /**
     * Indicates that the resource requested is no longer available and will not be available again.
     * @type {Integer (Int32)}
     */
    static Gone => 410

    /**
     * The request did not specify the length of its content, which is required by the requested resource.
     * @type {Integer (Int32)}
     */
    static LengthRequired => 411

    /**
     * The server does not meet one of the preconditions that the requester put on the request.
     * @type {Integer (Int32)}
     */
    static PreconditionFailed => 412

    /**
     * The request is larger than the server is willing or able to process.
     * @type {Integer (Int32)}
     */
    static RequestEntityTooLarge => 413

    /**
     * Provided URI length exceeds the maximum length the server can process.
     * @type {Integer (Int32)}
     */
    static RequestUriTooLong => 414

    /**
     * The request entity has a media type which the server or resource does not support.
     * @type {Integer (Int32)}
     */
    static UnsupportedMediaType => 415

    /**
     * The client has asked for a portion of the file, but the server cannot supply that portion.
     * @type {Integer (Int32)}
     */
    static RequestedRangeNotSatisfiable => 416

    /**
     * The server cannot meet the requirements of the Expect request-header field.
     * @type {Integer (Int32)}
     */
    static ExpectationFailed => 417

    /**
     * A generic error message, given when no more specific message is suitable.
     * @type {Integer (Int32)}
     */
    static InternalServerError => 500

    /**
     * The server either does not recognize the request method, or it lacks the ability to fulfill the request.
     * @type {Integer (Int32)}
     */
    static NotImplemented => 501

    /**
     * The server was acting as a gateway or proxy and received an invalid response from the upstream server.
     * @type {Integer (Int32)}
     */
    static BadGateway => 502

    /**
     * The server is currently unavailable.
     * @type {Integer (Int32)}
     */
    static ServiceUnavailable => 503

    /**
     * The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.
     * @type {Integer (Int32)}
     */
    static GatewayTimeout => 504

    /**
     * The server does not support the HTTP protocol version used in the request.
     * @type {Integer (Int32)}
     */
    static HttpVersionNotSupported => 505
}
