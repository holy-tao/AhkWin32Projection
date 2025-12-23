#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The HTTP_503_RESPONSE_VERBOSITY enumeration defines the verbosity levels for a 503, service unavailable, error responses.This structure must be used when setting or querying the HttpServer503ResponseProperty on a request queue.
 * @remarks
 * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetrequestqueueproperty">HttpSetRequestQueueProperty</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryrequestqueueproperty">HttpQueryrequestQueueProperty</a> to set and query the 503  response verbosity. The <i>pPropertyInformation</i> parameter points to a member of the <b>HTTP_503_RESPONSE_VERBOSITY</b> enumeration when the <i>Property</i> parameter is <b>HttpServer503VerbosityProperty</b>.
 * 
 * This enumeration defines the verbosity level for a request queue when sending 503 (Service Unavailable) error responses. Note that the 503 response level set using the <b>HTTP_503_RESPONSE_VERBOSITY</b>  enumeration only affects the error responses generated internally
 *  by the HTTP Server API.
 * 
 * 
 * <div class="alert"><b>Note</b>  Disclosing information about the state of the service to potentially unsafe clients may pose a security risk.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_503_response_verbosity
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_503_RESPONSE_VERBOSITY extends Win32Enum{

    /**
     * A 503 response is not sent; the connection is reset.
     *     This is the default HTTP Server API behavior.
     * @type {Integer (Int32)}
     */
    static Http503ResponseVerbosityBasic => 0

    /**
     * The HTTP Server API sends a 503 response with a "Service Unavailable" reason phrase. The HTTP Server closes the TCP connection after sending the response, so the client has to re-connect.
     * @type {Integer (Int32)}
     */
    static Http503ResponseVerbosityLimited => 1

    /**
     * The HTTP Server API sends a 503 response with a detailed reason phrase. The HTTP Server closes the TCP connection after sending the response, so the client has to re-connect.
     * @type {Integer (Int32)}
     */
    static Http503ResponseVerbosityFull => 2
}
