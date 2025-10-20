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
     * 
     * @param {Pointer<IXMLHTTPRequest2>} pXHR 
     * @param {PWSTR} pwszRedirectUrl 
     * @returns {HRESULT} 
     */
    OnRedirect(pXHR, pwszRedirectUrl) {
        pwszRedirectUrl := pwszRedirectUrl is String ? StrPtr(pwszRedirectUrl) : pwszRedirectUrl

        result := ComCall(3, this, "ptr", pXHR, "ptr", pwszRedirectUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLHTTPRequest2>} pXHR 
     * @param {Integer} dwStatus 
     * @param {PWSTR} pwszStatus 
     * @returns {HRESULT} 
     */
    OnHeadersAvailable(pXHR, dwStatus, pwszStatus) {
        pwszStatus := pwszStatus is String ? StrPtr(pwszStatus) : pwszStatus

        result := ComCall(4, this, "ptr", pXHR, "uint", dwStatus, "ptr", pwszStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLHTTPRequest2>} pXHR 
     * @param {Pointer<ISequentialStream>} pResponseStream 
     * @returns {HRESULT} 
     */
    OnDataAvailable(pXHR, pResponseStream) {
        result := ComCall(5, this, "ptr", pXHR, "ptr", pResponseStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLHTTPRequest2>} pXHR 
     * @param {Pointer<ISequentialStream>} pResponseStream 
     * @returns {HRESULT} 
     */
    OnResponseReceived(pXHR, pResponseStream) {
        result := ComCall(6, this, "ptr", pXHR, "ptr", pResponseStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXMLHTTPRequest2>} pXHR 
     * @param {HRESULT} hrError 
     * @returns {HRESULT} 
     */
    OnError(pXHR, hrError) {
        result := ComCall(7, this, "ptr", pXHR, "int", hrError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
