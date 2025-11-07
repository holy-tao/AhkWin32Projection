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
     * 
     * @param {PWSTR} pwszMethod 
     * @param {PWSTR} pwszUrl 
     * @param {IXMLHTTPRequest2Callback} pStatusCallback 
     * @param {PWSTR} pwszUserName 
     * @param {PWSTR} pwszPassword 
     * @param {PWSTR} pwszProxyUserName 
     * @param {PWSTR} pwszProxyPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest2-open
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
     * 
     * @param {ISequentialStream} pBody 
     * @param {Integer} cbBody 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest2-send
     */
    Send(pBody, cbBody) {
        result := ComCall(4, this, "ptr", pBody, "uint", cbBody, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest2-abort
     */
    Abort() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<XHR_COOKIE>} pCookie 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest2-setcookie
     */
    SetCookie(pCookie) {
        result := ComCall(6, this, "ptr", pCookie, "uint*", &pdwCookieState := 0, "HRESULT")
        return pdwCookieState
    }

    /**
     * 
     * @param {ISequentialStream} pSequentialStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest2-setcustomresponsestream
     */
    SetCustomResponseStream(pSequentialStream) {
        result := ComCall(7, this, "ptr", pSequentialStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eProperty 
     * @param {Integer} ullValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest2-setproperty
     */
    SetProperty(eProperty, ullValue) {
        result := ComCall(8, this, "int", eProperty, "uint", ullValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszHeader 
     * @param {PWSTR} pwszValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest2-setrequestheader
     */
    SetRequestHeader(pwszHeader, pwszValue) {
        pwszHeader := pwszHeader is String ? StrPtr(pwszHeader) : pwszHeader
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        result := ComCall(9, this, "ptr", pwszHeader, "ptr", pwszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest2-getallresponseheaders
     */
    GetAllResponseHeaders() {
        result := ComCall(10, this, "ptr*", &ppwszHeaders := 0, "HRESULT")
        return ppwszHeaders
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @param {PWSTR} pwszName 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} pcCookies 
     * @param {Pointer<Pointer<XHR_COOKIE>>} ppCookies 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest2-getcookie
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
     * 
     * @param {PWSTR} pwszHeader 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest2-getresponseheader
     */
    GetResponseHeader(pwszHeader) {
        pwszHeader := pwszHeader is String ? StrPtr(pwszHeader) : pwszHeader

        result := ComCall(12, this, "ptr", pwszHeader, "ptr*", &ppwszValue := 0, "HRESULT")
        return ppwszValue
    }
}
