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
     * 
     * @param {IWSDAsyncCallback} pCallback 
     * @param {IUnknown} pAsyncState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-setcallback
     */
    SetCallback(pCallback, pAsyncState) {
        result := ComCall(3, this, "ptr", pCallback, "ptr", pAsyncState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hWaitHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-setwaithandle
     */
    SetWaitHandle(hWaitHandle) {
        hWaitHandle := hWaitHandle is Win32Handle ? NumGet(hWaitHandle, "ptr") : hWaitHandle

        result := ComCall(4, this, "ptr", hWaitHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-hascompleted
     */
    HasCompleted() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-getasyncstate
     */
    GetAsyncState() {
        result := ComCall(6, this, "ptr*", &ppAsyncState := 0, "HRESULT")
        return IUnknown(ppAsyncState)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-abort
     */
    Abort() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {WSD_EVENT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-getevent
     */
    GetEvent() {
        pEvent := WSD_EVENT()
        result := ComCall(8, this, "ptr", pEvent, "HRESULT")
        return pEvent
    }

    /**
     * 
     * @returns {IWSDEndpointProxy} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasyncresult-getendpointproxy
     */
    GetEndpointProxy() {
        result := ComCall(9, this, "ptr*", &ppEndpoint := 0, "HRESULT")
        return IWSDEndpointProxy(ppEndpoint)
    }
}
