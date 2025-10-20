#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
     * 
     * @param {Pointer<IWSDAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} pAsyncState 
     * @returns {HRESULT} 
     */
    SetCallback(pCallback, pAsyncState) {
        result := ComCall(3, this, "ptr", pCallback, "ptr", pAsyncState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hWaitHandle 
     * @returns {HRESULT} 
     */
    SetWaitHandle(hWaitHandle) {
        hWaitHandle := hWaitHandle is Win32Handle ? NumGet(hWaitHandle, "ptr") : hWaitHandle

        result := ComCall(4, this, "ptr", hWaitHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    HasCompleted() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppAsyncState 
     * @returns {HRESULT} 
     */
    GetAsyncState(ppAsyncState) {
        result := ComCall(6, this, "ptr", ppAsyncState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Abort() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WSD_EVENT>} pEvent 
     * @returns {HRESULT} 
     */
    GetEvent(pEvent) {
        result := ComCall(8, this, "ptr", pEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWSDEndpointProxy>} ppEndpoint 
     * @returns {HRESULT} 
     */
    GetEndpointProxy(ppEndpoint) {
        result := ComCall(9, this, "ptr", ppEndpoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
