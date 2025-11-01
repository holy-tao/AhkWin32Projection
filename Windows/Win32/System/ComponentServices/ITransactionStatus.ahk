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
     * 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionstatus-settransactionstatus
     */
    SetTransactionStatus(hrStatus) {
        result := ComCall(3, this, "int", hrStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} pHrStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-itransactionstatus-gettransactionstatus
     */
    GetTransactionStatus(pHrStatus) {
        result := ComCall(4, this, "ptr", pHrStatus, "HRESULT")
        return result
    }
}
