#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLHTTPRequest2.ahk

/**
 * Provides the methods and properties needed to configure and send HTTP requests and use callbacks to receive notifications during HTTP response processing.
 * @remarks
 * 
  * The <b>IXMLHTTPRequest3</b> interface configures and sends HTTP requests and uses  callbacks  to receive notifications  during HTTP response processing. The <b>IXMLHTTPRequest3</b> interface allows apps to run in a multi-threaded apartment (MTA), a requirement for running under the Windows Runtime (WinRT).
  * 
  * The <b>IXMLHTTPRequest3</b> interface extends the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2">IXMLHTTPRequest2</a> interface.
  * 
  * The <b>IXMLHTTPRequest3</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3callback">IXMLHTTPRequest3Callback</a> interfaces extend the features provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2">IXMLHTTPRequest2</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2callback">IXMLHTTPRequest2Callback</a> interfaces with these additions:
  * 
  * 
  * <ul>
  * <li>Allows setting a client certificate to use for the HTTPS request with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ixhr2/ixmlhttprequest3-setclientcertificate">SetClientCertificate</a>method on the <b>IXMLHTTPRequest3</b> interface.</li>
  * <li>Allows getting an issuer list to help filter down eligible client certificates to use for the next HTTP request with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest3callback-onclientcertificaterequested">OnClientCertificateRequested</a>method on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3callback">IXMLHTTPRequest3Callback</a> interface.</li>
  * <li>Allows ignoring certain certificate errors which would have otherwise aborted the HTTPS connection. </li>
  * <li>Allows getting certificate errors and the server certificate chain from the HTTPS response with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest3callback-onservercertificatereceived">OnServerCertificateReceived</a>method on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3callback">IXMLHTTPRequest3Callback</a> interface.</li>
  * </ul>
  * 
  * 
  * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2-setproperty">SetProperty</a> method on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2">IXMLHTTPRequest2</a> interface is extended on the <b>IXMLHTTPRequest3</b> interface with new properties to support new scenarios:
  * 
  * 
  * <ul>
  * <li>XHR_PROP_NO_CACHE – Suppresses cache reads and writes for the HTTP request.</li>
  * <li>XHR_PROP_EXTENDED_ERROR – Causes the HTTP stack to provide HRESULTS with the underlying Win32 error code to the OnError method in case of failure.</li>
  * <li>XHR_PROP_QUERY_STRING_UTF8 – Causes the query string to be encoded in UTF-8 instead of ACP for HTTP request.</li>
  * <li>XHR_PROP_IGNORE_CERT_ERRORS – Suppresses certain server certificate errors.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msxml6/nn-msxml6-ixmlhttprequest3
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLHTTPRequest3 extends IXMLHTTPRequest2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLHTTPRequest3
     * @type {Guid}
     */
    static IID => Guid("{a1c9feee-0617-4f23-9d58-8961ea43567c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetClientCertificate"]

    /**
     * 
     * @param {Integer} cbClientCertificateHash 
     * @param {Pointer<Integer>} pbClientCertificateHash 
     * @param {PWSTR} pwszPin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest3-setclientcertificate
     */
    SetClientCertificate(cbClientCertificateHash, pbClientCertificateHash, pwszPin) {
        pwszPin := pwszPin is String ? StrPtr(pwszPin) : pwszPin

        pbClientCertificateHashMarshal := pbClientCertificateHash is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "uint", cbClientCertificateHash, pbClientCertificateHashMarshal, pbClientCertificateHash, "ptr", pwszPin, "HRESULT")
        return result
    }
}
