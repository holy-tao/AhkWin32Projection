#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Pointer<CERT_CONTEXT>>} ppCertContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdsslclientcertificate-getclientcertificate
     */
    GetClientCertificate(ppCertContext) {
        ppCertContextMarshal := ppCertContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppCertContextMarshal, ppCertContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phToken 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdbase/nf-wsdbase-iwsdsslclientcertificate-getmappedaccesstoken
     */
    GetMappedAccessToken(phToken) {
        result := ComCall(4, this, "ptr", phToken, "HRESULT")
        return result
    }
}
