#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWinHttpRequest interface provides all of the nonevent methods for Microsoft Windows HTTP Services (WinHTTP).
 * @remarks
 * The **IWinHttpRequest** interface inherits from the [**IUnknown**](/windows/desktop/api/unknwn/nn-unknwn-iunknown) interface. **IWinHttpRequest** also has these types of members:
 * 
 * -   [Methods](#methods)
 * -   [Properties](#properties)
 * 
 * 
 * The **IWinHttpRequest** interface defined in httprequest.idl is implemented by a class with id of **CLSID\_WinHttpRequest**. An application obtain this interface by calling [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance) with a class id of **CLSID\_WinHttpRequest** and an interface id of **IID\_IWinHttpRequest**.
 * 
 * > [!Note]  
 * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHttp start page.
 * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-interface
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class IWinHttpRequest extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinHttpRequest
     * @type {Guid}
     */
    static IID => Guid("{016fe2ec-b2c8-45f8-b23b-39e53a75396b}")

    /**
     * The class identifier for WinHttpRequest
     * @type {Guid}
     */
    static CLSID => Guid("{2087c2f4-2cef-4953-a8ab-66779b670495}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProxy", "SetCredentials", "Open", "SetRequestHeader", "GetResponseHeader", "GetAllResponseHeaders", "Send", "get_Status", "get_StatusText", "get_ResponseText", "get_ResponseBody", "get_ResponseStream", "get_Option", "put_Option", "WaitForResponse", "Abort", "SetTimeouts", "SetClientCertificate", "SetAutoLogonPolicy"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {BSTR} 
     */
    StatusText {
        get => this.get_StatusText()
    }

    /**
     * @type {BSTR} 
     */
    ResponseText {
        get => this.get_ResponseText()
    }

    /**
     * @type {VARIANT} 
     */
    ResponseBody {
        get => this.get_ResponseBody()
    }

    /**
     * @type {VARIANT} 
     */
    ResponseStream {
        get => this.get_ResponseStream()
    }

    /**
     * Sets proxy server information.
     * @remarks
     * Enables the calling application to specify use of default proxy information (configured by the proxy configuration tool) or to override [Proxycfg.exe](proxycfg-exe--a-proxy-configuration-tool.md). This method must be called before calling the [**Send**](iwinhttprequest-send.md) method. If this method is called after the [**Send**](iwinhttprequest-send.md) method, it has no effect.
     * 
     * [**IWinHttpRequest**](iwinhttprequest-interface.md) passes these parameters to Microsoft Windows HTTP Services (WinHTTP).
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {Integer} ProxySetting The flags that control this method. Can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                           | Meaning                                                                                                                                                                                                                                                                                                                                               |
     * |-----------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>HTTPREQUEST\_PROXYSETTING\_DEFAULT</dt> </dl>   | Default proxy setting. Equivalent to **HTTPREQUEST\_PROXYSETTING\_PRECONFIG**.<br/>                                                                                                                                                                                                                                                             |
     * | <dl> <dt>HTTPREQUEST\_PROXYSETTING\_PRECONFIG</dt> </dl> | Indicates that the proxy settings should be obtained from the registry. This assumes that [Proxycfg.exe](proxycfg-exe--a-proxy-configuration-tool.md) has been run. If Proxycfg.exe has not been run and **HTTPREQUEST\_PROXYSETTING\_PRECONFIG** is specified, then the behavior is equivalent to **HTTPREQUEST\_PROXYSETTING\_DIRECT**.<br/> |
     * | <dl> <dt>HTTPREQUEST\_PROXYSETTING\_DIRECT</dt> </dl>    | Indicates that all HTTP and HTTPS servers should be accessed directly. Use this command if there is no proxy server.<br/>                                                                                                                                                                                                                       |
     * | <dl> <dt>HTTPREQUEST\_PROXYSETTING\_PROXY</dt> </dl>     | When **HTTPREQUEST\_PROXYSETTING\_PROXY** is specified, *varProxyServer* should be set to a proxy server string and *varBypassList* should be set to a domain bypass list string. This proxy configuration applies only to the current instance of the [**WinHttpRequest**](winhttprequest.md) object.<br/>                                    |
     * @param {VARIANT} ProxyServer Set to a proxy server string when *ProxySetting* equals **HTTPREQUEST\_PROXYSETTING\_PROXY**.
     * @param {VARIANT} BypassList Set to a domain bypass list string when *ProxySetting* equals **HTTPREQUEST\_PROXYSETTING\_PROXY**.
     * @returns {HRESULT} The return value is **S\_OK** on success or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-setproxy
     */
    SetProxy(ProxySetting, ProxyServer, BypassList) {
        result := ComCall(7, this, "int", ProxySetting, "ptr", ProxyServer, "ptr", BypassList, "HRESULT")
        return result
    }

    /**
     * Sets credentials to be used with an HTTP server, whether it is a proxy server or an originating server.
     * @remarks
     * This method returns an error value if a call to [**Open**](iwinhttprequest-open.md) has not completed successfully. It is assumed that some measure of interaction with a proxy server or origin server must occur before users can set credentials for the session. Moreover, until users know which authentication scheme(s) are supported, they cannot format the credentials.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * 
     *  
     * 
     * To authenticate with both the server and the proxy, the application must call **SetCredentials** twice; first with the *Flags* parameter set to **HTTPREQUEST\_SETCREDENTIALS\_FOR\_SERVER**, and second, with the *Flags* parameter set to **HTTPREQUEST\_SETCREDENTIALS\_FOR\_PROXY**.
     * @param {BSTR} UserName Specifies the user name for authentication.
     * @param {BSTR} Password Specifies the password for authentication. This parameter is ignored if *bstrUserName* is **NULL** or missing.
     * @param {Integer} Flags Specifies when [**IWinHttpRequest**](iwinhttprequest-interface.md) uses credentials. Can be one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                               | Meaning                                        |
     * |---------------------------------------------------------------------------------------------------------------------|------------------------------------------------|
     * | <dl> <dt>HTTPREQUEST\_SETCREDENTIALS\_FOR\_SERVER</dt> </dl> | Credentials are passed to a server.<br/> |
     * | <dl> <dt>HTTPREQUEST\_SETCREDENTIALS\_FOR\_PROXY</dt> </dl>  | Credentials are passed to a proxy.<br/>  |
     * @returns {HRESULT} The return value is **S\_OK** on success or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-setcredentials
     */
    SetCredentials(UserName, Password, Flags) {
        UserName := UserName is String ? BSTR.Alloc(UserName).Value : UserName
        Password := Password is String ? BSTR.Alloc(Password).Value : Password

        result := ComCall(8, this, "ptr", UserName, "ptr", Password, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Opens an HTTP connection to an HTTP resource.
     * @remarks
     * This method opens a connection to the resource identified in *Url* using the [*HTTP verb*](glossary.md) given in *Method*.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {BSTR} Method Specifies the [*HTTP verb*](glossary.md) used for the **Open** method, such as "GET" or "PUT". Always use uppercase as some servers ignore lowercase *HTTP verb*s.
     * @param {BSTR} Url Specifies the name of the resource. This must be an absolute URL.
     * @param {VARIANT} Async Indicates whether to open in asynchronous mode.
     * 
     * 
     * 
     * | Value                                                                                                                                                         | Meaning                                                                                                                                                                                           |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <span id="VARIANT_FALSE"></span><span id="variant_false"></span><dl> <dt>**VARIANT\_FALSE**</dt> </dl> | Opens the HTTP connection in synchronous mode. A call to [**Send**](iwinhttprequest-send.md) does not return until [WinHTTP](about-winhttp.md) has completely received the response.<br/> |
     * | <span id="VARIANT_TRUE"></span><span id="variant_true"></span><dl> <dt>**VARIANT\_TRUE**</dt> </dl>    | Opens the HTTP connection in asynchronous mode.<br/>                                                                                                                                        |
     * @returns {HRESULT} The return value is **S\_OK** on success or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-open
     */
    Open(Method, Url, Async) {
        Method := Method is String ? BSTR.Alloc(Method).Value : Method
        Url := Url is String ? BSTR.Alloc(Url).Value : Url

        result := ComCall(9, this, "ptr", Method, "ptr", Url, "ptr", Async, "HRESULT")
        return result
    }

    /**
     * Adds, changes, or deletes an HTTP request header.
     * @remarks
     * Headers are transferred across redirects. This can create a security vulnerability. To avoid having headers transferred if a redirect occurs, use the [*WINHTTP\_STATUS\_CALLBACK*](/windows/win32/api/winhttp/nc-winhttp-winhttp_status_callback) callback to correct the specific headers when a redirect occurs.
     * 
     * The **SetRequestHeader** method enables the calling application to add or delete an HTTP request header prior to sending the request. The header name is given in *Header*, and the header token or value is given in *Value*. To add a header, supply a header name and value. If another header already exists with this name, it is replaced. To delete a header, set *Header* to the name of the header to delete and set *Value* to **NULL**.
     * 
     * The name and value of request headers added with this method are validated. Headers must be well formed. For more information about valid HTTP headers, see [RFC 2616](https://www.ietf.org/rfc/rfc2616.txt). If an invalid header is used, an error occurs and the header is not added.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {BSTR} Header Specifies the name of the header to be set, for example, "depth". This parameter should not contain a colon and must be the actual text of the HTTP header.
     * @param {BSTR} Value Specifies the value of the header, for example, "infinity".
     * @returns {HRESULT} The return value is **S\_OK** on success or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-setrequestheader
     */
    SetRequestHeader(Header, Value) {
        Header := Header is String ? BSTR.Alloc(Header).Value : Header
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(10, this, "ptr", Header, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves the HTTP response headers.
     * @remarks
     * This method returns the value of the response header named in *Header*. Be aware that automation clients, such as script, get the header data as the return value of the function call, not through a function parameter. Invoke this method only after the [**Send**](iwinhttprequest-send.md) method has been called.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {BSTR} Header Specifies the case-insensitive header name.
     * @returns {BSTR} Receives the resulting header information.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-getresponseheader
     */
    GetResponseHeader(Header) {
        Header := Header is String ? BSTR.Alloc(Header).Value : Header

        Value := BSTR()
        result := ComCall(11, this, "ptr", Header, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * Retrieves all HTTP response headers.
     * @remarks
     * This method returns all of the headers contained in the most recent server response. The individual headers are delimited by a carriage return and line feed combination (ASCII 13 and 10). The last entry is followed by two delimiters (13, 10, 13, 10). Invoke this method only after the [**Send**](iwinhttprequest-send.md) method has been called.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @returns {BSTR} Receives the resulting header information.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-getallresponseheaders
     */
    GetAllResponseHeaders() {
        Headers := BSTR()
        result := ComCall(12, this, "ptr", Headers, "HRESULT")
        return Headers
    }

    /**
     * The Send method sends an HTTP request to an HTTP server.
     * @remarks
     * The request to be sent was defined in a prior call to the [**Open**](iwinhttprequest-open.md) method. The calling application can provide data to be sent to the server through the *Body* parameter. If the [*HTTP verb*](glossary.md) of the object's [**Open**](iwinhttprequest-open.md) is "GET", this method sends the request without *Body*, even if it is provided by the calling application.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHttp start page.
     * @param {VARIANT} Body Data to be sent to the server.
     * @returns {HRESULT} The return value is **S\_OK** on success or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-send
     */
    Send(Body) {
        result := ComCall(13, this, "ptr", Body, "HRESULT")
        return result
    }

    /**
     * The Status property retrieves the HTTP status code from the last response.
     * @remarks
     * The results of this property are valid only after the [**Send**](iwinhttprequest-send.md) method has successfully completed. For a list of status codes see [**HTTP Status Codes**](http-status-codes.md).
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHttp start page.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-status
     */
    get_Status() {
        result := ComCall(14, this, "int*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * Retrieves the HTTP status text.
     * @remarks
     * Retrieves the text portion of the server response line, making available the "user-friendly" equivalent to the numeric HTTP status code. The results of this property are valid only after the [**Send**](iwinhttprequest-send.md) method has successfully completed.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-statustext
     */
    get_StatusText() {
        Status := BSTR()
        result := ComCall(15, this, "ptr", Status, "HRESULT")
        return Status
    }

    /**
     * Retrieves the response entity body as text.
     * @remarks
     * This property can only be invoked after the [**Send**](iwinhttprequest-send.md) method has been called.
     * 
     * When using this property in synchronous mode, the limit to the number of characters it returns is approximately 2,169,895.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-responsetext
     */
    get_ResponseText() {
        Body := BSTR()
        result := ComCall(16, this, "ptr", Body, "HRESULT")
        return Body
    }

    /**
     * Retrieves the response entity body as an array of unsigned bytes.
     * @remarks
     * This property returns the response data in an array of unsigned bytes. If the response does not have a response body, an empty variant is returned. This property can only be invoked after the [**Send**](iwinhttprequest-send.md) method has been called.
     * 
     * > [!Note]  
     * > For more information about implementation for Windows XP and Windows 2000, see [Run-Time Requirements](winhttp-start-page.md).
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-responsebody
     */
    get_ResponseBody() {
        Body := VARIANT()
        result := ComCall(17, this, "ptr", Body, "HRESULT")
        return Body
    }

    /**
     * Retrieves the response entity body as an IStream.
     * @remarks
     * Call [**QueryInterface**](/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)) on the returned pointer to obtain a pointer to an [**IStream**](/windows/desktop/api/objidl/nn-objidl-istream) interface. This property returns the response data as an **IStream**. This property can only be invoked after the [**Send**](iwinhttprequest-send.md) method has been called.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-responsestream
     */
    get_ResponseStream() {
        Body := VARIANT()
        result := ComCall(18, this, "ptr", Body, "HRESULT")
        return Body
    }

    /**
     * Sets or retrieves a Microsoft Windows HTTP Services (WinHTTP) option value.
     * @remarks
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {Integer} Option 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-option
     */
    get_Option(Option) {
        Value := VARIANT()
        result := ComCall(19, this, "int", Option, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * Sets or retrieves a Microsoft Windows HTTP Services (WinHTTP) option value.
     * @remarks
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {Integer} Option 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-option
     */
    put_Option(Option, Value) {
        result := ComCall(20, this, "int", Option, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * The WaitForResponse method waits for an asynchronous Send method to complete, with optional time-out value, in seconds.
     * @remarks
     * This method suspends execution while waiting for a response to an asynchronous request. This method should be called after a [**Send**](iwinhttprequest-send.md). Calling applications can specify an optional *Timeout* value, in seconds. If this method times out, the request is not aborted. This way, the calling application can continue to wait for the request, if desired, in a subsequent call to this method.
     * 
     * Calling this property after a synchronous [**Send**](iwinhttprequest-send.md) method returns immediately and has no effect.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {VARIANT} Timeout Time-out value, in seconds. Default time-out is infinite. To explicitly set time-out to infinite, use the value -1.
     * @returns {VARIANT_BOOL} Receives one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                         | Meaning                                                |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
     * | <span id="VARIANT_TRUE"></span><span id="variant_true"></span><dl> <dt>**VARIANT\_TRUE**</dt> </dl>    | A response has been received.<br/>               |
     * | <span id="VARIANT_FALSE"></span><span id="variant_false"></span><dl> <dt>**VARIANT\_FALSE**</dt> </dl> | The specified time-out period was exceeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-waitforresponse
     */
    WaitForResponse(Timeout) {
        result := ComCall(21, this, "ptr", Timeout, "short*", &Succeeded := 0, "HRESULT")
        return Succeeded
    }

    /**
     * The Abort method aborts a WinHTTP Send method.
     * @remarks
     * You can abort both asynchronous and synchronous [**Send**](iwinhttprequest-send.md) methods. To abort a synchronous [**Send**](iwinhttprequest-send.md) method, you must call **Abort** from within an [**IWinHttpRequestEvents**](iwinhttprequestevents-interface.md) event.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHttp start page.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * The return value is **S\_OK** on success or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-abort
     */
    Abort() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * The SetTimeouts method specifies the individual time-out components of a send/receive operation, in milliseconds.
     * @remarks
     * All parameters are required. A value of 0 or -1 sets a time-out to wait infinitely. A value greater than 0 sets the time-out value in milliseconds. For example, 30,000 would set the time-out to 30 seconds. All negative values other than -1 cause this method to fail.
     * 
     * Time-out values are applied at the Winsock layer.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHttp start page.
     * @param {Integer} ResolveTimeout Time-out value applied when resolving a host name (such as `www.microsoft.com`) to an IP address (such as 192.168.131.199), in milliseconds. The default value is zero, meaning no time-out (infinite). If DNS timeout is specified using NAME\_RESOLUTION\_TIMEOUT, there is an overhead of one thread per request.
     * @param {Integer} ConnectTimeout Time-out value applied when establishing a communication socket with the target server, in milliseconds. The default value is 60,000 (60 seconds).
     * @param {Integer} SendTimeout Time-out value applied when sending an individual packet of request data on the communication socket to the target server, in milliseconds. A large request sent to an HTTP server are normally be broken up into multiple packets; the send time-out applies to sending each packet individually. The default value is 30,000 (30 seconds).
     * @param {Integer} ReceiveTimeout Time-out value applied when receiving a packet of response data from the target server, in milliseconds. Large responses are be broken up into multiple packets; the receive time-out applies to fetching each packet of data off the socket. The default value is 30,000 (30 seconds).
     * @returns {HRESULT} The return value is **S\_OK** on success or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-settimeouts
     */
    SetTimeouts(ResolveTimeout, ConnectTimeout, SendTimeout, ReceiveTimeout) {
        result := ComCall(23, this, "int", ResolveTimeout, "int", ConnectTimeout, "int", SendTimeout, "int", ReceiveTimeout, "HRESULT")
        return result
    }

    /**
     * Selects a client certificate to send to a Secure Hypertext Transfer Protocol (HTTPS) server.
     * @remarks
     * The string specified in the *ClientCertificate* parameter consists of the certificate location, certificate store, and subject name delimited by backslashes. For more information about the components of the certificate string, see [Client Certificates](ssl-in-winhttp.md).
     * 
     * The certificate store name and location are optional. However, if you specify a certificate store, you must also specify the location of that certificate store. The default location is CURRENT\_USER and the default certificate store is "MY". A blank subject indicates that the first certificate in the certificate store should be used.
     * 
     * Call **SetClientCertificate** to select a certificate before calling [**Send**](iwinhttprequest-send.md) to send the request.
     * 
     * Microsoft Windows HTTP Services (WinHTTP) does not provide client certificates to proxy servers that request certificates for authentication.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {BSTR} ClientCertificate Specifies the location, [*certificate store*](glossary.md), and subject of a client certificate.
     * @returns {HRESULT} The return value is **S\_OK** on success or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-setclientcertificate
     */
    SetClientCertificate(ClientCertificate) {
        ClientCertificate := ClientCertificate is String ? BSTR.Alloc(ClientCertificate).Value : ClientCertificate

        result := ComCall(24, this, "ptr", ClientCertificate, "HRESULT")
        return result
    }

    /**
     * Sets the current Automatic Logon Policy.
     * @remarks
     * The default policy is [**AutoLogonPolicy\_OnlyIfBypassProxy**](winhttprequestautologonpolicy.md).
     * 
     * Call **SetAutoLogonPolicy** to set the automatic logon policy before calling [**Send**](iwinhttprequest-send.md) to send the request.
     * 
     * > [!Note]  
     * > For Windows XP and Windows 2000, see the [Run-Time Requirements](winhttp-start-page.md) section of the WinHTTP Start Page.
     * @param {Integer} AutoLogonPolicy Specifies the current automatic logon policy.
     * @returns {HRESULT} The return value is **S\_OK** on success or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/WinHttp/iwinhttprequest-setautologonpolicy
     */
    SetAutoLogonPolicy(AutoLogonPolicy) {
        result := ComCall(25, this, "int", AutoLogonPolicy, "HRESULT")
        return result
    }
}
