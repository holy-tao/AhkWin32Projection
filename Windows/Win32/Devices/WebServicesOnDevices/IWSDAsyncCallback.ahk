#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles callbacks for the completion of an asynchronous operation.
 * @remarks
 * 
  * This interface provides an asynchronous calling pattern in support of WSDAPI messaging and eventing, allowing an application to receive callback notification based on the status of an operation.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface can be used to wait for event notification or to poll for operation completion if asynchronous callbacks are not required.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsdasynccallback
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDAsyncCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDAsyncCallback
     * @type {Guid}
     */
    static IID => Guid("{a63e109d-ce72-49e2-ba98-e845f5ee1666}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AsyncOperationComplete"]

    /**
     * 
     * @param {IWSDAsyncResult} pAsyncResult 
     * @param {IUnknown} pAsyncState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasynccallback-asyncoperationcomplete
     */
    AsyncOperationComplete(pAsyncResult, pAsyncState) {
        result := ComCall(3, this, "ptr", pAsyncResult, "ptr", pAsyncState, "HRESULT")
        return result
    }
}
