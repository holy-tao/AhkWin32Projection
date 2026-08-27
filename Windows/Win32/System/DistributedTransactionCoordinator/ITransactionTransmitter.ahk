#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITransaction.ahk" { ITransaction }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionTransmitter extends IUnknown {
    /**
     * The interface identifier for ITransactionTransmitter
     * @type {Guid}
     */
    static IID := Guid("{59313e01-b36c-11cf-a539-00aa006887c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionTransmitter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Set                     : IntPtr
        GetPropagationTokenSize : IntPtr
        MarshalPropagationToken : IntPtr
        UnmarshalReturnToken    : IntPtr
        Reset                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionTransmitter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @param {ITransaction} pTransaction 
     * @returns {HRESULT} 
     */
    Set(pTransaction) {
        pTransactionMarshal := pTransaction == 0 ? IntPtr : "ptr"

        result := ComCall(3, this, pTransactionMarshal, pTransaction, "HRESULT")
        return result
    }

    /**
     * @returns {Integer} 
     */
    GetPropagationTokenSize() {
        result := ComCall(4, this, "uint*", &pcbToken := 0, "HRESULT")
        return pcbToken
    }

    /**
     * @param {Integer} cbToken 
     * @param {Pointer<Integer>} rgbToken 
     * @param {Pointer<Integer>} pcbUsed 
     * @returns {HRESULT} 
     */
    MarshalPropagationToken(cbToken, rgbToken, pcbUsed) {
        rgbTokenMarshal := rgbToken is VarRef ? "char*" : IntPtr
        pcbUsedMarshal := pcbUsed is VarRef ? "uint*" : IntPtr

        result := ComCall(5, this, UInt32, cbToken, rgbTokenMarshal, rgbToken, pcbUsedMarshal, pcbUsed, "HRESULT")
        return result
    }

    /**
     * @param {Integer} cbReturnToken 
     * @param {Pointer<Integer>} rgbReturnToken 
     * @returns {HRESULT} 
     */
    UnmarshalReturnToken(cbReturnToken, rgbReturnToken) {
        rgbReturnTokenMarshal := rgbReturnToken is VarRef ? "char*" : IntPtr

        result := ComCall(6, this, UInt32, cbReturnToken, rgbReturnTokenMarshal, rgbReturnToken, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    _Query(iid) {
        if (ITransactionTransmitter.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Set := CallbackCreate(ObjBindMethod(implObj, "Set"), flags, 2)
        this.vtbl.GetPropagationTokenSize := CallbackCreate(ObjBindMethod(implObj, "GetPropagationTokenSize"), flags, 2)
        this.vtbl.MarshalPropagationToken := CallbackCreate(ObjBindMethod(implObj, "MarshalPropagationToken"), flags, 4)
        this.vtbl.UnmarshalReturnToken := CallbackCreate(ObjBindMethod(implObj, "UnmarshalReturnToken"), flags, 3)
        this.vtbl.Reset := CallbackCreate(ObjBindMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Set)
        CallbackFree(this.vtbl.GetPropagationTokenSize)
        CallbackFree(this.vtbl.MarshalPropagationToken)
        CallbackFree(this.vtbl.UnmarshalReturnToken)
        CallbackFree(this.vtbl.Reset)
    }
}
