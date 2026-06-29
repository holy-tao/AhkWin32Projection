#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWSDAsyncResult.ahk" { IWSDAsyncResult }

/**
 * Handles callbacks for the completion of an asynchronous operation.
 * @remarks
 * This interface provides an asynchronous calling pattern in support of WSDAPI messaging and eventing, allowing an application to receive callback notification based on the status of an operation.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> interface can be used to wait for event notification or to poll for operation completion if asynchronous callbacks are not required.
 * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nn-wsdclient-iwsdasynccallback
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDAsyncCallback extends IUnknown {
    /**
     * The interface identifier for IWSDAsyncCallback
     * @type {Guid}
     */
    static IID := Guid("{a63e109d-ce72-49e2-ba98-e845f5ee1666}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDAsyncCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AsyncOperationComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDAsyncCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that the asynchronous operation has completed.
     * @remarks
     * The value returned by <b>AsyncOperationComplete</b> is ignored.
     * @param {IWSDAsyncResult} pAsyncResult Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nn-wsdclient-iwsdasyncresult">IWSDAsyncResult</a> object that contains the user-defined state information passed to <a href="https://docs.microsoft.com/windows/desktop/api/wsdclient/nf-wsdclient-iwsdasyncresult-setcallback">IWSDAsyncResult::SetCallback</a>.
     * @param {IUnknown} pAsyncState The state of the asynchronous operation.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdasynccallback-asyncoperationcomplete
     */
    AsyncOperationComplete(pAsyncResult, pAsyncState) {
        result := ComCall(3, this, "ptr", pAsyncResult, "ptr", pAsyncState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSDAsyncCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AsyncOperationComplete := CallbackCreate(GetMethod(implObj, "AsyncOperationComplete"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AsyncOperationComplete)
    }
}
