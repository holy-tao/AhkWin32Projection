#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDtcLuSubordinateDtc.ahk" { IDtcLuSubordinateDtc }
#Import ".\IDtcLuSubordinateDtcSink.ahk" { IDtcLuSubordinateDtcSink }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITransactionOptions.ahk" { ITransactionOptions }
#Import ".\ITransaction.ahk" { ITransaction }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct IDtcLuSubordinateDtcFactory extends IUnknown {
    /**
     * The interface identifier for IDtcLuSubordinateDtcFactory
     * @type {Guid}
     */
    static IID := Guid("{4131e775-1aea-11d0-944b-00a0c905416e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDtcLuSubordinateDtcFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Create : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDtcLuSubordinateDtcFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Create Time/Date Summary property conveys the time and date when an author created the installation package, transform, or patch package.
     * @param {Pointer<Integer>} pucLuPair 
     * @param {Integer} cbLuPair 
     * @param {IUnknown} punkTransactionOuter 
     * @param {Integer} isoLevel 
     * @param {Integer} isoFlags 
     * @param {ITransactionOptions} pOptions 
     * @param {Pointer<ITransaction>} ppTransaction 
     * @param {Pointer<Integer>} pTransId 
     * @param {Integer} cbTransId 
     * @param {IDtcLuSubordinateDtcSink} pSubordinateDtcSink 
     * @param {Pointer<IDtcLuSubordinateDtc>} ppSubordinateDtc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Msi/create-time-date-summary
     */
    Create(pucLuPair, cbLuPair, punkTransactionOuter, isoLevel, isoFlags, pOptions, ppTransaction, pTransId, cbTransId, pSubordinateDtcSink, ppSubordinateDtc) {
        pucLuPairMarshal := pucLuPair is VarRef ? "char*" : "ptr"
        pTransIdMarshal := pTransId is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pucLuPairMarshal, pucLuPair, "uint", cbLuPair, "ptr", punkTransactionOuter, "int", isoLevel, "uint", isoFlags, "ptr", pOptions, ITransaction.Ptr, ppTransaction, pTransIdMarshal, pTransId, "uint", cbTransId, "ptr", pSubordinateDtcSink, IDtcLuSubordinateDtc.Ptr, ppSubordinateDtc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDtcLuSubordinateDtcFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Create := CallbackCreate(GetMethod(implObj, "Create"), flags, 12)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Create)
    }
}
