#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAsyncResult.ahk
#Include .\IWSDEndpointProxy.ahk
#Include .\IWSDMetadataExchange.ahk

/**
 * Represents a remote WSD service for client applications and middleware.
 * @remarks
 * Service proxy objects may reside on multiple endpoints. An endpoint more completely represents a URL (contains additional useful data). For example, one endpoint may support HTTP on IPv4 addresses and another may support HTTPS on IPv6 addresses. Since the same service lives on both endpoints, it is important that the service have underlying endpoint proxy objects, with each endpoint proxy corresponding to a single endpoint at which the service is available. The endpoint proxy takes care of simple messaging requests to the service, for example, sending one-way or two-way messages.
 * 
 * <b>IWSDServiceProxy</b> objects are employed to obtain service metadata, send messages to the service through a service proxy, subscribe to events on the service, and bind to proxies that provide type-specific semantics.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsdclient/nn-wsdclient-iwsdserviceproxy
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDServiceProxy extends IWSDMetadataExchange{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDServiceProxy
     * @type {Guid}
     */
    static IID => Guid("{d4c7fb9c-03ab-4175-9d67-094fafebf487}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginGetMetadata", "EndGetMetadata", "GetServiceMetadata", "SubscribeToOperation", "UnsubscribeToOperation", "SetEventingStatusCallback", "GetEndpointProxy"]

    /**
     * Initiates an asynchronous metadata exchange request with the remote service.
     * @remarks
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdserviceproxy-endgetmetadata">IWSDServiceProxy::EndGetMetadata</a> to complete the asynchronous operation and to retrieve the metadata.
     * @returns {IWSDAsyncResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that you use to poll for the result, register a callback object, or configure an event to be signaled when the response is received.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsdclient/nf-wsdclient-iwsdserviceproxy-begingetmetadata
     */
    BeginGetMetadata() {
        result := ComCall(4, this, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWSDAsyncResult(ppResult)
    }

    /**
     * Completes the asynchronous metadata exchange request and retrieves the service metadata from the response.
     * @remarks
     * <b>EndGetMetadata</b> may block until the metadata retrieval operation has completed.
     * @param {IWSDAsyncResult} pResult An <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that represents the result of the request. Release this object when done.
     * @returns {Pointer<WSD_METADATA_SECTION_LIST>} Requested metadata. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_metadata_section_list">WSD_METADATA_SECTION_LIST</a>. Do not release this object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsdclient/nf-wsdclient-iwsdserviceproxy-endgetmetadata
     */
    EndGetMetadata(pResult) {
        result := ComCall(5, this, "ptr", pResult, "ptr*", &ppMetadata := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppMetadata
    }

    /**
     * Retrieves the metadata for the IWSDServiceProxy object.
     * @remarks
     * This metadata is also available as part of the metadata produced by <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsddeviceproxy-gethostmetadata">IWSDDeviceProxy::GetHostMetadata</a>.
     * @returns {Pointer<WSD_SERVICE_METADATA>} Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_service_metadata">WSD_SERVICE_METADATA</a> structure that specifies service metadata. Do not release this object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsdclient/nf-wsdclient-iwsdserviceproxy-getservicemetadata
     */
    GetServiceMetadata() {
        result := ComCall(6, this, "ptr*", &ppServiceMetadata := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppServiceMetadata
    }

    /**
     * Subscribes to a notification or solicit/response event.
     * @remarks
     * This method is normally only called by generated proxy code.
     * @param {Pointer<WSD_OPERATION>} pOperation Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structure that specifies the operation to subscribe to.
     * @param {IUnknown} pUnknown Anonymous data passed to a client eventing callback function. This data is used to associate a client object with the subscription.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Extensible data to be added to the body of the subscription request. You can use the IWSDXML* interfaces to build the data. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.
     * @returns {Pointer<WSDXML_ELEMENT>} Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of event subscriptions. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>. Do not release this object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsdclient/nf-wsdclient-iwsdserviceproxy-subscribetooperation
     */
    SubscribeToOperation(pOperation, pUnknown, pAny) {
        result := ComCall(7, this, "ptr", pOperation, "ptr", pUnknown, "ptr", pAny, "ptr*", &ppAny := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppAny
    }

    /**
     * Cancels a subscription to a notification or solicit/response event.
     * @param {Pointer<WSD_OPERATION>} pOperation Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structure that specifies the operation subscribed to.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following:
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
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The proxy is not subscribed to the notification specified by <i>pOperation</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pOperation</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wsdclient/nf-wsdclient-iwsdserviceproxy-unsubscribetooperation
     */
    UnsubscribeToOperation(pOperation) {
        result := ComCall(8, this, "ptr", pOperation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets or clears the eventing status callback.
     * @param {IWSDEventingStatus} pStatus An <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdeventingstatus">IWSDEventingStatus</a> interface that lets the client know of status changes in event subscriptions. If <b>NULL</b>, existing eventing status callbacks are cleared.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * Method completed successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wsdclient/nf-wsdclient-iwsdserviceproxy-seteventingstatuscallback
     */
    SetEventingStatusCallback(pStatus) {
        result := ComCall(9, this, "ptr", pStatus, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the endpoint proxy for the device.
     * @remarks
     * The endpoint proxy is provided if a fault was received for a prior request. The client can then call <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdendpointproxy-getfaultinfo">IWSDEndpointProxy::GetFaultInfo</a> to determine the nature of the error.
     * @returns {IWSDEndpointProxy} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdendpointproxy">IWSDEndpointProxy</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsdclient/nf-wsdclient-iwsdserviceproxy-getendpointproxy
     */
    GetEndpointProxy() {
        result := ComCall(10, this, "ptr*", &ppProxy := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWSDEndpointProxy(ppProxy)
    }
}
