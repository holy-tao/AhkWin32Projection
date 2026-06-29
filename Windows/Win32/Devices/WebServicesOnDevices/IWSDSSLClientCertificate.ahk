#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Retrieves the client SSL certificate.
 * @remarks
 * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdhttpmessageparameters">IWSDHttpMessageParameters</a>.  If the connection did not arrive over SSL, the call to <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> will return <b>E_NOINTERFACE</b>.
 * 
 * On the device host, the generated code calls the application's service method. This service method has access to the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdhttpmessageparameters">IWSDHttpMessageParameters</a> interface through the <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_event">WSD_EVENT</a> structure. The <b>IWSDSSLClientCertificate</b> provides access to the client SSL certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nn-wsdbase-iwsdsslclientcertificate
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDSSLClientCertificate extends IUnknown {
    /**
     * The interface identifier for IWSDSSLClientCertificate
     * @type {Guid}
     */
    static IID := Guid("{de105e87-a0da-418e-98ad-27b9eed87bdc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDSSLClientCertificate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetClientCertificate : IntPtr
        GetMappedAccessToken : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDSSLClientCertificate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the client certificate.
     * @returns {Pointer<CERT_CONTEXT>} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the client SSL certificate.  Upon completion, the caller should free this memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreecertificatecontext">CertFreeCertificateContext</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdsslclientcertificate-getclientcertificate
     */
    GetClientCertificate() {
        result := ComCall(3, this, "ptr*", &ppCertContext := 0, "HRESULT")
        return ppCertContext
    }

    /**
     * Gets the mapped access token.
     * @remarks
     * If the client certificate was successfully mapped to an operating system user account, then a valid access token for this user will be returned through <i>phToken</i>. This token can be used to impersonate the user. Internally, HTTP.sys will do the client certificate to user account mapping and return this information through the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_ssl_client_cert_info">HTTP_SSL_CLIENT_CERT_INFO</a> structure.
     * @returns {HANDLE} A handle for the mapped access token. Upon completion, the caller must free the handle by  calling <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdsslclientcertificate-getmappedaccesstoken
     */
    GetMappedAccessToken() {
        phToken := HANDLE.Owned()
        result := ComCall(4, this, HANDLE.Ptr, phToken, "HRESULT")
        return phToken
    }

    Query(iid) {
        if (IWSDSSLClientCertificate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetClientCertificate := CallbackCreate(GetMethod(implObj, "GetClientCertificate"), flags, 2)
        this.vtbl.GetMappedAccessToken := CallbackCreate(GetMethod(implObj, "GetMappedAccessToken"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetClientCertificate)
        CallbackFree(this.vtbl.GetMappedAccessToken)
    }
}
