#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWSDAsyncCallback.ahk" { IWSDAsyncCallback }
#Import ".\WSD_OPERATION.ahk" { WSD_OPERATION }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WSD_EVENTING_EXPIRES.ahk" { WSD_EVENTING_EXPIRES }
#Import ".\IWSDServiceProxy.ahk" { IWSDServiceProxy }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWSDAsyncResult.ahk" { IWSDAsyncResult }

/**
 * Represents a remote WSD service for client applications and middleware. This interface allows for the implementation of multiple asynchronous operations.
 * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nn-wsdclient-iwsdserviceproxyeventing
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDServiceProxyEventing extends IWSDServiceProxy {
    /**
     * The interface identifier for IWSDServiceProxyEventing
     * @type {Guid}
     */
    static IID := Guid("{f9279d6d-1012-4a94-b8cc-fd35d2202bfe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDServiceProxyEventing interfaces
    */
    struct Vtbl extends IWSDServiceProxy.Vtbl {
        SubscribeToMultipleOperations        : IntPtr
        BeginSubscribeToMultipleOperations   : IntPtr
        EndSubscribeToMultipleOperations     : IntPtr
        UnsubscribeToMultipleOperations      : IntPtr
        BeginUnsubscribeToMultipleOperations : IntPtr
        EndUnsubscribeToMultipleOperations   : IntPtr
        RenewMultipleOperations              : IntPtr
        BeginRenewMultipleOperations         : IntPtr
        EndRenewMultipleOperations           : IntPtr
        GetStatusForMultipleOperations       : IntPtr
        BeginGetStatusForMultipleOperations  : IntPtr
        EndGetStatusForMultipleOperations    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDServiceProxyEventing.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Subscribes to a collection of notifications or solicit/response events.
     * @remarks
     * This method is designed to be exclusively called by generated proxy code.
     * 
     * The method is synchronous and will return when the requests have completed or the expiration criteria have been satisfied.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operations of whiCh to subscribe.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-subscribetomultipleoperations
     */
    SubscribeToMultipleOperations(pOperations, dwOperationCount, pUnknown, pExpires, pAny, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, "ptr", pUnknown, WSD_EVENTING_EXPIRES.Ptr, pExpires, WSDXML_ELEMENT.Ptr, pAny, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * Initializes an asynchronous operation that subscribes to a collection of notifications or solicit/response events.
     * @remarks
     * This method is designed to be exclusively called by generated proxy code.
     * 
     * The method is asynchronous and will return immediately.    The caller should subsequently call <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endsubscribetomultipleoperations">EndSubscribeToMultipleOperations</a>.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operations of which to subscribe.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IUnknown} pUnknown Anonymous data passed to a client eventing callback function. This data is used to associate a client object with the subscription.
     * @param {Pointer<WSD_EVENTING_EXPIRES>} pExpires Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specifies the requested duration for the subscription.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to extensible data to be added to the body of the request.  This parameter is optional.
     * @param {IUnknown} pAsyncState Anonymous data passed to <i>pAsyncCallback</i> when the callback is called.  This data is used to associate a client object with the pending operation.  This parameter is optional.
     * @param {IWSDAsyncCallback} pAsyncCallback Reference to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> object that performs the message callback status notifications.  This parameter is optional.
     * @returns {IWSDAsyncResult} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that will represent the result of the requests upon completion.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-beginsubscribetomultipleoperations
     */
    BeginSubscribeToMultipleOperations(pOperations, dwOperationCount, pUnknown, pExpires, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(12, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, "ptr", pUnknown, WSD_EVENTING_EXPIRES.Ptr, pExpires, WSDXML_ELEMENT.Ptr, pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * Completes an asynchronous operation that subscribes to a collection of notifications or solicit/response events.
     * @remarks
     * This method is designed to be exclusively called by generated proxy code.
     * 
     * The method is used to obtain the results from a previous asynchronous <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-beginsubscribetomultipleoperations">BeginSubscribeToMultipleOperations</a> call.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the subscribed operations.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IWSDAsyncResult} pResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that represents the result of the requests upon completion.
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specfies the duration of the subscription.  Upon completion, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory.  This parameter is optional.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of event subscriptions. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.  This parameter is optional.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endsubscribetomultipleoperations
     */
    EndSubscribeToMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, "ptr", pResult, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * Cancels a collection of subscriptions to notifications or solicit/response events.
     * @remarks
     * This method is designed to be exclusively called by generated proxy code.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-unsubscribetomultipleoperations
     */
    UnsubscribeToMultipleOperations(pOperations, dwOperationCount, pAny) {
        result := ComCall(14, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, WSDXML_ELEMENT.Ptr, pAny, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-beginunsubscribetomultipleoperations
     */
    BeginUnsubscribeToMultipleOperations(pOperations, dwOperationCount, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(15, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, WSDXML_ELEMENT.Ptr, pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * Completes an asynchronous cancellation request for a subscription to a collection of notifications or solicit/response events.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specifies the operations from which to unsubscribe.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IWSDAsyncResult} pResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that will represent the result of the requests upon completion.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endunsubscribetomultipleoperations
     */
    EndUnsubscribeToMultipleOperations(pOperations, dwOperationCount, pResult) {
        result := ComCall(16, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, "ptr", pResult, "HRESULT")
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-renewmultipleoperations
     */
    RenewMultipleOperations(pOperations, dwOperationCount, pExpires, pAny, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, WSD_EVENTING_EXPIRES.Ptr, pExpires, WSDXML_ELEMENT.Ptr, pAny, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-beginrenewmultipleoperations
     */
    BeginRenewMultipleOperations(pOperations, dwOperationCount, pExpires, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(18, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, WSD_EVENTING_EXPIRES.Ptr, pExpires, WSDXML_ELEMENT.Ptr, pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * Completes an asynchronous operation that renews a collection of existing notification subscriptions by submitting a new duration.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operation subscriptions to renew.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IWSDAsyncResult} pResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that represents the result of the requests upon completion.
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specfies the duration of the subscription that was just renewed.  Upon completion, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory.  This parameter is optional.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of event subscriptions. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.  This parameter is optional.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endrenewmultipleoperations
     */
    EndRenewMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, "ptr", pResult, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    /**
     * Retrieves the current status.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operation subscriptions to get status on.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {Pointer<WSDXML_ELEMENT>} pAny Pointer to extensible data to be added to the body of the request.  This parameter is optional.
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specfies the duration of the subscription.  Upon completion, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory.   This parameter is optional.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of getstatus requests. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.  This parameter is optional.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-getstatusformultipleoperations
     */
    GetStatusForMultipleOperations(pOperations, dwOperationCount, pAny, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(20, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, WSDXML_ELEMENT.Ptr, pAny, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-begingetstatusformultipleoperations
     */
    BeginGetStatusForMultipleOperations(pOperations, dwOperationCount, pAny, pAsyncState, pAsyncCallback) {
        result := ComCall(21, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, WSDXML_ELEMENT.Ptr, pAny, "ptr", pAsyncState, "ptr", pAsyncCallback, "ptr*", &ppResult := 0, "HRESULT")
        return IWSDAsyncResult(ppResult)
    }

    /**
     * Completes an asynchronous operation that retrieves the current status.
     * @param {Pointer<WSD_OPERATION>} pOperations Pointer to an array of references to <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_operation">WSD_OPERATION</a> structures that specify the operation subscriptions to get status on.
     * @param {Integer} dwOperationCount The number of elements in the array in <i>pOperations</i>.
     * @param {IWSDAsyncResult} pResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface that represents the result of the requests upon completion.
     * @param {Pointer<Pointer<WSD_EVENTING_EXPIRES>>} ppExpires Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_eventing_expires">WSD_EVENTING_EXPIRES</a> structure that specfies the duration of the subscription.  Upon completion, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory.   This parameter is optional.
     * @param {Pointer<Pointer<WSDXML_ELEMENT>>} ppAny Extensible data that the remote device can add to the subscription response. This allows services to provide additional customization of getstatu requests. When done, call  <a href="https://docs.microsoft.com/windows/desktop/api/wsdutil/nf-wsdutil-wsdfreelinkedmemory">WSDFreeLinkedMemory</a> to free the memory. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a>.  This parameter is optional.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdserviceproxyeventing-endgetstatusformultipleoperations
     */
    EndGetStatusForMultipleOperations(pOperations, dwOperationCount, pResult, ppExpires, ppAny) {
        ppExpiresMarshal := ppExpires is VarRef ? "ptr*" : "ptr"
        ppAnyMarshal := ppAny is VarRef ? "ptr*" : "ptr"

        result := ComCall(22, this, WSD_OPERATION.Ptr, pOperations, "uint", dwOperationCount, "ptr", pResult, ppExpiresMarshal, ppExpires, ppAnyMarshal, ppAny, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSDServiceProxyEventing.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SubscribeToMultipleOperations := CallbackCreate(GetMethod(implObj, "SubscribeToMultipleOperations"), flags, 8)
        this.vtbl.BeginSubscribeToMultipleOperations := CallbackCreate(GetMethod(implObj, "BeginSubscribeToMultipleOperations"), flags, 9)
        this.vtbl.EndSubscribeToMultipleOperations := CallbackCreate(GetMethod(implObj, "EndSubscribeToMultipleOperations"), flags, 6)
        this.vtbl.UnsubscribeToMultipleOperations := CallbackCreate(GetMethod(implObj, "UnsubscribeToMultipleOperations"), flags, 4)
        this.vtbl.BeginUnsubscribeToMultipleOperations := CallbackCreate(GetMethod(implObj, "BeginUnsubscribeToMultipleOperations"), flags, 7)
        this.vtbl.EndUnsubscribeToMultipleOperations := CallbackCreate(GetMethod(implObj, "EndUnsubscribeToMultipleOperations"), flags, 4)
        this.vtbl.RenewMultipleOperations := CallbackCreate(GetMethod(implObj, "RenewMultipleOperations"), flags, 7)
        this.vtbl.BeginRenewMultipleOperations := CallbackCreate(GetMethod(implObj, "BeginRenewMultipleOperations"), flags, 8)
        this.vtbl.EndRenewMultipleOperations := CallbackCreate(GetMethod(implObj, "EndRenewMultipleOperations"), flags, 6)
        this.vtbl.GetStatusForMultipleOperations := CallbackCreate(GetMethod(implObj, "GetStatusForMultipleOperations"), flags, 6)
        this.vtbl.BeginGetStatusForMultipleOperations := CallbackCreate(GetMethod(implObj, "BeginGetStatusForMultipleOperations"), flags, 7)
        this.vtbl.EndGetStatusForMultipleOperations := CallbackCreate(GetMethod(implObj, "EndGetStatusForMultipleOperations"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SubscribeToMultipleOperations)
        CallbackFree(this.vtbl.BeginSubscribeToMultipleOperations)
        CallbackFree(this.vtbl.EndSubscribeToMultipleOperations)
        CallbackFree(this.vtbl.UnsubscribeToMultipleOperations)
        CallbackFree(this.vtbl.BeginUnsubscribeToMultipleOperations)
        CallbackFree(this.vtbl.EndUnsubscribeToMultipleOperations)
        CallbackFree(this.vtbl.RenewMultipleOperations)
        CallbackFree(this.vtbl.BeginRenewMultipleOperations)
        CallbackFree(this.vtbl.EndRenewMultipleOperations)
        CallbackFree(this.vtbl.GetStatusForMultipleOperations)
        CallbackFree(this.vtbl.BeginGetStatusForMultipleOperations)
        CallbackFree(this.vtbl.EndGetStatusForMultipleOperations)
    }
}
