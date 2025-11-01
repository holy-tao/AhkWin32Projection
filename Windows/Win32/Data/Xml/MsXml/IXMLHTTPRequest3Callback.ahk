#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLHTTPRequest2Callback.ahk

/**
 * Defines callbacks that notify an application with an outstanding IXMLHTTPRequest3 request of events that affect HTTP request and response processing.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3">IXMLHTTPRequest3</a> and <b>IXMLHTTPRequest3Callback</b> interfaces extend the features provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2">IXMLHTTPRequest2</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2callback">IXMLHTTPRequest2Callback</a> interfaces with these additions:
  * 
  * 
  * <ul>
  * <li>Allows setting a client certificate to use for the HTTPS request with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ixhr2/ixmlhttprequest3-setclientcertificate">SetClientCertificate</a>method on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3">IXMLHTTPRequest3</a> interface.</li>
  * <li>Allows getting an issuer list to help filter down eligible client certificates to use for the next HTTP request with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest3callback-onclientcertificaterequested">OnClientCertificateRequested</a>method on the <b>IXMLHTTPRequest3Callback</b> interface.</li>
  * <li>Allows ignoring certain certificate errors which would have otherwise aborted the HTTPS connection. </li>
  * <li>Allows getting certificate errors and the server certificate chain from the HTTPS response with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest3callback-onservercertificatereceived">OnServerCertificateReceived</a>method on the <b>IXMLHTTPRequest3Callback</b> interface.</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msxml6/nn-msxml6-ixmlhttprequest3callback
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IXMLHTTPRequest3Callback extends IXMLHTTPRequest2Callback{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXMLHTTPRequest3Callback
     * @type {Guid}
     */
    static IID => Guid("{b9e57830-8c6c-4a6f-9c13-47772bb047bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnServerCertificateReceived", "OnClientCertificateRequested"]

    /**
     * 
     * @param {IXMLHTTPRequest3} pXHR 
     * @param {Integer} dwCertificateErrors 
     * @param {Integer} cServerCertificateChain 
     * @param {Pointer<XHR_CERT>} rgServerCertificateChain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest3callback-onservercertificatereceived
     */
    OnServerCertificateReceived(pXHR, dwCertificateErrors, cServerCertificateChain, rgServerCertificateChain) {
        result := ComCall(8, this, "ptr", pXHR, "uint", dwCertificateErrors, "uint", cServerCertificateChain, "ptr", rgServerCertificateChain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXMLHTTPRequest3} pXHR 
     * @param {Integer} cIssuerList 
     * @param {Pointer<Pointer<Integer>>} rgpwszIssuerList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest3callback-onclientcertificaterequested
     */
    OnClientCertificateRequested(pXHR, cIssuerList, rgpwszIssuerList) {
        result := ComCall(9, this, "ptr", pXHR, "uint", cIssuerList, "ptr*", rgpwszIssuerList, "HRESULT")
        return result
    }
}
