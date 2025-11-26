#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWSDAsyncResult.ahk
#Include .\IWSDServiceProxy.ahk

/**
 * Represents a remote WSD service for client applications and middleware. This interface allows for the implementation of multiple asynchronous operations.
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsdserviceproxyeventing
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDServiceProxyEventing extends IWSDServiceProxy{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDServiceProxyEventing
     * @type {Guid}
     */
    static IID => Guid("{f9279d6d-1012-4a94-b8cc-fd35d2202bfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SubscribeToMultipleOperations", "BeginSubscribeToMultipleOperations", "EndSubscribeToMultipleOperations", "UnsubscribeToMultipleOperations", "BeginUnsubscribeToMultipleOperations", "EndUnsubscribeToMultipleOperations", "RenewMultipleOperations", "BeginRenewMultipleOperations", "EndRenewMultipleOperations", "GetStatusForMultipleOperations", "BeginGetStatusForMultipleOperations", "EndGetStatusForMultipleOperations"]

    /**
     * Subscribes to a collection of notifications or solicit/response events.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operations of whcih to subscribe.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IUnknown} pUnknown Anonymous data passed to a client eventing callback function. This data is used to associate a client object with the subscription.
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies requested duration for the subscription.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to extensible data to be added to the body of the request.  This parameter is optional.
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specfies the duration of the subscription.  Upon completion, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory.   This parameter is optional.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of event subscriptions. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.   This parameter is optional.
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
     * The proxy has already subscribed to the operation specified by <i>pOperation</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-subscribetomultipleoperations
     */
    SubscribeToMultipleOperations(pOperations, dwOperationCount, pUnknown, pExpires, pAny, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pUnknown, "ptr", pExpires, "ptr", pAny, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * Initializes an asynchronous operation that subscribes to a collection of notifications or solicit/response events.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operations of which to subscribe.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IUnknown} pUnknown Anonymous data passed to a client eventing callback function. This data is used to associate a client object with the subscription.
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies the requested duration for the subscription.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to extensible data to be added to the body of the request.  This parameter is optional.
     * @param {IUnknown} pAsyncState Anonymous data passed to <i>pAsyncCallback</i> when the callback is called.  This data is used to associate a client object with the pending operation.  This parameter is optional.
     * @param {IWSDAsyncCallback} pAsyncCallback Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> object that performs the message callback status notifications.  This parameter is optional.
     * @returns {IWSDAsyncResult} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that will represent the result of the requests upon completion.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-beginsubscribetomultipleoperations
     */
    BeginSubscribeToMultipleOperations(pOperations, dwOperationCount, pUnknown, pExpires, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(12, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pUnknown, "ptr", pExpires, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * Completes an asynchronous operation that subscribes to a collection of notifications or solicit/response events.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the subscribed operations.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IWSDAsyncResult} pResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that represents the result of the requests upon completion.
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specfies the duration of the subscription.  Upon completion, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory.  This parameter is optional.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of event subscriptions. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.  This parameter is optional.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endsubscribetomultipleoperations
     */
    EndSubscribeToMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * Cancels a collection of subscriptions to notifications or solicit/response events.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operations to unsubscribe from.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to extensible data to be added to the body of the request.
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
     * <i>pOperation</i> is NULL.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-unsubscribetomultipleoperations
     */
    UnsubscribeToMultipleOperations(pOperations, dwOperationCount, pAny) {
        result := ComCall(14, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, "HRESULT")
        return result
    }

    /**
     * Initializes an asynchronous cancelation request for a subscription to a collection of notifications or solicit/response events.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operations to unsubscribe from.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to extensible data to be added to the body of the request.  This parameter is optional.
     * @param {IUnknown} pAsyncState Anonymous data passed to <i>pAsyncCallback</i> when the callback is called.  This data is used to associate a client object with the pending operation.  This parameter is optional.
     * @param {IWSDAsyncCallback} pAsyncCallback Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> object that performs the message callback status notifications.  This parameter is optional.
     * @returns {IWSDAsyncResult} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that will represent the result of the requests upon completion.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-beginunsubscribetomultipleoperations
     */
    BeginUnsubscribeToMultipleOperations(pOperations, dwOperationCount, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(15, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * Completes an asynchronous cancellation request for a subscription to a collection of notifications or solicit/response events.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specifies the operations from which to unsubscribe.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IWSDAsyncResult} pResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that will represent the result of the requests upon completion.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endunsubscribetomultipleoperations
     */
    EndUnsubscribeToMultipleOperations(pOperations, dwOperationCount, pResult) {
        result := ComCall(16, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * Renews a collection of existing notification subscriptions by submitting a new duration.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operation subscriptions to renew.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies requested duration for the subscription.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to extensible data to be added to the body of the request.  This parameter is optional.
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies the duration of the subscription that was just renewed.  Upon completion, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory.  This parameter is optional.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of renew requests. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.  This parameter is optional.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-renewmultipleoperations
     */
    RenewMultipleOperations(pOperations, dwOperationCount, pExpires, pAny, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pExpires, "ptr", pAny, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * Initializes an asynchronous operation that renews a collection of existing notification subscriptions by submitting a new duration.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operation subscriptions to renew.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies requested duration for the subscription.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to extensible data to be added to the body of the request.  This parameter is optional.
     * @param {IUnknown} pAsyncState Anonymous data passed to <i>pAsyncCallback</i> when the callback is called.  This data is used to associate a client object with the pending operation.  This parameter is optional.
     * @param {IWSDAsyncCallback} pAsyncCallback Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> object that performs the message callback status notifications.  This parameter is optional.
     * @returns {IWSDAsyncResult} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that will represent the result of the requests upon completion.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-beginrenewmultipleoperations
     */
    BeginRenewMultipleOperations(pOperations, dwOperationCount, pExpires, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(18, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pExpires, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * Completes an asynchronous operation that renews a collection of existing notification subscriptions by submitting a new duration.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operation subscriptions to renew.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IWSDAsyncResult} pResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that represents the result of the requests upon completion.
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specfies the duration of the subscription that was just renewed.  Upon completion, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory.  This parameter is optional.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of event subscriptions. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.  This parameter is optional.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endrenewmultipleoperations
     */
    EndRenewMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * Retrieves the current status.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operation subscriptions to get status on.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to extensible data to be added to the body of the request.  This parameter is optional.
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specfies the duration of the subscription.  Upon completion, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory.   This parameter is optional.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of getstatus requests. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.  This parameter is optional.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-getstatusformultipleoperations
     */
    GetStatusForMultipleOperations(pOperations, dwOperationCount, pAny, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * Begins an asynchronous operation that retrieves the current status.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operation subscriptions to get status on.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to extensible data to be added to the body of the request.  This parameter is optional.
     * @param {IUnknown} pAsyncState Anonymous data passed to <i>pAsyncCallback</i> when the callback is called.  This data is used to associate a client object with the pending operation.  This parameter is optional.
     * @param {IWSDAsyncCallback} pAsyncCallback Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> object that performs the message callback status notifications.  This parameter is optional.
     * @returns {IWSDAsyncResult} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that will represent the result of the requests upon completion.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-begingetstatusformultipleoperations
     */
    BeginGetStatusForMultipleOperations(pOperations, dwOperationCount, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(21, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * Completes an asynchronous operation that retrieves the current status.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operation subscriptions to get status on.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IWSDAsyncResult} pResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that represents the result of the requests upon completion.
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specfies the duration of the subscription.  Upon completion, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory.   This parameter is optional.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of getstatu requests. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.  This parameter is optional.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endgetstatusformultipleoperations
     */
    EndGetStatusForMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, "ptr", pOperations, "uint", dwOperationCount, "ptr", pResult, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }
}
