#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines properties that you can assign to an outgoing HTTP request by calling the SetProperty method.
 * @see https://docs.microsoft.com/windows/win32/api//msxml6/ne-msxml6-xhr_property
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class XHR_PROPERTY extends Win32Enum{

    /**
     * Sets a flag in the HTTP request that suppresses automatic prompts for credentials.
     * @type {Integer (Int32)}
     */
    static XHR_PROP_NO_CRED_PROMPT => 0

    /**
     * Sets a flag in the HTTP request that configures the HTTP request that disables authentication for the request.
     * @type {Integer (Int32)}
     */
    static XHR_PROP_NO_AUTH => 1

    /**
     * Sets the connect, send, and receive timeouts for HTTP socket operations.
     * 
     * <div class="alert"><b>Note</b>  This value will not affect the timeout behavior of the entire request process.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static XHR_PROP_TIMEOUT => 2

    /**
     * Suppresses adding default headers to the HTTP request.
     * @type {Integer (Int32)}
     */
    static XHR_PROP_NO_DEFAULT_HEADERS => 3

    /**
     * Causes the HTTP stack to call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2callback-onheadersavailable">OnHeadersAvailable</a> callback method with an interim redirecting status code.  The <b>OnHeadersAvailable</b> will be called again for additional redirects and the final destination status code.
     * @type {Integer (Int32)}
     */
    static XHR_PROP_REPORT_REDIRECT_STATUS => 4

    /**
     * Suppresses cache reads and writes for the HTTP request.
     * @type {Integer (Int32)}
     */
    static XHR_PROP_NO_CACHE => 5

    /**
     * Causes the HTTP stack to provide <b>HRESULTS</b> with the underlying Win32 error code to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2callback-onerror">OnError</a> callback method in case of failure.
     * @type {Integer (Int32)}
     */
    static XHR_PROP_EXTENDED_ERROR => 6

    /**
     * Causes the query string to be encoded in UTF8 instead of ACP for HTTP request.
     * @type {Integer (Int32)}
     */
    static XHR_PROP_QUERY_STRING_UTF8 => 7

    /**
     * Suppresses certain certificate errors.
     * @type {Integer (Int32)}
     */
    static XHR_PROP_IGNORE_CERT_ERRORS => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XHR_PROP_ONDATA_THRESHOLD => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XHR_PROP_SET_ENTERPRISEID => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XHR_PROP_MAX_CONNECTIONS => 11
}
