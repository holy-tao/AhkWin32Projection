#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLHTTPRequest2.ahk" { IXMLHTTPRequest2 }

/**
 * Provides the methods and properties needed to configure and send HTTP requests and use callbacks to receive notifications during HTTP response processing.
 * @remarks
 * The <b>IXMLHTTPRequest3</b> interface configures and sends HTTP requests and uses  callbacks  to receive notifications  during HTTP response processing. The <b>IXMLHTTPRequest3</b> interface allows apps to run in a multi-threaded apartment (MTA), a requirement for running under the Windows Runtime (WinRT).
 * 
 * The <b>IXMLHTTPRequest3</b> interface extends the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2">IXMLHTTPRequest2</a> interface.
 * 
 * The <b>IXMLHTTPRequest3</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3callback">IXMLHTTPRequest3Callback</a> interfaces extend the features provided by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2">IXMLHTTPRequest2</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2callback">IXMLHTTPRequest2Callback</a> interfaces with these additions:
 * 
 * 
 * <ul>
 * <li>Allows setting a client certificate to use for the HTTPS request with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ixhr2/ixmlhttprequest3-setclientcertificate">SetClientCertificate</a> method on the <b>IXMLHTTPRequest3</b> interface.</li>
 * <li>Allows getting an issuer list to help filter down eligible client certificates to use for the next HTTP request with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest3callback-onclientcertificaterequested">OnClientCertificateRequested</a> method on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3callback">IXMLHTTPRequest3Callback</a> interface.</li>
 * <li>Allows ignoring certain certificate errors which would have otherwise aborted the HTTPS connection. </li>
 * <li>Allows getting certificate errors and the server certificate chain from the HTTPS response with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest3callback-onservercertificatereceived">OnServerCertificateReceived</a> method on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest3callback">IXMLHTTPRequest3Callback</a> interface.</li>
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
 * @see https://learn.microsoft.com/windows/win32/api/msxml6/nn-msxml6-ixmlhttprequest3
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLHTTPRequest3 extends IXMLHTTPRequest2 {
    /**
     * The interface identifier for IXMLHTTPRequest3
     * @type {Guid}
     */
    static IID := Guid("{a1c9feee-0617-4f23-9d58-8961ea43567c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLHTTPRequest3 interfaces
    */
    struct Vtbl extends IXMLHTTPRequest2.Vtbl {
        SetClientCertificate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLHTTPRequest3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets a client certificate to be used to authenticate against the URL specified in the Open method.
     * @param {Integer} cbClientCertificateHash The number of bytes of <i>pbClientCertHash</i> parameter.
     * @param {Pointer<Integer>} pbClientCertificateHash The thumbprint or hash completed over the complete client certificate being set on the HTTPS request.
     * @param {PWSTR} pwszPin This parameter is reserved.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/msxml6/nf-msxml6-ixmlhttprequest3-setclientcertificate
     */
    SetClientCertificate(cbClientCertificateHash, pbClientCertificateHash, pwszPin) {
        pwszPin := pwszPin is String ? StrPtr(pwszPin) : pwszPin

        pbClientCertificateHashMarshal := pbClientCertificateHash is VarRef ? "char*" : "ptr"

        result := ComCall(13, this, "uint", cbClientCertificateHash, pbClientCertificateHashMarshal, pbClientCertificateHash, "ptr", pwszPin, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLHTTPRequest3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetClientCertificate := CallbackCreate(GetMethod(implObj, "SetClientCertificate"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetClientCertificate)
    }
}
