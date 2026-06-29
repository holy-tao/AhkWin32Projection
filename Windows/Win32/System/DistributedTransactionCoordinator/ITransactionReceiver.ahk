#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITransaction.ahk" { ITransaction }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct ITransactionReceiver extends IUnknown {
    /**
     * The interface identifier for ITransactionReceiver
     * @type {Guid}
     */
    static IID := Guid("{59313e03-b36c-11cf-a539-00aa006887c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITransactionReceiver interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UnmarshalPropagationToken : IntPtr
        GetReturnTokenSize        : IntPtr
        MarshalReturnToken        : IntPtr
        Reset                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITransactionReceiver.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cbToken 
     * @param {Pointer<Integer>} rgbToken 
     * @returns {ITransaction} 
     */
    UnmarshalPropagationToken(cbToken, rgbToken) {
        rgbTokenMarshal := rgbToken is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbToken, rgbTokenMarshal, rgbToken, "ptr*", &ppTransaction := 0, "HRESULT")
        return ITransaction(ppTransaction)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetReturnTokenSize() {
        result := ComCall(4, this, "uint*", &pcbReturnToken := 0, "HRESULT")
        return pcbReturnToken
    }

    /**
     * 
     * @param {Integer} cbReturnToken 
     * @param {Pointer<Integer>} rgbReturnToken 
     * @param {Pointer<Integer>} pcbUsed 
     * @returns {HRESULT} 
     */
    MarshalReturnToken(cbReturnToken, rgbReturnToken, pcbUsed) {
        rgbReturnTokenMarshal := rgbReturnToken is VarRef ? "char*" : "ptr"
        pcbUsedMarshal := pcbUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", cbReturnToken, rgbReturnTokenMarshal, rgbReturnToken, pcbUsedMarshal, pcbUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITransactionReceiver.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UnmarshalPropagationToken := CallbackCreate(GetMethod(implObj, "UnmarshalPropagationToken"), flags, 4)
        this.vtbl.GetReturnTokenSize := CallbackCreate(GetMethod(implObj, "GetReturnTokenSize"), flags, 2)
        this.vtbl.MarshalReturnToken := CallbackCreate(GetMethod(implObj, "MarshalReturnToken"), flags, 4)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UnmarshalPropagationToken)
        CallbackFree(this.vtbl.GetReturnTokenSize)
        CallbackFree(this.vtbl.MarshalReturnToken)
        CallbackFree(this.vtbl.Reset)
    }
}
