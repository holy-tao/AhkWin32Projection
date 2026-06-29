#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IServiceTransactionConfig.ahk" { IServiceTransactionConfig }
#Import ".\ITransactionProxy.ahk" { ITransactionProxy }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Enables you to run a set of code in the scope of an existing transaction that you specify with a transaction proxy.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicesystxnconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServiceSysTxnConfig extends IServiceTransactionConfig {
    /**
     * The interface identifier for IServiceSysTxnConfig
     * @type {Guid}
     */
    static IID := Guid("{33caf1a1-fcb8-472b-b45e-967448ded6d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServiceSysTxnConfig interfaces
    */
    struct Vtbl extends IServiceTransactionConfig.Vtbl {
        ConfigureBYOTSysTxn : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServiceSysTxnConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables you to run the enclosed code in the scope of an existing transaction that you specify with a transaction proxy.
     * @param {ITransactionProxy} pTxProxy The <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-itransactionproxy">ITransactionProxy</a> interface of the existing transaction in which you will run the enclosed code.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicesystxnconfig-configurebyotsystxn
     */
    ConfigureBYOTSysTxn(pTxProxy) {
        result := ComCall(9, this, "ptr", pTxProxy, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServiceSysTxnConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConfigureBYOTSysTxn := CallbackCreate(GetMethod(implObj, "ConfigureBYOTSysTxn"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConfigureBYOTSysTxn)
    }
}
