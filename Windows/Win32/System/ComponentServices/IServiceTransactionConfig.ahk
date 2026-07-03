#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IServiceTransactionConfigBase.ahk" { IServiceTransactionConfigBase }
#Import "..\DistributedTransactionCoordinator\ITransaction.ahk" { ITransaction }

/**
 * Configures the transaction services for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain. (IServiceTransactionConfig)
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicetransactionconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServiceTransactionConfig extends IServiceTransactionConfigBase {
    /**
     * The interface identifier for IServiceTransactionConfig
     * @type {Guid}
     */
    static IID := Guid("{59f4c2a3-d3d7-4a31-b6e4-6ab3177c50b9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceTransactionConfig interfaces
    */
    struct Vtbl extends IServiceTransactionConfigBase.Vtbl {
        ConfigureBYOT : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceTransactionConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables you to configure the transaction that you use when you bring your own transaction.
     * @remarks
     * When you bring your own transaction, that transaction's settings override the settings from the inherited methods of the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iservicetransactionconfig">IServiceTransactionConfig</a> interface.
     * 
     * The <b>ConfigureBYOT</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-bringyourowntransaction">IServiceTransactionConfigBase::BringYourOwnTransaction</a> methods are identical in behavior; the only difference is the type of parameter passed to each method.
     * @param {ITransaction} pITxByot A pointer to the <b>ITransaction</b> interface of the existing transaction in which you want to run the enclosed code.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfig-configurebyot
     */
    ConfigureBYOT(pITxByot) {
        result := ComCall(8, this, "ptr", pITxByot, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServiceTransactionConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConfigureBYOT := CallbackCreate(GetMethod(implObj, "ConfigureBYOT"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConfigureBYOT)
    }
}
