#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides the methods and properties needed to configure and send HTTP requests and use callbacks to receive notifications during HTTP response processing. Note  This interface is supported on Windows Phone 8.1.  .
 * @remarks
 * 
 * The <b>IXMLHTTPRequest2</b> interface is extended by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3">IXMLHTTPRequest3</a> interface. The <b>IXMLHTTPRequest3</b> inherits all the methods and properties of the <b>IXMLHTTPRequest2</b> interface.
 * 
 * The <b>IXMLHTTPRequest2</b> interface configures and sends HTTP request operations and uses  callbacks  to receive notifications  during response processing. The <b>IXMLHTTPRequest2</b> allows applications to run in a Multi Threaded Apartment (MTA), a requirement for running under the Windows Runtime (WinRT).
 * 
 * The <b>IXMLHTTPRequest2</b> interface supports the following features:
 * 
 * 
 * <ul>
 * <li>Set properties on outgoing HTTP requests.</li>
 * <li>Set cookies in the HTTP cookie jar for use in outgoing HTTP requests.</li>
 * <li>Get cookies from the HTTP cookie jar.</li>
 * <li>Process incoming HTTP response data before the HTTP response has finished downloading.</li>
 * <li>Create custom streams to receive HTTP responses.</li>
 * </ul>
 * 
 * 
 * <b>IXMLHTTPRequest2</b> implements a callback model for event handling. Because <b>IXMLHTTPRequest2</b> methods allow only asynchronous method calls, to receive completion callbacks an application must pass a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2callback">IXMLHTTPRequest2Callback</a> object when it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2-open">IXMLHTTPRequest2::Open</a> method to create an HTTP request.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msxml6/nn-msxml6-ixmlhttprequest2
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLHTTPRequest2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLHTTPRequest2
     * @type {Guid}
     */
    static IID => Guid("{e5d37dc0-552a-4d52-9cc0-a14d546fbd04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Send", "Abort", "SetCookie", "SetCustomResponseStream", "SetProperty", "SetRequestHeader", "GetAllResponseHeaders", "GetCookie", "GetResponseHeader"]

    /**
     * Initializes an IXMLHTTPRequest2 request and specifies the method, URL, and authentication information for the request. After calling this method, you must call the Send method to send the request and data, if any, to the server.
     * @param {PWSTR} pwszMethod The HTTP method used to open the connection, such as <b>GET</b> or <b>POST</b>. For XMLHTTP, this parameter is not case-sensitive.
     * @param {PWSTR} pwszUrl The requested URL. This must be an absolute URL, such as "http://Myserver/Mypath/Myfile.asp".
     * @param {IXMLHTTPRequest2Callback} pStatusCallback A callback interface implemented by the app that is to receive callback events. 
     * 
     * When the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2-send">Send Method</a> is successful, the methods on this interface are called to process the response or other events.
     * @param {PWSTR} pwszUserName The name of the user for authentication. If this parameter is a Null and the site requires authentication, credentials will be managed by Windows, including displaying a logon UI, unless disabled by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2-setproperty">SetProperty</a>.
     * @param {PWSTR} pwszPassword The password for authentication. This parameter is ignored if the <i>pwszUserName</i> parameter is Null or missing.
     * @param {PWSTR} pwszProxyUserName The name of the user for authentication on the proxy server. If this parameter is a Null or empty string and the site requires authentication, credentials will be managed by Windows, including displaying a logon UI, unless disabled by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2-setproperty">SetProperty</a>.
     * @param {PWSTR} pwszProxyPassword The password for authentication on the proxy server. This parameter is ignored if the <i>pwszProxyUserName</i> parameter is Null or missing.
     * @returns {HRESULT} Returns <b>S_OK</b> on success.
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2-open
     */
    Open(pwszMethod, pwszUrl, pStatusCallback, pwszUserName, pwszPassword, pwszProxyUserName, pwszProxyPassword) {
        pwszMethod := pwszMethod is String ? StrPtr(pwszMethod) : pwszMethod
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl
        pwszUserName := pwszUserName is String ? StrPtr(pwszUserName) : pwszUserName
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword
        pwszProxyUserName := pwszProxyUserName is String ? StrPtr(pwszProxyUserName) : pwszProxyUserName
        pwszProxyPassword := pwszProxyPassword is String ? StrPtr(pwszProxyPassword) : pwszProxyPassword

        result := ComCall(3, this, "ptr", pwszMethod, "ptr", pwszUrl, "ptr", pStatusCallback, "ptr", pwszUserName, "ptr", pwszPassword, "ptr", pwszProxyUserName, "ptr", pwszProxyPassword, "HRESULT")
        return result
    }

    /**
     * Sends an HTTP request to the server asynchronously. On success, methods on the IXMLHTTPRequest2Callback interface implemented by the app are called to process the response.
     * @param {ISequentialStream} pBody The body of the message being sent with the request. This stream is read in order to upload data for non-<b>GET</b> requests. For requests that do not require uploading, set this parameter to NULL.
     * @param {Integer} cbBody The length, in bytes, of the message being sent with the request. For requests that do not require uploading, set this parameter to 0.
     * @returns {HRESULT} Returns <b>S_OK</b> on success.
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2-send
     */
    Send(pBody, cbBody) {
        result := ComCall(4, this, "ptr", pBody, "uint", cbBody, "HRESULT")
        return result
    }

    /**
     * Cancels the current HTTP request.
     * @returns {HRESULT} Returns <b>S_OK</b> on success.
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2-abort
     */
    Abort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Sets a cookie associated with the specified URL in the HTTP cookie jar.
     * @param {Pointer<XHR_COOKIE>} pCookie A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msxml6/ns-msxml6-xhr_cookie">XHR_COOKIE</a> structure that specifies the cookie and properties of the cookie to be associated with  the specified URL.
     * @returns {Integer} A pointer to a value that indicates the cookie state if the call completes successfully. 
     * 
     * This parameter can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/msxml6/ne-msxml6-xhr_cookie_state">XHR_COOKIE_STATE</a> enumeration type defined in the <i>Msxml6.h</i>  header file.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_STATE_UNKNOWN"></a><a id="xhr_cookie_state_unknown"></a><dl>
     * <dt><b>XHR_COOKIE_STATE_UNKNOWN</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_STATE_ACCEPT"></a><a id="xhr_cookie_state_accept"></a><dl>
     * <dt><b>XHR_COOKIE_STATE_ACCEPT</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cookie was accepted.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_STATE_PROMPT"></a><a id="xhr_cookie_state_prompt"></a><dl>
     * <dt><b>XHR_COOKIE_STATE_PROMPT</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user is prompted to accept or refuse the cookie.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_STATE_LEASH"></a><a id="xhr_cookie_state_leash"></a><dl>
     * <dt><b>XHR_COOKIE_STATE_LEASH</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cookie is accepted only in the first-party context.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_STATE_DOWNGRADE"></a><a id="xhr_cookie_state_downgrade"></a><dl>
     * <dt><b>XHR_COOKIE_STATE_DOWNGRADE</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cookie was accepted and became session cookie.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_COOKIE_STATE_REJECT"></a><a id="xhr_cookie_state_reject"></a><dl>
     * <dt><b>XHR_COOKIE_STATE_REJECT</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cookie was rejected.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2-setcookie
     */
    SetCookie(pCookie) {
        result := ComCall(6, this, "ptr", pCookie, "uint*", &pdwCookieState := 0, "HRESULT")
        return pdwCookieState
    }

    /**
     * Provides a custom stream to replace the standard stream for receiving an HTTP response.
     * @param {ISequentialStream} pSequentialStream Custom stream that will receive the HTTP response. <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-isequentialstream">ISequentialStream</a>
     * @returns {HRESULT} Returns <b>S_OK</b> on success.
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2-setcustomresponsestream
     */
    SetCustomResponseStream(pSequentialStream) {
        result := ComCall(7, this, "ptr", pSequentialStream, "HRESULT")
        return result
    }

    /**
     * Sets a property on an outgoing HTTP request.
     * @param {Integer} eProperty The following values are valid:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_NO_CRED_PROMPT"></a><a id="xhr_prop_no_cred_prompt"></a><dl>
     * <dt><b>XHR_PROP_NO_CRED_PROMPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppresses automatic prompts for user credentials
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_NO_AUTH"></a><a id="xhr_prop_no_auth"></a><dl>
     * <dt><b>XHR_PROP_NO_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppresses authentication that the HTTP stack performs on behalf of the application
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_TIMEOUT"></a><a id="xhr_prop_timeout"></a><dl>
     * <dt><b>XHR_PROP_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets all timeout values to the value given by <i>ullValue</i>, in milliseconds.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_NO_DEFAULT_HEADERS"></a><a id="xhr_prop_no_default_headers"></a><dl>
     * <dt><b>XHR_PROP_NO_DEFAULT_HEADERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppresses adding default headers to the HTTP request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_REPORT_REDIRECT_STATUS"></a><a id="xhr_prop_report_redirect_status"></a><dl>
     * <dt><b>XHR_PROP_REPORT_REDIRECT_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the HTTP stack to call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2callback-onheadersavailable">OnHeadersAvailable</a> method with an interim redirecting status code.  The <b>OnHeadersAvailable</b> method will be called again for additional redirects and the final destination status code.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_NO_CACHE"></a><a id="xhr_prop_no_cache"></a><dl>
     * <dt><b>XHR_PROP_NO_CACHE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppresses cache reads and writes for the HTTP request.
     * 
     * This property is supported by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3">IXMLHTTPRequest3</a> interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_EXTENDED_ERROR"></a><a id="xhr_prop_extended_error"></a><dl>
     * <dt><b>XHR_PROP_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the HTTP stack to provide HRESULTS with the underlying Win32 error code to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2callback-onerror">OnError</a> method in case of failure.
     * 
     * This property is supported by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3">IXMLHTTPRequest3</a> interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_QUERY_STRING_UTF8_"></a><a id="xhr_prop_query_string_utf8_"></a><dl>
     * <dt><b>XHR_PROP_QUERY_STRING_UTF8 </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the query string to be encoded in UTF-8 instead of ACP for the HTTP request.
     * 
     * This property is supported by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3">IXMLHTTPRequest3</a> interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_IGNORE_CERT_ERRORS"></a><a id="xhr_prop_ignore_cert_errors"></a><dl>
     * <dt><b>XHR_PROP_IGNORE_CERT_ERRORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Suppresses certain certificate errors.
     * 
     * This property is supported by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3">IXMLHTTPRequest3</a> interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ullValue Specifies the number of milliseconds that the application waits before timing out.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_NO_CRED_PROMPT"></a><a id="xhr_prop_no_cred_prompt"></a><dl>
     * <dt><b>XHR_PROP_NO_CRED_PROMPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This parameter can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/msxml6/ne-msxml6-xhr_cred_prompt">XHR_CRED_PROMPT</a> enumeration type defined in the <i>Msxml6.h</i>  header file.
     * 
     * <ul>
     * <li><b>XHR_CRED_PROMPT_ALL</b> if credential prompting should be enabled <b>(default)</b>.</li>
     * <li><b>XHR_CRED_PROMPT_NONE</b> if credential prompting should be disabled.</li>
     * <li><b>XHR_CRED_PROMPT_PROXY</b> if credential prompting should only be enabled for proxy authentication.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_NO_AUTH"></a><a id="xhr_prop_no_auth"></a><dl>
     * <dt><b>XHR_PROP_NO_AUTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This parameter can be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/msxml6/ne-msxml6-xhr_cred_prompt">XHR_AUTH</a> enumeration type defined in the <i>Msxml6.h</i>  header file.
     * 
     * <ul>
     * <li><b>XHR_AUTH_ALL</b> if authentication is enabled <b>(default)</b>.
     * </li>
     * <li><b>XHR_AUTH_NONE</b> if authentication is disabled.
     * </li>
     * <li><b>XHR_AUTH_PROXY</b> if authentication should only be enabled for proxy authentication.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_TIMEOUT_"></a><a id="xhr_prop_timeout_"></a><dl>
     * <dt><b>XHR_PROP_TIMEOUT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of milliseconds, up to 0xFFFFFFFF, that the app waits before timing out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_NO_DEFAULT_HEADERS"></a><a id="xhr_prop_no_default_headers"></a><dl>
     * <dt><b>XHR_PROP_NO_DEFAULT_HEADERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li>FALSE(0x0) to enable adding default headers <b>(default)</b>. 
     * </li>
     * <li>TRUE(0x1) to disable adding default headers. 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_REPORT_REDIRECT_STATUS"></a><a id="xhr_prop_report_redirect_status"></a><dl>
     * <dt><b>XHR_PROP_REPORT_REDIRECT_STATUS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li>FALSE(0x0) to not report redirect status <b>(default)</b>. 
     * </li>
     * <li>TRUE(0x1) to report redirect status. 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_NO_CACHE"></a><a id="xhr_prop_no_cache"></a><dl>
     * <dt><b>XHR_PROP_NO_CACHE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li>FALSE(0x0) to enable caching <b>(default)</b>. 
     * </li>
     * <li>TRUE(0x1) to disable caching. 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_EXTENDED_ERROR"></a><a id="xhr_prop_extended_error"></a><dl>
     * <dt><b>XHR_PROP_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li>FALSE(0x0) to not provide extended errors <b>(default)</b>. 
     * </li>
     * <li>TRUE(0x1) to provide extended errors . 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_QUERY_STRING_UTF8"></a><a id="xhr_prop_query_string_utf8"></a><dl>
     * <dt><b>XHR_PROP_QUERY_STRING_UTF8</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li>FALSE(0x0) to not encode the query string in UTF-8 <b>(default)</b>. 
     * </li>
     * <li>TRUE(0x1) to encode the query string in UTF-8. 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XHR_PROP_IGNORE_CERT_ERRORS_"></a><a id="xhr_prop_ignore_cert_errors_"></a><dl>
     * <dt><b>XHR_PROP_IGNORE_CERT_ERRORS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li>FALSE(0x0) to not ignore certificate errors <b>(default)</b>. 
     * </li>
     * <li>TRUE(0x1) to ignore certificate errors. 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns <b>S_OK</b> on success.
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2-setproperty
     */
    SetProperty(eProperty, ullValue) {
        result := ComCall(8, this, "int", eProperty, "uint", ullValue, "HRESULT")
        return result
    }

    /**
     * Specifies the name of an HTTP header to be sent to the server along with the default request headers.
     * @param {PWSTR} pwszHeader A case-insensitive header name.
     * @param {PWSTR} pwszValue Value of the specified header.
     * @returns {HRESULT} Returns <b>S_OK</b> on success.
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2-setrequestheader
     */
    SetRequestHeader(pwszHeader, pwszValue) {
        pwszHeader := pwszHeader is String ? StrPtr(pwszHeader) : pwszHeader
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(9, this, "ptr", pwszHeader, "ptr", pwszValue, "HRESULT")
        return result
    }

    /**
     * Retrieves the values of all the HTTP response headers.
     * @returns {Pointer<Integer>} The returned header information. Free the memory used for this parameter using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2-getallresponseheaders
     */
    GetAllResponseHeaders() {
        result := ComCall(10, this, "ptr*", &ppwszHeaders := 0, "HRESULT")
        return ppwszHeaders
    }

    /**
     * Gets a cookie associated with the specified URL from the HTTP cookie jar.
     * @param {PWSTR} pwszUrl A null-terminated string that specifies the URL in the cookie.
     * @param {PWSTR} pwszName A null-terminated string that specifies the name in the cookie.
     * @param {Integer} dwFlags A set of bit flags that specifies how this method retrieves the cookies. This parameter can be a set values from the <a href="https://docs.microsoft.com/windows/desktop/api/msxml6/ne-msxml6-xhr_cookie_flag">XHR_COOKIE_FLAG</a> enumeration type defined in the <i>Msxml6.h</i> header file.
     * @param {Pointer<Integer>} pcCookies A count of cookies pointed to by the <i>ppCookies</i> if the call is successful.
     * @param {Pointer<Pointer<XHR_COOKIE>>} ppCookies A pointer to the cookies associated with the specified <i>pwszUrl</i> and <i>pwszName</i>.
     * @returns {HRESULT} Returns <b>S_OK</b> on success; <b>E_FAIL</b> indicates an error.
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2-getcookie
     */
    GetCookie(pwszUrl, pwszName, dwFlags, pcCookies, ppCookies) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pcCookiesMarshal := pcCookies is VarRef ? "uint*" : "ptr"
        ppCookiesMarshal := ppCookies is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", pwszUrl, "ptr", pwszName, "uint", dwFlags, pcCookiesMarshal, pcCookies, ppCookiesMarshal, ppCookies, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of an HTTP header from the response headers.
     * @param {PWSTR} pwszHeader A case-insensitive header name.
     * @returns {Pointer<Integer>} The resulting header information. You should free the memory for this parameter by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2-getresponseheader
     */
    GetResponseHeader(pwszHeader) {
        pwszHeader := pwszHeader is String ? StrPtr(pwszHeader) : pwszHeader

        result := ComCall(12, this, "ptr", pwszHeader, "ptr*", &ppwszValue := 0, "HRESULT")
        return ppwszValue
    }
}
