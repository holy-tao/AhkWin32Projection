#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IWSDAsyncResult>} pResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdendpointproxy-sendtwowayrequestasync
     */
    SendTwoWayRequestAsync(pBody, pOperation, pAsyncState, pCallback, pResult) {
        pBodyMarshal := pBody is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pBodyMarshal, pBody, "ptr", pOperation, "ptr", pAsyncState, "ptr", pCallback, "ptr*", pResult, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} ppszErrorInfo 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was no error object to return.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-geterrorinfo
     */
    GetErrorInfo(ppszErrorInfo) {
        result := ComCall(8, this, "ptr", ppszErrorInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<WSD_SOAP_FAULT>>} ppFault 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdendpointproxy-getfaultinfo
     */
    GetFaultInfo(ppFault) {
        result := ComCall(9, this, "ptr*", ppFault, "HRESULT")
        return result
    }
}
