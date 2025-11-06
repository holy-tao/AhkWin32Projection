#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAsyncResult.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements a device services messaging proxy.
 * @remarks
 * 
  * Service proxy objects may reside on multiple endpoints. An endpoint more completely represents a URL (contains additional useful data). One endpoint may support HTTP on IPv4 addresses and another may support HTTPS on IPv6 addresses. Since the same service lives on both endpoints, it is important that the service have underlying endpoint proxy objects, with each endpoint proxy corresponding to a single endpoint at which the service is available. The endpoint proxy takes care of simple messaging requests to the service, for example, sending one-way or two-way messages.
  * 
  * Endpoint proxies are generally used inside WSDAPI, but they can be retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdserviceproxy">IWSDServiceProxy</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsddeviceproxy">IWSDDeviceProxy</a> objects to expose message-level functionality.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsdendpointproxy
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDEndpointProxy extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDEndpointProxy
     * @type {Guid}
     */
    static IID => Guid("{1860d430-b24c-4975-9f90-dbb39baa24ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendOneWayRequest", "SendTwoWayRequest", "SendTwoWayRequestAsync", "AbortAsyncOperation", "ProcessFault", "GetErrorInfo", "GetFaultInfo"]

    /**
     * 
     * @param {Pointer<Void>} pBody 
     * @param {Pointer<WSD_OPERATION>} pOperation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdendpointproxy-sendonewayrequest
     */
    SendOneWayRequest(pBody, pOperation) {
        pBodyMarshal := pBody is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pBodyMarshal, pBody, "ptr", pOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBody 
     * @param {Pointer<WSD_OPERATION>} pOperation 
     * @param {Pointer<WSD_SYNCHRONOUS_RESPONSE_CONTEXT>} pResponseContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdendpointproxy-sendtwowayrequest
     */
    SendTwoWayRequest(pBody, pOperation, pResponseContext) {
        pBodyMarshal := pBody is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pBodyMarshal, pBody, "ptr", pOperation, "ptr", pResponseContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBody 
     * @param {Pointer<WSD_OPERATION>} pOperation 
     * @param {IUnknown} pAsyncState 
     * @param {IWSDAsyncCallback} pCallback 
     * @returns {IWSDAsyncResult} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdendpointproxy-sendtwowayrequestasync
     */
    SendTwoWayRequestAsync(pBody, pOperation, pAsyncState, pCallback) {
        pBodyMarshal := pBody is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pBodyMarshal, pBody, "ptr", pOperation, "ptr", pAsyncState, "ptr", pCallback, "ptr*", &pResult := 0, "HRESULT")
        return IWSDAsyncResult(pResult)
    }

    /**
     * 
     * @param {IWSDAsyncResult} pAsyncResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdendpointproxy-abortasyncoperation
     */
    AbortAsyncOperation(pAsyncResult) {
        result := ComCall(6, this, "ptr", pAsyncResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WSD_SOAP_FAULT>} pFault 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdendpointproxy-processfault
     */
    ProcessFault(pFault) {
        result := ComCall(7, this, "ptr", pFault, "HRESULT")
        return result
    }

    /**
     * Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
     * @returns {PWSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-geterrorinfo
     */
    GetErrorInfo() {
        result := ComCall(8, this, "ptr*", &ppszErrorInfo := 0, "HRESULT")
        return ppszErrorInfo
    }

    /**
     * 
     * @returns {Pointer<WSD_SOAP_FAULT>} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdendpointproxy-getfaultinfo
     */
    GetFaultInfo() {
        result := ComCall(9, this, "ptr*", &ppFault := 0, "HRESULT")
        return ppFault
    }
}
