#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used to discover the status of the transaction that is completed by the call to CoLeaveServiceDomain when CServiceConfig is configured to use transactions in the call to CoEnterServiceDomain.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-itransactionstatus
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ITransactionStatus extends IUnknown {
    /**
     * The interface identifier for ITransactionStatus
     * @type {Guid}
     */
    static IID := Guid("{61f589e8-3724-4898-a0a4-664ae9e1d1b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionStatus interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetTransactionStatus : IntPtr
        GetTransactionStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the transaction status to either committed or aborted. Do not use this method. It is used only internally by COM+.
     * @param {HRESULT} hrStatus The status of the transaction.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionstatus-settransactionstatus
     */
    SetTransactionStatus(hrStatus) {
        result := ComCall(3, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * Retrieves the transaction status.
     * @remarks
     * The <i>pHrStatus</i> parameter is a pointer to an <b>HRESULT</b> value that indicates the transaction status according to the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Transaction status</th>
     * </tr>
     * <tr>
     * <td>S_OK
     * </td>
     * <td>The transaction has committed.
     * </td>
     * </tr>
     * <tr>
     * <td>XACT_S_LOCALLY_OK
     * </td>
     * <td>The transaction has neither committed nor aborted.
     * </td>
     * </tr>
     * <tr>
     * <td>XACT_E_NOTRANSACTION
     * </td>
     * <td>No transactions were being used through <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a>.
     * </td>
     * </tr>
     * <tr>
     * <td>XACT_E_ABORTING
     * </td>
     * <td>The transaction is doomed and will eventually abort.
     * </td>
     * </tr>
     * <tr>
     * <td>XACT_E_ABORTED
     * </td>
     * <td>The transaction was aborted.
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<HRESULT>} pHrStatus he status of the transaction. See Remarks section for more information.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionstatus-gettransactionstatus
     */
    GetTransactionStatus(pHrStatus) {
        pHrStatusMarshal := pHrStatus is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pHrStatusMarshal, pHrStatus, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetTransactionStatus := CallbackCreate(GetMethod(implObj, "SetTransactionStatus"), flags, 2)
        this.vtbl.GetTransactionStatus := CallbackCreate(GetMethod(implObj, "GetTransactionStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetTransactionStatus)
        CallbackFree(this.vtbl.GetTransactionStatus)
    }
}
