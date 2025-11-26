#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\WSD_EVENT.ahk
#Include .\IWSDEndpointProxy.ahk

/**
 * Represents an asynchronous operation.
 * @remarks
 * 
 * The <b>IWSDAsyncResult</b> interface can be used to set a wait handle to receive event or message notification or poll for operation completion. It can also retrieve the state of an asynchronous operation and retrieve the results and response body of the event.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> interface can be used to provide an asynchronous calling pattern in support of WSDAPI messaging and eventing, allowing an application to receive callback notification based on the status of an operation.
 * 
 * 
 * 
 * A failed asynchronous operation is treated as a completed asynchronous operation. Error or fault information can be retrieved from the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasynccallback">IWSDAsyncCallback</a> interface using the <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdasynccallback-asyncoperationcomplete">IWSDAsyncCallback::AsyncOperationComplete</a> method.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsdasyncresult
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDAsyncResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDAsyncResult
     * @type {Guid}
     */
    static IID => Guid("{11a9852a-8dd8-423e-b537-9356db4fbfb8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCallback", "SetWaitHandle", "HasCompleted", "GetAsyncState", "Abort", "GetEvent", "GetEndpointProxy"]

    /**
     * Specifies a callback interface to call when the asynchronous operation has completed.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdasyncresult-setcallback
     */
    SetCallback(pCallback, pAsyncState) {
        result := ComCall(3, this, "ptr", pCallback, "ptr", pAsyncState, "HRESULT")
        return result
    }

    /**
     * Specifies a wait handle to set when the operation completes.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdasyncresult-setwaithandle
     */
    SetWaitHandle(hWaitHandle) {
        hWaitHandle := hWaitHandle is Win32Handle ? NumGet(hWaitHandle, "ptr") : hWaitHandle

        result := ComCall(4, this, "ptr", hWaitHandle, "HRESULT")
        return result
    }

    /**
     * Indicates whether the operation has completed.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdasyncresult-hascompleted
     */
    HasCompleted() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Gets the state of the asynchronous operation.
     * @returns {IUnknown} User-defined state information.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdasyncresult-getasyncstate
     */
    GetAsyncState() {
        result := ComCall(6, this, "ptr*", &ppAsyncState := 0, "HRESULT")
        return IUnknown(ppAsyncState)
    }

    /**
     * Aborts the asynchronous operation.
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
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdasyncresult-abort
     */
    Abort() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a WSD_EVENT structure that contains the result of the event.
     * @returns {WSD_EVENT} Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_event">WSD_EVENT</a> structure that provides data about the event.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdasyncresult-getevent
     */
    GetEvent() {
        pEvent := WSD_EVENT()
        result := ComCall(8, this, "ptr", pEvent, "HRESULT")
        return pEvent
    }

    /**
     * Retrieves the endpoint proxy for the asynchronous operation.
     * @returns {IWSDEndpointProxy} An <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdendpointproxy">IWSDEndpointProxy</a> interface that implements an endpoint proxy.
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdasyncresult-getendpointproxy
     */
    GetEndpointProxy() {
        result := ComCall(9, this, "ptr*", &ppEndpoint := 0, "HRESULT")
        return IWSDEndpointProxy(ppEndpoint)
    }
}
