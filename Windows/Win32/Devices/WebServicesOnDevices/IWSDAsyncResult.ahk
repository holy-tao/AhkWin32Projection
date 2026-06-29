#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IWSDAsyncCallback.ahk" { IWSDAsyncCallback }
#Import ".\WSD_EVENT.ahk" { WSD_EVENT }
#Import ".\IWSDEndpointProxy.ahk" { IWSDEndpointProxy }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents an asynchronous operation.
 * @remarks
 * The <b>IWSDAsyncResult</b> interface can be used to set a wait handle to receive event or message notification or poll for operation completion. It can also retrieve the state of an asynchronous operation and retrieve the results and response body of the event.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> interface can be used to provide an asynchronous calling pattern in support of WSDAPI messaging and eventing, allowing an application to receive callback notification based on the status of an operation.
 * 
 * 
 * 
 * A failed asynchronous operation is treated as a completed asynchronous operation. Error or fault information can be retrieved from the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> interface using the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdasynccallback-asyncoperationcomplete">IWSDAsyncCallback::AsyncOperationComplete</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nn-wsdclient-iwsdasyncresult
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDAsyncResult extends IUnknown {
    /**
     * The interface identifier for IWSDAsyncResult
     * @type {Guid}
     */
    static IID := Guid("{11a9852a-8dd8-423e-b537-9356db4fbfb8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDAsyncResult interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCallback      : IntPtr
        SetWaitHandle    : IntPtr
        HasCompleted     : IntPtr
        GetAsyncState    : IntPtr
        Abort            : IntPtr
        GetEvent         : IntPtr
        GetEndpointProxy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDAsyncResult.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies a callback interface to call when the asynchronous operation has completed.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdasynccallback-asyncoperationcomplete">IWSDAsyncCallback::AsyncOperationComplete</a> method is passed the result object associated with the completing message and the state. 
     * 
     * <i>pCallback</i> is released when the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> object is destroyed.
     * @param {IWSDAsyncCallback} pCallback Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> object that contains the callback implemented by the user.
     * @param {IUnknown} pAsyncState User-defined state information to pass to the callback.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pCallback</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-setcallback
     */
    SetCallback(pCallback, pAsyncState) {
        result := ComCall(3, this, "ptr", pCallback, "ptr", pAsyncState, "HRESULT")
        return result
    }

    /**
     * Specifies a wait handle to set when the operation completes.
     * @remarks
     * Do not close <i>hWaitHandle</i> until after the asynchronous operation has completed.
     * @param {HANDLE} hWaitHandle The wait handle to set.
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
     * <i>hWaitHandle</i> is <b>NULL</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-setwaithandle
     */
    SetWaitHandle(hWaitHandle) {
        result := ComCall(4, this, HANDLE, hWaitHandle, "HRESULT")
        return result
    }

    /**
     * Indicates whether the operation has completed.
     * @remarks
     * A failed asynchronous operation is treated as a completed asynchronous operation. Error or fault information can be retrieved from the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> interface using the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdasynccallback-asyncoperationcomplete">IWSDAsyncCallback::AsyncOperationComplete</a> method.
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
     * The operation completed.
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
     * The operation has not completed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-hascompleted
     */
    HasCompleted() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Gets the state of the asynchronous operation.
     * @returns {IUnknown} User-defined state information.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-getasyncstate
     */
    GetAsyncState() {
        result := ComCall(6, this, "ptr*", &ppAsyncState := 0, "HRESULT")
        return IUnknown(ppAsyncState)
    }

    /**
     * Aborts the asynchronous operation.
     * @remarks
     * <b>Abort</b> waits for all pending callbacks set with <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdasyncresult-setcallback">SetCallback</a> to complete before returning to the caller.
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
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-abort
     */
    Abort() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a WSD_EVENT structure that contains the result of the event.
     * @remarks
     * This method should only be called by <a href="https://docs.microsoft.com/windows/desktop/WsdApi/web-services-for-devices-code-generator">generated code</a> and only after the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> object has signaled that the operation has completed.
     * @returns {WSD_EVENT} Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_event">WSD_EVENT</a> structure that provides data about the event.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-getevent
     */
    GetEvent() {
        pEvent := WSD_EVENT()
        result := ComCall(8, this, WSD_EVENT.Ptr, pEvent, "HRESULT")
        return pEvent
    }

    /**
     * Retrieves the endpoint proxy for the asynchronous operation.
     * @returns {IWSDEndpointProxy} An <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdendpointproxy">IWSDEndpointProxy</a> interface that implements an endpoint proxy.
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-getendpointproxy
     */
    GetEndpointProxy() {
        result := ComCall(9, this, "ptr*", &ppEndpoint := 0, "HRESULT")
        return IWSDEndpointProxy(ppEndpoint)
    }

    Query(iid) {
        if (IWSDAsyncResult.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCallback := CallbackCreate(GetMethod(implObj, "SetCallback"), flags, 3)
        this.vtbl.SetWaitHandle := CallbackCreate(GetMethod(implObj, "SetWaitHandle"), flags, 2)
        this.vtbl.HasCompleted := CallbackCreate(GetMethod(implObj, "HasCompleted"), flags, 1)
        this.vtbl.GetAsyncState := CallbackCreate(GetMethod(implObj, "GetAsyncState"), flags, 2)
        this.vtbl.Abort := CallbackCreate(GetMethod(implObj, "Abort"), flags, 1)
        this.vtbl.GetEvent := CallbackCreate(GetMethod(implObj, "GetEvent"), flags, 2)
        this.vtbl.GetEndpointProxy := CallbackCreate(GetMethod(implObj, "GetEndpointProxy"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCallback)
        CallbackFree(this.vtbl.SetWaitHandle)
        CallbackFree(this.vtbl.HasCompleted)
        CallbackFree(this.vtbl.GetAsyncState)
        CallbackFree(this.vtbl.Abort)
        CallbackFree(this.vtbl.GetEvent)
        CallbackFree(this.vtbl.GetEndpointProxy)
    }
}
