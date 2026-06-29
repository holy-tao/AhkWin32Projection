#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\DistributedTransactionCoordinator\ITransactionOptions.ahk" { ITransactionOptions }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ITransactionJoin extends IUnknown {
    /**
     * The interface identifier for ITransactionJoin
     * @type {Guid}
     */
    static IID := Guid("{0c733a5e-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionJoin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOptionsObject : IntPtr
        JoinTransaction  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionJoin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ITransactionOptions} 
     */
    GetOptionsObject() {
        result := ComCall(3, this, "ptr*", &ppOptions := 0, "HRESULT")
        return ITransactionOptions(ppOptions)
    }

    /**
     * 
     * @param {IUnknown} punkTransactionCoord 
     * @param {Integer} isoLevel 
     * @param {Integer} isoFlags 
     * @param {ITransactionOptions} pOtherOptions 
     * @returns {HRESULT} 
     */
    JoinTransaction(punkTransactionCoord, isoLevel, isoFlags, pOtherOptions) {
        result := ComCall(4, this, "ptr", punkTransactionCoord, "int", isoLevel, "uint", isoFlags, "ptr", pOtherOptions, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionJoin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOptionsObject := CallbackCreate(GetMethod(implObj, "GetOptionsObject"), flags, 2)
        this.vtbl.JoinTransaction := CallbackCreate(GetMethod(implObj, "JoinTransaction"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOptionsObject)
        CallbackFree(this.vtbl.JoinTransaction)
    }
}
