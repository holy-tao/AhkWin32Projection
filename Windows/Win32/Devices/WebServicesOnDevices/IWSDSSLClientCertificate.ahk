#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves the client SSL certificate.
 * @remarks
 * 
 * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdhttpmessageparameters">IWSDHttpMessageParameters</a>.  If the connection did not arrive over SSL, the call to <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> will return <b>E_NOINTERFACE</b>.
 * 
 * On the device host, the generated code calls the application's service method. This service method has access to the <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdhttpmessageparameters">IWSDHttpMessageParameters</a> interface through the <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_event">WSD_EVENT</a> structure. The <b>IWSDSSLClientCertificate</b> provides access to the client SSL certificate.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nn-wsdbase-iwsdsslclientcertificate
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDSSLClientCertificate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDSSLClientCertificate
     * @type {Guid}
     */
    static IID => Guid("{de105e87-a0da-418e-98ad-27b9eed87bdc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClientCertificate", "GetMappedAccessToken"]

    /**
     * Gets the client certificate.
     * @returns {Pointer<CERT_CONTEXT>} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the client SSL certificate.  Upon completion, the caller should free this memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certfreecertificatecontext">CertFreeCertificateContext</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdsslclientcertificate-getclientcertificate
     */
    GetClientCertificate() {
        result := ComCall(3, this, "ptr*", &ppCertContext := 0, "HRESULT")
        return ppCertContext
    }

    /**
     * Gets the mapped access token.
     * @returns {HANDLE} A handle for the mapped access token. Upon completion, the caller must free the handle by  calling <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wsdbase/nf-wsdbase-iwsdsslclientcertificate-getmappedaccesstoken
     */
    GetMappedAccessToken() {
        phToken := HANDLE()
        result := ComCall(4, this, "ptr", phToken, "HRESULT")
        return phToken
    }
}
