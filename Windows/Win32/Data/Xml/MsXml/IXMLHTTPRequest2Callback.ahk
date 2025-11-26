#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Defines callbacks that notify an application with an outstanding IXMLHTTPRequest2 request of events that affect HTTP request and response processing. Note  This interface is supported on Windows Phone 8.1.  .
 * @remarks
 * 
 * Methods on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2">IXMLHTTPRequest2</a> interface are asynchronous, so applications must pass an <b>IXMLHTTPRequest2Callback</b> object as a parameter in calls to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2-open">Open</a> method on the <b>IXMLHTTPRequest2</b> interface to receive callback notifications. 
 * 
 * The <b>IXMLHTTPRequest2Callback</b> interface is extended by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3callback">IXMLHTTPRequest3Callback</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msxml6/nn-msxml6-ixmlhttprequest2callback
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLHTTPRequest2Callback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLHTTPRequest2Callback
     * @type {Guid}
     */
    static IID => Guid("{a44a9299-e321-40de-8866-341b41669162}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnRedirect", "OnHeadersAvailable", "OnDataAvailable", "OnResponseReceived", "OnError"]

    /**
     * Occurs when a client sends an HTTP request that the server redirects to a new URL.
     * @param {IXMLHTTPRequest2} pXHR The HTTP request object being redirected.
     * @param {PWSTR} pwszRedirectUrl The new URL for the HTTP request.
     * @returns {HRESULT} Returns <b>S_OK</b> on success.
     * 
     * <div class="alert"><b>Note</b>  This callback function must not throw exceptions.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2callback-onredirect
     */
    OnRedirect(pXHR, pwszRedirectUrl) {
        pwszRedirectUrl := pwszRedirectUrl is String ? StrPtr(pwszRedirectUrl) : pwszRedirectUrl

        result := ComCall(3, this, "ptr", pXHR, "ptr", pwszRedirectUrl, "HRESULT")
        return result
    }

    /**
     * Occurs after an HTTP request has been sent to the server and the server has responded with response headers.
     * @param {IXMLHTTPRequest2} pXHR The initial HTTP request object that returns the headers.
     * @param {Integer} dwStatus The status code for the request.
     * 
     * <div class="alert"><b>Note</b>  Possible values for this parameter also include the <b>HTTP_STATUS_*</b> values defined by <b>winhttp.h</b> for  desktop apps.</div>
     * <div> </div>
     * @param {PWSTR} pwszStatus The status code for the request appearing in human-readable form as a null-terminated string.
     * @returns {HRESULT} Returns <b>S_OK</b> on success.
     * 
     * <div class="alert"><b>Note</b>  This callback function must not throw exceptions.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2callback-onheadersavailable
     */
    OnHeadersAvailable(pXHR, dwStatus, pwszStatus) {
        pwszStatus := pwszStatus is String ? StrPtr(pwszStatus) : pwszStatus

        result := ComCall(4, this, "ptr", pXHR, "uint", dwStatus, "ptr", pwszStatus, "HRESULT")
        return result
    }

    /**
     * Occurs when a client receives part of the HTTP response data from the server.
     * @param {IXMLHTTPRequest2} pXHR The initial HTTP request.
     * @param {ISequentialStream} pResponseStream The response stream being received. The client can call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> to begin processing the data, or it can wait until it has received the complete response. This response stream is wrapped in a stream synchronization object that prevents concurrent read and write operations, so the application does not need to implement custom synchronization.
     * @returns {HRESULT} Returns <b>S_OK</b> on success.
     * 
     * <div class="alert"><b>Note</b>  This callback function must not throw exceptions.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2callback-ondataavailable
     */
    OnDataAvailable(pXHR, pResponseStream) {
        result := ComCall(5, this, "ptr", pXHR, "ptr", pResponseStream, "HRESULT")
        return result
    }

    /**
     * Occurs when a client has received a complete response from the server.
     * @param {IXMLHTTPRequest2} pXHR The initial HTTP request object
     * @param {ISequentialStream} pResponseStream The response stream being received. The client can call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> to begin processing the data, or it can store a reference to <i>pResponseStream</i> for later processing. This response stream is wrapped in a stream synchronization object that prevents concurrent read and write operations, so the application does not need to implement custom synchronization.
     * @returns {HRESULT} Returns <b>S_OK</b> on success.
     * 
     * <div class="alert"><b>Note</b>  This callback function must not throw exceptions.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2callback-onresponsereceived
     */
    OnResponseReceived(pXHR, pResponseStream) {
        result := ComCall(6, this, "ptr", pXHR, "ptr", pResponseStream, "HRESULT")
        return result
    }

    /**
     * Occurs when an error is encountered or the request has been aborted.
     * @param {IXMLHTTPRequest2} pXHR The initial HTTP request.
     * @param {HRESULT} hrError A code representing the error that occurred on the HTTP request.
     * @returns {HRESULT} Returns<b> S_OK</b> on success.
     * 
     * <div class="alert"><b>Note</b>  This callback function must not throw exceptions.</div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//msxml6/nf-msxml6-ixmlhttprequest2callback-onerror
     */
    OnError(pXHR, hrError) {
        result := ComCall(7, this, "ptr", pXHR, "int", hrError, "HRESULT")
        return result
    }
}
