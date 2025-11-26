#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to discover the status of the transaction that is completed by the call to CoLeaveServiceDomain when CServiceConfig is configured to use transactions in the call to CoEnterServiceDomain.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-itransactionstatus
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ITransactionStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionStatus
     * @type {Guid}
     */
    static IID => Guid("{61f589e8-3724-4898-a0a4-664ae9e1d1b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTransactionStatus", "GetTransactionStatus"]

    /**
     * Sets the transaction status to either committed or aborted. Do not use this method. It is used only internally by COM+.
     * @param {HRESULT} hrStatus The status of the transaction.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionstatus-settransactionstatus
     */
    SetTransactionStatus(hrStatus) {
        result := ComCall(3, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * Retrieves the transaction status.
     * @param {Pointer<HRESULT>} pHrStatus he status of the transaction. See Remarks section for more information.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-itransactionstatus-gettransactionstatus
     */
    GetTransactionStatus(pHrStatus) {
        pHrStatusMarshal := pHrStatus is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pHrStatusMarshal, pHrStatus, "HRESULT")
        return result
    }
}
